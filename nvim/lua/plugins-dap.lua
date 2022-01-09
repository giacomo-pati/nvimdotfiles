local M = {}

function M.setup(use)
  -- DAP
  use { "mfussenegger/nvim-dap", event = "BufWinEnter", as = "nvim-dap" }
  use { "mfussenegger/nvim-dap-python", after = "nvim-dap" }
  use { "theHamsta/nvim-dap-virtual-text",
    after = "nvim-dap",
    config = function()
      require("nvim-dap-virtual-text").setup {}
    end,
  }
  use { "rcarriga/nvim-dap-ui", after = "nvim-dap" }
  use { "Pocco81/DAPInstall.nvim", after = "nvim-dap"}
  use { "jbyuki/one-small-step-for-vimkind", after = "nvim-dap" }
end

return M
