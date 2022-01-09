local M = {}

function M.setup(use)
  -- use { "nvim-telescope/telescope.nvim" ,
  --   module = "telescope",
  --   as = "telescope",
  --   requires = {
  --     { "nvim-lua/plenary.nvim" },
  --     { "BurntSushi/ripgrep" },
  --     { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
  --   },
  --   config = function()
  --     require("config.telescope").setup()
  --   end,
  -- }
  -- use { "nvim-telescope/telescope-dap.nvim" }

  use { "nvim-lua/plenary.nvim" }
  use { "nvim-lua/popup.nvim" }
  use { "nvim-telescope/telescope.nvim",
    module = "telescope",
    as = "telescope",
    requires = {
      "nvim-telescope/telescope-project.nvim",
      "nvim-telescope/telescope-symbols.nvim",
      "nvim-telescope/telescope-media-files.nvim",
      "nvim-telescope/telescope-github.nvim",
      "fhill2/telescope-ultisnips.nvim",
      "cljoly/telescope-repo.nvim",
      "jvgrootveld/telescope-zoxide",
      "dhruvmanila/telescope-bookmarks.nvim",
      -- 'nvim-telescope/telescope-hop.nvim'
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      {
        "nvim-telescope/telescope-arecibo.nvim",
        rocks = { "openssl", "lua-http-parser" },
      },
      {
        "nvim-telescope/telescope-frecency.nvim",
        requires = { "tami5/sql.nvim" },
      },
      {
        "nvim-telescope/telescope-vimspector.nvim",
        event = "BufWinEnter",
      },
      { "nvim-telescope/telescope-dap.nvim" },
    },
    config = function()
      require("config.telescope").setup()
    end,
  }

end

return M
