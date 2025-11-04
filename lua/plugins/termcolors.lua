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
            red = "#ff5555",
            green = "#50fa7b",
            yellow = "#f1fa8c",
            blue = "#6272a4",
            magenta = "#ff79c6",
            cyan = "#8be9fd",
            white = "#bbbbbb",
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
