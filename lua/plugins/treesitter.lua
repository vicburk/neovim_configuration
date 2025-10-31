return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    opts = function(_, opts)
      -- Add the R parser to the list of languages that should be automatically installed.
      vim.list_extend(opts.ensure_installed, {
        "r",
        "markdown",
      })
    end,
  },
}
