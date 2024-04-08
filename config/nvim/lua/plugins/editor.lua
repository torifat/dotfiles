return {
  {
    "max397574/better-escape.nvim",
    opts = {},
  },
  {
    "lukas-reineke/headlines.nvim",
    opts = {
      markdown = {
        fat_headlines = true,
      },
    },
  },
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    keys = {
      {
        "<leader>uI",
        function()
          require("incline").toggle()
        end,
        desc = "Toggle Incline",
      },
    },
    config = function()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { default = true, group = "lualine_a_normal" },
            InclineNormalNC = { default = true, group = "Comment" },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { icon and " " or "" }, { filename } }
        end,
      })
    end,
  },
  {
    "folke/flash.nvim",
    enabled = true,
    ---@type Flash.Config
    opts = {
      modes = {
        treesitter_search = {
          label = {
            rainbow = { enabled = true },
          },
        },
      },
    },
  },
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "AckslD/muren.nvim",
    event = {
      { "BufNewFile", "BufAdd" },
    },
    opts = {
      patterns_width = 60,
      patterns_height = 20,
      options_width = 40,
      preview_height = 24,
    },
    cmd = "MurenToggle",
  },
}
