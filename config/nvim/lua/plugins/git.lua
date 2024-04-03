return {
  {
    "NeogitOrg/neogit",
    opts = {},
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
}
