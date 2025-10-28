return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {}, -- Microsoft's Python language server
        ruff_lsp = {}, -- Fast Python linter and formatter
      },
    },
  },
}
