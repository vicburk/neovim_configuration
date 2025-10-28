return {
  {
    "airblade/vim-rooter",
    config = function()
      vim.g.rooter_patterns = {
        ".git",
        "pyproject.toml",
        "setup.py",
        "requirements.txt",
        ".venv",
        "venv",
      }
      vim.g.rooter_silent_chdir = true
      vim.g.rooter_resolve_links = true
    end,
  },
}
