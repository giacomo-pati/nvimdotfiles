local M = {}

function M.setup(use)
  -- LSP and completion
  use { "williamboman/nvim-lsp-installer" }
  use { "jose-elias-alvarez/null-ls.nvim" }
  use { "neovim/nvim-lspconfig",
    as = "nvim-lspconfig",
    -- after = { "nvim-treesitter", "telescope" },
    after = "nvim-treesitter",
    opt = true,
    config = function()
      require("config.lsp").setup()
      -- require("config.dap").setup()
    end,
  }        
  -- use { "nvim-lua/completion-nvim" }
  
end

return M
