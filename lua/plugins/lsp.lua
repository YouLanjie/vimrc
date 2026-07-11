return {
	-- nvim的lsp服务支持
	{
		"neovim/nvim-lspconfig",
		config = function ()
			vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
			vim.lsp.enable('clangd')
			vim.lsp.enable('pyright')
			vim.lsp.enable('bashls')
			vim.lsp.enable('lua_ls')
			vim.lsp.config['lua_ls'] = {
				-- 从:h lsp抄的配置
				-- 记得跑：
				-- sudo pacman -S lua-language-server

				-- Command and arguments to start the server.
				cmd = { 'lua-language-server' },
				-- Filetypes to automatically attach to.
				filetypes = { 'lua' },
				-- Sets the "workspace" to the directory where any of these files is found.
				-- Files that share a root directory will reuse the LSP server connection.
				-- Nested lists indicate equal priority, see |vim.lsp.Config|.
				root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
				-- Specific settings to send to the server. The schema is server-defined.
				-- Example: https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
				settings = {
					Lua = {
						runtime = {
							version = 'LuaJIT',
						}
					}
				}
			}
		end,
	},
}
