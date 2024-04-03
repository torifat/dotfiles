return {
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzy-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzy_native")
      end,
    },
    opts = {
      defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        preview = {
          filesize_limit = 0.1, -- MB
          treesitter = false,
        },
        -- From custom configurationk
        sorting_strategy = "ascending",
        layout_strategy = "flex",
        layout_config = {
          horizontal = { preview_cutoff = 80, preview_width = 0.55 },
          vertical = { mirror = true, preview_cutoff = 25 },
          prompt_position = "top",
          width = 0.87,
          height = 0.80,
        },
      },
      extensions = {
        fzy_native = {
          override_generic_sorter = true,
          override_file_sorter = true,
        },
      },
      highlight = {
        enable = false,
      },
    },
  },
}
