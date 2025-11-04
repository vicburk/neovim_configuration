-- Install termcolors
-- ~/.config/nvim/lua/plugins/termcolors.lua
return {
  {
    "psliwka/termcolors.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local termcolors = require("termcolors")
      local colorspace = require("utils.colorspace")
      local depth = colorspace.detect()

      if depth <= 16 then
        termcolors.setup({
          palette = {
            black = "#2A1C00", -- dark brown instead of true black
            red = "#72120B", -- your dark red
            green = "#2A6C16", -- your forest green
            yellow = "#E05707", -- warm orange as yellow
            blue = "#380185", -- deep indigo
            magenta = "#7B0086", -- purple accent
            cyan = "#00A09A", -- soft cyan variant
            white = "#FBE5AB", -- your beige background as “white”
          },
          background = "#FBE5AB",
          foreground = "#693801",
        })
        vim.cmd([[
          colorscheme default
          hi Normal guibg=#FBE5AB guifg=#693801
          hi CursorLine guibg=#FFFBC3
          hi Visual guibg=#D1ED8D
          hi Comment guifg=#380185
          hi Statement guifg=#72120B
        ]])
        vim.notify("Using 8-color fallback palette (Colab mode)", vim.log.levels.INFO)
      else
        -- Use your full theme normally
        require("autumn_vibe").colorscheme()
      end
    end,
  },
}
