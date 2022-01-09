local M = {}

function M.setup(use)
  -- Completion
  use { "hrsh7th/nvim-cmp",
    after = "nvim-treesitter",
    opt = true,
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "quangnguyen30192/cmp-nvim-ultisnips",
      "hrsh7th/cmp-nvim-lua",
      "octaltree/cmp-look",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-cmdline",
      "f3fora/cmp-spell",
      "hrsh7th/cmp-emoji",
      "ray-x/cmp-treesitter",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
    },
    config = function()
      require("config.cmp").setup()
    end,
  }
  use { "tami5/lspsaga.nvim",
    config = function()
      require("config.lspsaga").setup()
    end,
  }
  use { "onsails/lspkind-nvim",
    config = function()
      require("lspkind").init()
    end,
  }
  use { "kshenoy/vim-signature", event = "BufWinEnter" }
  use { "ray-x/lsp_signature.nvim" }
  -- For vsnip users.
  -- use { "hrsh7th/cmp-vsnip" }
  -- use { "hrsh7th/vim-vsnip" }

  -- For luasnip users.
  -- use { "L3MON4D3/LuaSnip" }
  -- use { "saadparwaiz1/cmp_luasnip" }

      -- Snippets
  use { "SirVer/ultisnips" }
  use { "quangnguyen30192/cmp-nvim-ultisnips" }

  -- For snippy users.
  -- use { "dcampos/nvim-snippy" }
  --use { "dcampos/cmp-snippy" }

  -- use {
  --   "SirVer/ultisnips",
  --   requires = { { "honza/vim-snippets", rtp = "." }, "mlaursen/vim-react-snippets" },
  --   config = function()
  --     vim.g.UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
  --     vim.g.UltiSnipsExpandTrigger = "<tab>"
  --     vim.g.UltiSnipsJumpForwardTrigger = "<Plug>(ultisnips_jump_forward)"
  --     vim.g.UltiSnipsJumpBackwardTrigger = "<Plug>(ultisnips_jump_backward)"
  --     vim.g.UltiSnipsListSnippets = "<c-x><c-s>"
  --     vim.g.UltiSnipsRemoveSelectModeMappings = 0
  --     vim.opt.completeopt = "menuone,noinsert,noselect"
  --     vim.g.completion_confirm_key = ""
  --     vim.g.completion_matching_strategy_list = {"exact", "substring", "fuzzy"}
  --     vim.g.diagnostic_enable_virtual_text = 1
  --     vim.g.completion_enable_snippet = "UltiSnips"
  --     vim.g.completion_enable_auto_popup = 1
  --     vim.g.completion_enable_auto_hover = 1
  --     vim.g.completion_enable_auto_signature = 0
  --     vim.g.completion_matching_smart_case = 1
  --   end,
  -- }

  -- Lua development
  use { "tjdevries/nlua.nvim" }
  use { "folke/lua-dev.nvim", event = "VimEnter" }
  use {
    "simrat39/symbols-outline.nvim",
    event = "VimEnter",
    config = function()
      require("config.symbols-outline").setup()
    end,
  }
end

return M
