return {
  {
    "NeogitOrg/neogit",
    opts = {},
    keys = {
      {
        "<leader>gn",
        function()
          require("neogit").open()
        end,
        desc = "Neogit",
      },
    },
  },
  {
    "ThePrimeagen/git-worktree.nvim",
    opts = {},
    config = function()
      require("telescope").load_extension("git_worktree")
    end,
    keys = {
      {
        "<leader>gw",
        function()
          require("telescope").extensions.git_worktree.git_worktrees()
        end,
        desc = "Switch Worktree",
      },
    },
  },
  "f-person/git-blame.nvim",
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    opts = {},
    keys = { { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "DiffView" } },
  },
}
