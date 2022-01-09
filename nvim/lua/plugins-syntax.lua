local M = {}

function M.setup(use)
  -- Better syntax
  use { "nvim-treesitter/nvim-treesitter",
    as = "nvim-treesitter",
    -- event = "BufRead",
    -- opt = true,
    run = ":TSUpdate",
    config = function()
      require("config.treesitter").setup()
    end,
    requires = {
      { "jose-elias-alvarez/nvim-lsp-ts-utils" },
      { "JoosepAlviste/nvim-ts-context-commentstring" },
      { "p00f/nvim-ts-rainbow" },
      { "nvim-treesitter/playground",
        cmd = "TSHighlightCapturesUnderCursor",
      },
      { "nvim-treesitter/nvim-treesitter-textobjects" },
      { "RRethy/nvim-treesitter-textsubjects" },
      { "windwp/nvim-autopairs",
        run = "make",
        config = function()
          require("nvim-autopairs").setup {}
        end,
      },
      { "windwp/nvim-ts-autotag",
        config = function()
          require("nvim-ts-autotag").setup { enable = true }
        end,
      },
      { "romgrk/nvim-treesitter-context",
        config = function()
          require("treesitter-context.config").setup { enable = true }
        end,
      },
      { "mfussenegger/nvim-ts-hint-textobject",
        config = function()
          vim.cmd [[omap     <silent> m :<C-U>lua require("tsht").nodes()<CR>]]
          vim.cmd [[vnoremap <silent> m :lua require("tsht").nodes()<CR>]]
        end,
      },
    },
  }
end

return M
