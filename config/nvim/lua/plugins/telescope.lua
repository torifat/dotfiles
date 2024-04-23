return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "ibhagwan/fzf-lua",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        local function title(str, opts)
          return vim.tbl_deep_extend("keep", opts or {}, {
            prompt = "❯ ",
            cwd_header = false,
            winopts = {
              title = { { " " .. str .. " ", "TelescopePromptTitle" } },
              -- title = " " .. str .. " ",
              title_pos = "center",
            },
          })
        end
        require("fzf-lua").setup({
          "telescope",
          winopts = {
            border = { " ", " ", " ", "", "", "", "", "" },
            preview = {
              border = "noborder",
              scrollbar = false,
              -- scrolloff = "-2",
              title_pos = "center",
            },
          },
          fzf_opts = {
            ["--layout"] = "reverse",
            ["--info"] = "inline",
            ["--border"] = "none",
            ["--margin"] = "0",
            ["--padding"] = "1,2",
            ["--header"] = "Hello",
          },
          hls = {
            preview_title = "FzfPreviewTitle",
          },
          fzf_colors = {
            ["info"] = { "fg", "FzfSubtleText" },
            ["prompt"] = { "fg", "FzfSubtleText" },
            ["header"] = { "fg", "FzfSubtleText" },
          },
          files = title("Find Files", {
            fzf_opts = {
              ["--ansi"] = false,
              ["--info"] = false,
              ["--header"] = false,
            },
            actions = {
              ["default"] = require("fzf-lua").actions.file_edit,
              ["ctrl-y"] = function(selected, opts)
                require("fzf-lua").actions.file_edit(selected, opts)
              end,
            },
          }),
          defaults = {
            git_icons = false,
            file_icons = false,
            cwd_header = false,
          },
        })
      end,
    },
    opts = {
      defaults = {
        -- From custom configuration
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
      highlight = {
        enable = false,
      },
    },
    keys = {
      { "<leader>ff", "<cmd> FzfLua files<cr>", desc = "find files (root dir)" },
      { "<leader>fF", "<cmd> lua require('fzf-lua').files({ cwd = vim.uv.cwd() })<cr>", desc = "find files (cwd)" },
      { "<leader>sg", "<cmd> lua require('fzf-lua').live_grep_native({})<cr>", desc = "Grep (Root Dir)" },
    },
  },
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      opts = {
        defaults = {
          file_ignore_patterns = { "node_modules", ".git" },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
            "--glob=!.git/",
          },
          buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
          preview = {
            treesitter = false, -- Disable treesitter for preview
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      },
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
}
