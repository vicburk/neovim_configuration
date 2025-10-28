return {
  "Vigemus/iron.nvim",
  config = function()
    local iron = require("iron.core")

    -- Function to get Python REPL command
    local function get_python_repl()
      local venv_path = vim.env.VIRTUAL_ENV

      if venv_path then
        local ipython_path = venv_path .. "/bin/ipython"
        local python_path = venv_path .. "/bin/python"

        if vim.fn.executable(ipython_path) == 1 then
          return { ipython_path, "--no-autoindent" }
        elseif vim.fn.executable(python_path) == 1 then
          return { python_path, "-i" }
        end
      end

      if vim.fn.executable("ipython") == 1 then
        return { "ipython", "--no-autoindent" }
      elseif vim.fn.executable("python3") == 1 then
        return { "python3", "-i" }
      else
        return { "python", "-i" }
      end
    end

    iron.setup({
      config = {
        scratch_repl = true,
        repl_definition = {
          python = {
            command = get_python_repl,
            format = require("iron.fts.common").bracketed_paste,
          },
          r = {
            command = { "radian" },
            format = require("iron.fts.common").bracketed_paste,
          },
        },
        repl_open_cmd = require("iron.view").split.horizontal.botright(0.3),
      },
      keymaps = {
        send_motion = "<space>sc",
        send_file = "<space>sf",
        send_line = "<space>sl",
        send_mark = "<space>sm",
        mark_motion = "<space>mc",
        mark_visual = "<space>mv",
        remove_mark = "<space>md",
        cr = "<space>s<cr>",
        interrupt = "<space>s<space>",
        exit = "<space>sq",
        clear = "<space>cl",
      },
    })

    -- Function to change REPL working directory to current file's directory
    local function change_repl_dir()
      local file_dir = vim.fn.expand("%:p:h")
      if vim.fn.isdirectory(file_dir) == 0 then
        vim.notify("Invalid directory: " .. file_dir, vim.log.levels.ERROR)
        return
      end

      -- Send the cd command to the Python REPL
      iron.send(nil, string.format("import os; os.chdir(r'%s')", file_dir))
      vim.notify("REPL working directory changed to: " .. file_dir)
    end

    -- Custom function to open REPL and change directory
    local function open_repl_here()
      -- First open the REPL
      iron.repl_for(vim.bo.filetype)

      -- Wait a moment for REPL to be ready, then change directory
      vim.defer_fn(change_repl_dir, 1000)
    end

    -- Add keymaps
    vim.keymap.set("n", "<space>ro", open_repl_here, { desc = "Open REPL in current file dir" })
    vim.keymap.set("n", "<space>cd", change_repl_dir, { desc = "Change REPL dir to current file dir" })

    -- Optional: Auto-change directory when opening REPL normally
    local group = vim.api.nvim_create_augroup("IronCustomDir", { clear = true })
    vim.api.nvim_create_autocmd("User", {
      pattern = "IronReplOpened",
      group = group,
      callback = function()
        vim.defer_fn(change_repl_dir, 1000) -- 1 second delay to ensure REPL is ready
      end,
    })
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
