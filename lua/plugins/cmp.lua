return {
	-- 自动补全
	"hrsh7th/nvim-cmp",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },      -- LSP 来源
		{ "hrsh7th/cmp-buffer" },        -- 当前缓冲区
		{ "hrsh7th/cmp-path" },          -- 文件路径
		{ "hrsh7th/cmp-cmdline" },       -- 命令行补全（可选）
		{ "saadparwaiz1/cmp_luasnip" },  -- 片段来源
		{ "onsails/lspkind.nvim" },      -- 可选：额外美观
		{
			"L3MON4D3/LuaSnip",  -- 片段引擎
			dependencies = {
				{ "rafamadriz/friendly-snippets" },
			},
			config = function()
				local luasnip = require("luasnip")
				luasnip.setup({})
				require("luasnip.loaders.from_vscode").lazy_load()  -- 加载friendly-snippets
				-- 插入模式下：Tab 向前跳转 / 如果没有可跳转则尝试展开 snippet
				vim.keymap.set({"i", "s"}, "<C-j>", function() if luasnip.expand_or_jumpable() then luasnip.expand_or_jump() end end, { silent = true })
				-- Shift+Tab 向后跳转
				vim.keymap.set({"i", "s"}, "<C-k>", function() if luasnip.jumpable(-1) then luasnip.jump(-1) end end, { silent = true })
			end,
		},
	},
	config = function ()
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
			--[[ window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			}, ]]
		})

		-- 命令行补全（单独配置）
		cmp.setup.cmdline("/", {
			-- 关闭自动补全防止与只是上下切换历史就进了补全(TAB仍旧会手动触发)
			completion = { autocomplete = false },
			mapping = cmp.mapping.preset.cmdline(),
			sources = { { name = "buffer" } },
		})
		cmp.setup.cmdline(":", {
			-- 在:下可以自动弹出补全
			-- completion = { autocomplete = false },
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({ { name = "cmdline" } }),
		})


		-- 在光标停留时自动显示浮窗
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
	end,
}
