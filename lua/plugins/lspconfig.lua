-- plugins/lspconfig.lua
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup()
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()
		local servers = { "lua_ls", "gopls", "clangd" }
		mason_lspconfig.setup({
			ensure_installed = servers,
			automatic_enable = false, -- we'll enable ourselves after applying config
		})
		-- Apply shared capabilities to all servers
		for _, server in ipairs(servers) do
			vim.lsp.config(server, {
				capabilities = capabilities,
			})
		end
		-- Server-specific override
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
						path = vim.split(package.path, ";"),
					},
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})
		-- Enable configs
		for _, server in ipairs(servers) do
			vim.lsp.enable(server)
		end
	end,
}
