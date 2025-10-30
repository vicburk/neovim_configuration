local M = {}

local colors = {
  bg = "#FBE5AB",
  fg = "#693801",
  indigo = "#380185",
  red = "#72120B",
  brightred = "#E40101",
  purple = "#7B0086",
  orange = "#E05707",
  green = "#2A6C16",
  highlight = "#FFFBC3",
  visual = "#D1ED8D",
  cursor = "#FAFF5D",
  classicmagenta = "#FF00E1",
  classicgreen = "#71A626",
  classicorange = "#FF9D00",
  classicblue = "#000DFF",
  classicviolet = "#BF00FF",
  classiccyan = "#00FFFF",
}

function M.colorscheme()
  vim.cmd("highlight clear")
  vim.cmd("syntax reset")
  vim.o.background = "light"
  vim.g.colors_name = "autumn_vibe"

  local set = vim.api.nvim_set_hl

  -- Base UI
  set(0, "Normal", { fg = colors.fg, bg = colors.bg })
  set(0, "Visual", { fg = colors.fg, bg = colors.visual })
  set(0, "CursorLine", { fg = colors.fg, bg = colors.highlight })
  set(0, "Statement", { fg = colors.red, bold = true })
  set(0, "Constant", { fg = colors.purple })
  set(0, "Comment", { fg = colors.indigo })
  set(0, "Special", { fg = colors.green })
  set(0, "Cursor", { background = colors.cursor })
  set(0, "LineNr", { fg = colors.red })
  set(0, "CursorLineNr", { fg = colors.brightred, bold = true })
  set(0, "Menu", { fg = colors.fg, bg = colors.bg })

  -- Popup Menu
  set(0, "Pmenu", { fg = colors.fg, bg = colors.bg })
  set(0, "PmenuSel", { fg = colors.fg, bg = colors.highlight })
  set(0, "PmenuBorder", { fg = colors.purple })

  -- Float
  set(0, "NormalFloat", { fg = colors.fg, bg = colors.highlight })
  set(0, "FloatBorder", { fg = colors.purple })

  -- Search
  set(0, "IncSearch", { fg = colors.fg, bg = colors.highlight })
  set(0, "CurSearch", { fg = colors.fg, bg = colors.highlight })

  -- RainbowDelimiter
  set(0, "RainbowDelimiterRed", { fg = colors.brightred })
  set(0, "RainbowDelimiterYellow", { fg = colors.purple })
  set(0, "RainbowDelimiterGreen", { fg = colors.classicgreen })
  set(0, "RainbowDelimiterOrange", { fg = colors.classicorange })
  set(0, "RainbowDelimiterBlue", { fg = colors.classicblue })
  set(0, "RainbowDelimiterViolet", { fg = colors.purple })
  set(0, "RainbowDelimiterCyan", { fg = colors.classiccyan })
end

return M
