-- Install termcolors

return {
  {
    "psliwka/termcolors.nvim",
    config = function()
      local colorspace = require("utils.colorspace")
      local depth = colorspace.detect()
      local termcolors = require("termcolors")

      if depth <= 16 then
        -- Create an 8-color fallback palette that resembles your main scheme
        termcolors.setup({
          palette = {
            black = "#000000",
            red = "#aa0000",
            green = "#00aa00",
            yellow = "#aa5500",
            blue = "#0000aa",
            magenta = "#aa00aa",
            cyan = "#00aaaa",
            white = "#aaaaaa",
          },
        })
        vim.notify("Using 8-color fallback palette", vim.log.levels.INFO)
      else
        -- Use normal colors (your theme)
        vim.notify("Using full 256-color or truecolor theme", vim.log.levels.INFO)
      end
    end,
  },
}
