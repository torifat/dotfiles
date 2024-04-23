return {
  -- disable neo-tree
  -- { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  -- {
  --   "stevearc/oil.nvim",
  --   -- Optional dependencies
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   opts = {},
  --   keys = {
  --     {
  --       "<leader>e",
  --       function()
  --         local oil = require("oil")
  --         local current_dir = oil.get_current_dir()
  --         oil.open(current_dir)
  --       end,
  --       desc = "Toggle Oil",
  --     },
  --   },
  -- },
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
    opts = {
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
    },
  },
}
