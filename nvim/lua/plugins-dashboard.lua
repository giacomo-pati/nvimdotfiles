local M = {}

function M.setup(use)
  -- Dashboard
  -- use {
  --   "glepnir/dashboard-nvim",
  --   config = function()
  --     require("config.dashboard").setup()
  --   end,
  -- }
  -- use { "mhinz/vim-startify" }
  -- use {
  --   "startup-nvim/startup.nvim",
  --   config = function()
  --     require("startup").setup { theme = "evil" }
  --   end,
  -- }
  -- use {
  --   "echasnovski/mini.nvim",
  --   config = function()
  --     local starter = require "mini.starter"
  --     starter.setup {
  --       items = {
  --         starter.sections.telescope(),
  --       },
  --       content_hooks = {
  --         starter.gen_hook.adding_bullet(),
  --         starter.gen_hook.aligning("center", "center"),
  --       },
  --     }
  --   end,
  -- }
  -- use {
  --   "goolord/alpha-nvim",
  --   config = function()
  --     require("config.alpha").setup()
  --   end,
  -- }

  use {
    "nvim-lualine/lualine.nvim",
    after = "nvim-treesitter",
    config = function()
      require("config.lualine").setup()
    end,
  }

  use {
    "akinsho/nvim-bufferline.lua",
    config = function()
      require("config.bufferline").setup()
    end,
    event = "BufReadPre",
  }

  -- Filesystem
  use { "scrooloose/nerdtree", 
    config = function()
      require("config.nerdtree").setup()
    end,
  }

  use { "AckslD/nvim-neoclip.lua",
    config = function()
      require("neoclip").setup()
    end,
  }
end

return M
