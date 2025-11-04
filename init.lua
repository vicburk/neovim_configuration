-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.swapfile = false

-- In your init.lua
local function setup_autumn_vibe()
  local depth = tonumber(vim.fn.system("tput colors")) or 8

  if depth < 16 then
    -- Google Colab (8-color mode)
    vim.opt.termguicolors = false
    vim.cmd("highlight clear")
    vim.cmd("syntax reset")
    vim.g.colors_name = "autumn_vibe_colab"

    local set = vim.api.nvim_set_hl

    -- ANSI color slots:
    -- 0=black, 1=red, 2=green, 3=yellow, 4=blue, 5=magenta, 6=cyan, 7=white
    set(0, "Normal", { ctermfg = 0, ctermbg = 3 }) -- brown on yellow
    set(0, "Visual", { ctermbg = 2 })
    set(0, "CursorLine", { ctermbg = 7 })
    set(0, "Comment", { ctermfg = 4 })
    set(0, "Statement", { ctermfg = 1, bold = true })
    set(0, "Constant", { ctermfg = 5 })
    set(0, "Special", { ctermfg = 2 })
    set(0, "LineNr", { ctermfg = 1 })
    set(0, "CursorLineNr", { ctermfg = 1, bold = true })

    vim.notify("🟡 Using autumn_vibe (8-color fallback mode)", vim.log.levels.INFO)
  else
    -- Full palette (local)
    vim.opt.termguicolors = true
    require("autumn_vibe").colorscheme()
    vim.notify("🍂 Using autumn_vibe (256-color mode)", vim.log.levels.INFO)
  end
end

-- Call it after other plugins are loaded
vim.api.nvim_create_autocmd("VimEnter", {
  callback = setup_autumn_vibe,
})
