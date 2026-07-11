return {
	-- 代码检查 (仅非 LSP 检查)
	"mfussenegger/nvim-lint",
	config = function ()
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
				"--checks=clang-analyzer*,-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling",
			}),
			stream = "stdout",
			ignore_exitcode = true,
			parser = require("lint.parser").from_pattern(
				"([^:]+):(%d+):(%d+):%s+(.-):%s+(.*)",
				{ "source", "lnum", "col", "severity", "message" }
			),
		}
	end,
}
