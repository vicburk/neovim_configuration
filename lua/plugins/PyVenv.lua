return {
  {
    "AckslD/swenv.nvim",
    config = function()
      require("swenv").setup({
        -- Tell swenv where to look for virtual environments
        get_venvs = function()
          local venvs = {}
          local current_dir = vim.fn.getcwd()

          -- Look for common venv directory names in current directory
          local venv_names = { ".venv", "venv", "env", ".env" }

          for _, name in ipairs(venv_names) do
            local path = current_dir .. "/" .. name
            if vim.fn.isdirectory(path) == 1 then
              -- Check if it's actually a Python venv by looking for bin/python
              local python_path = path .. "/bin/python"
              if vim.fn.executable(python_path) == 1 then
                table.insert(venvs, {
                  name = name,
                  path = path,
                })
              end
            end
          end

          -- Also look for venvs in parent directories
          local parent_dir = vim.fn.fnamemodify(current_dir, ":h")
          while parent_dir ~= current_dir do
            for _, name in ipairs(venv_names) do
              local path = parent_dir .. "/" .. name
              if vim.fn.isdirectory(path) == 1 then
                local python_path = path .. "/bin/python"
                if vim.fn.executable(python_path) == 1 then
                  table.insert(venvs, {
                    name = vim.fn.fnamemodify(parent_dir, ":t") .. "/" .. name,
                    path = path,
                  })
                end
              end
            end
            current_dir = parent_dir
            parent_dir = vim.fn.fnamemodify(current_dir, ":h")
          end

          return venvs
        end,
        post_set_venv = function()
          vim.cmd("LspRestart")
        end,
      })
    end,
    keys = {
      {
        "<leader>vs",
        function()
          require("swenv.api").pick_venv()
        end,
        desc = "Select Python venv",
      },
    },
  },
}
