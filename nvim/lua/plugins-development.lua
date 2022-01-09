local M = {}

function M.setup(use)
  use { "lewis6991/gitsigns.nvim",
    -- event = "BufReadPre",
    -- wants = "plenary.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup()
    end,
  }
  use {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    config = function()
      require("config.neogit").setup()
    end,
  }
  use { "folke/which-key.nvim",
    config = function()
      require("which-key").setup{}
    end,
  }
end

return M
