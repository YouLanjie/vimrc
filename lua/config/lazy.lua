-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local choice = vim.fn.confirm(
		"lazy.nvim 管理器本体未安装，是否下载？",
		"&Y\n&n",
		1
	)
	if choice == 2 then
		print("已跳过lazy.nvim的安装")
		return
	end
	local lazyrepo = "git@github.com:folke/lazy.nvim.git"
	print("将安装lazy.nvim，期间不会有输出提示，请耐心等待")
	vim.cmd('!git clone --filter=blob:none --branch=stable "'..lazyrepo..'" "'..lazypath..'"')
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- 导入插件
		{ import = "plugins" },
	},
	git = {
		url_format = "git@github.com:%s.git"
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})
