return {
	"neovim-treesitter/nvim-treesitter",
	dependencies = { "neovim-treesitter/treesitter-parser-registry" },
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")

		ts.setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		ts.install({ "lua", "go", "markdown", "markdown_inline" })

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "lua", "go", "markdown" },
			callback = function()
				pcall(vim.treesitter.start)
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.wo.foldmethod = "expr"
				vim.wo.foldlevel = 99
				vim.o.foldlevelstart = 99
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
