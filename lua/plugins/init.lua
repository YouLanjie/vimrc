return {
	{ "tanvirtin/monokai.nvim", lazy = false, priority = 1000 },
	-- { "folke/tokyonight.nvim" },
	{
		"nvim-lualine/lualine.nvim",
		opts = {
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
		},
	},
	-- 自动补全另一半
	{
		"windwp/nvim-autopairs",
		opts = {
			fast_wrap = {},
			disable_filetype = { "TelescopePrompt", "vim" },
		},
	},
	-- 一个显示TAG的插件
	{
		"liuchengxu/vista.vim",
		keys = {
			{ "<F2>", ":Vista<cr>", mode = "n" },
			{ "<leader><leader>t", ":Vista<cr>", mode = "n" }
		}
	},
	-- 撤销树
	{ "mbbill/undotree", keys = { {"<F3>", ":UndotreeToggle<cr>", mode = "n"} } },
	-- 快速注释
	{
		"nvim-mini/mini.comment",
		opts = {
			mappings = {
				comment_line = "'",
				comment_visual = "'",
			},
		},
	},
	-- 按键显示
	{ "folke/which-key.nvim" },
	-- 对齐 EasyAlign
	{ "junegunn/vim-easy-align" },
	-- 背景透明
	{ "xiyaowong/transparent.nvim", keys = { {"<F4>", ":TransparentToggle<cr>", mode = "n"} }, lazy = false },
	{
		"danymat/neogen",
		config = function()
		require('neogen').setup({
			snippet_engine = "luasnip",
		})
		-- 设置快捷键，比如在函数上按 <Leader>d 生成
		vim.keymap.set('n', '<Leader><Leader>d', function() require('neogen').generate() end, { desc = 'Generate annotation' })
		end,
	},
	-- org支持(改到opt下)
	-- { "nvim-orgmode/orgmode" },
}
