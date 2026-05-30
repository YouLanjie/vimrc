-- ===================
-- nvim-cmp配置
-- ===================
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		-- 常用映射
		-- ["<C-k>"] = cmp.mapping.select_prev_item(), -- 上一个
		-- ["<C-j>"] = cmp.mapping.select_next_item(), -- 下一个
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),    -- 手动触发补全
		["<C-e>"] = cmp.mapping.abort(),           -- 关闭补全窗
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- 回车选中
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },      -- LSP
		{ name = "luasnip" },       -- 片段
		{ name = "buffer" },        -- 缓冲区词
		{ name = "path" },          -- 路径
	}, {
		{ name = "buffer" },        -- 后备源
	}),
	-- 可选：按类型加图标（需 lspkind）
	formatting = {
		format = require("lspkind").cmp_format({ with_text = true }),
	},
	-- 可调节窗口样式
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
})

-- 命令行补全（单独配置）
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = { { name = "buffer" } },
})
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({ { name = "cmdline" } }),
})

-- ===================
-- lspconfig配置
-- ===================
vim.lsp.enable('clangd')
vim.lsp.enable('pyright')

-- ===================
-- nvim-lint配置
-- ===================
-- 加载 lint 模块
local lint = require('lint')
-- 为不同文件类型指定 linter（根据你已安装的工具）
lint.linters_by_ft = {
	javascript = {'eslint'},
	typescript = {'eslint'},
	python = {'pylint'},        -- 或 flake8、mypy
	go = {'golangci_lint'},     -- 需要安装 golangci-lint
	lua = {'luacheck'},
	bash = {'shellcheck'},
	markdown = {'markdownlint'},
	dockerfile = {'hadolint'},
	c = {'clangtidy'},
	-- 更多自定义...
}
-- 安全触发lint
local function try_lint_safe()
	local ft = vim.bo.filetype
	local linter_name = (lint.linters_by_ft[ft] or {})[1]
	if not linter_name then return end

	local linter = lint.linters[linter_name]
	if not linter or not linter.cmd then return end

	local cmd = type(linter.cmd) == 'function' and linter.cmd() or linter.cmd
	if vim.fn.executable(cmd) ~= 1 then return end

	lint.try_lint(linter_name)
end
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, { callback = try_lint_safe, })
-- 获取内置 clangtidy 的默认参数（如果存在）
local default_args = lint.linters.clangtidy and lint.linters.clangtidy.args or {}
lint.linters.clangtidy = {
	cmd = "clang-tidy",
	args = vim.list_extend(default_args, {
		"--checks=-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling",
	}),
	stream = "stdout",
	ignore_exitcode = true,
	parser = require("lint.parser").from_pattern(
		"([^:]+):(%d+):(%d+):%s+(.-):%s+(.*)",
		{ "source", "lnum", "col", "severity", "message" }
	),
}

-- ===================
-- lualine配置
-- ===================
require('lualine').setup({
	options = {
		theme = "auto",
		-- section_separators = "",
		-- component_separators = "",
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch' },
		lualine_c = { 'filename' },
		lualine_x = { 'encoding', 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { 'location', 'diagnostics' },   -- 添加 diagnostics 组件
	},
	tabline = {
		lualine_a = {
			{ "buffers", buffers_color = {
				-- 当前 buffer 背景亮色
				active = { bg = '#b65619', fg = '#FFFFFF' },
				-- 其他 buffer 背景暗色
				inactive = { bg = '#2A2A2A', fg = '#AAAAAA' },
			},}
		},
		lualine_z = {"tabs"},
	},
})

-- ===================
-- 片段补全配置
-- ===================
require('luasnip').setup({})
require("luasnip.loaders.from_vscode").lazy_load()  -- 加载friendly-snippets
local ls = require("luasnip")
-- 插入模式下：Tab 向前跳转 / 如果没有可跳转则尝试展开 snippet
vim.keymap.set({"i", "s"}, "<C-j>", function() if ls.expand_or_jumpable() then ls.expand_or_jump() end end, { silent = true })
-- Shift+Tab 向后跳转
vim.keymap.set({"i", "s"}, "<C-k>", function() if ls.jumpable(-1) then ls.jump(-1) end end, { silent = true })

-- ===================
-- 其他配置
-- ===================
-- 在光标停留时自动显示浮窗（延迟300ms）
vim.diagnostic.config({
	float = {
		source = true,   -- 显示诊断来源（LSP或lint）
	},
	virtual_text = true,   -- 行尾显示错误文本
	signs = true,          -- 左侧图标
	underline = true,      -- 错误波浪线
	update_in_insert = false,
})
-- 启用光标停留触发浮窗
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, { focusable = false, scope = "cursor" })
	end,
})
require('nvim-autopairs').setup({
	fast_wrap = {},
	disable_filetype = { "TelescopePrompt", "vim" },
})
require('Comment').setup({
	toggler = {
		line = "'"
	},
	opleader = {
		block = "'"
	}
})  -- 快捷键：gcc行内 gbc行间
