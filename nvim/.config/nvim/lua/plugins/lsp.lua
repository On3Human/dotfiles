return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "pyright", "ruff" },
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		vim.lsp.config("pyright", { capabilities = capabilities })
		vim.lsp.config("lua_ls", { capabilities = capabilities })
		vim.lsp.enable({ "lua_ls", "pyright" })
	end,
}
