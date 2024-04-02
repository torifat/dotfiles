return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      integrations = {
        fidget = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = true,
        },
        telescope = {
          enabled = true,
          style = "nvchad",
        },
        lsp_trouble = true,
        dropbar = {
          enabled = true,
          color_mode = true,
        },
      },
    },
  },
}
