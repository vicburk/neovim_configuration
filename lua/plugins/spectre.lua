return {
  "nvim-pack/nvim-spectre",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("spectre").setup({
      -- Delay ALL keymaps until after plugin loading is complete
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          local keymaps = {
            {
              "<leader>sf",
              function()
                require("spectre").open_file_search({ select_word = true })
              end,
              "🔎 Search current word in files",
            },
            {
              "<leader>sr",
              function()
                require("spectre").toggle()
              end,
              "🌍 Toggle search and replace",
            },
          }

          -- Set all keymaps with consistent options
          for _, km in ipairs(keymaps) do
            vim.keymap.set("n", km[1], km[2], { desc = km[3], silent = true, remap = false })
          end
        end,
      }),
    })
  end,
}
