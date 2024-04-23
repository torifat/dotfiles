return {
  {
    "max397574/better-escape.nvim",
    opts = {},
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
  {
    "folke/twilight.nvim",
    opts = {},
  },
  {
    "smjonas/inc-rename.nvim",
    config = true,
    keys = {
      {
        "<leader>rn",
        function()
          return ":IncRename " .. vim.fn.expand("<cword>")
        end,
        expr = true,
        desc = "Rename",
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-nvim-lua" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "nvim_lua" })
    end,
  },
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {},
  },
}
