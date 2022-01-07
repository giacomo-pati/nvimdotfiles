local M = {}

local plug_bootstrap = false

local function plug_init()
  local install_path = vim.fn.stdpath "data" .. "/site/autoload/plug.vim"
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    plug_bootstrap = vim.fn.system {
      "curl",
      "-fLo",
      install_path,
      "--create-dirs",
      "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim",
    }
    vim.cmd("autocmd VimEnter * PlugInstall | source $MYVIMRC")
  end
end

plug_init()

function M.setup()
  local function plugins(use)
    use "lewis6991/impatient.nvim"  -- speed up loading Lua modules
    use "wbthomason/packer.nvim"    -- plugin manager

    -- Development
    use "nvim-lua/plenary.nvim"
    use("lewis6991/gitsigns.nvim", {
      -- on = "BufReadPre",
      -- wants = "plenary.nvim",
      -- requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("gitsigns").setup()
      end,
    })
    use("TimUntersberger/neogit", {
      -- on = "Neogit",
      config = function()
        require("config.neogit").setup()
      end,
    })
    use("folke/which-key.nvim", {
      config = function()
        require("which-key").setup{}
      end,
    })

    -- Color scheme
    use("kyazdani42/nvim-web-devicons", {
      config = function()
        require("nvim-web-devicons").setup { default = true }
      end,
    })
    use("NLKNguyen/papercolor-theme", {
        config = function()
            vim.cmd("colorscheme PaperColor")
        end
    })
    -- use {
    --   "sainnhe/gruvbox-material",
    --   config = function()
    --     vim.cmd "colorscheme gruvbox-material"
    --   end,
    -- }

    -- Telescope
    use "nvim-lua/plenary.nvim" 
    use "BurntSushi/ripgrep"
    use("nvim-telescope/telescope-fzf-native.nvim", {
      ['do'] = "make",
    })
    use("nvim-telescope/telescope.nvim", {
      -- module = "telescope",
      as = "telescope",
      config = function()
        require("config.telescope").setup()
      end,
    })
    use "nvim-telescope/telescope-dap.nvim"

    -- Better syntax
    use "jose-elias-alvarez/nvim-lsp-ts-utils"
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "p00f/nvim-ts-rainbow"
    use("nvim-treesitter/playground", {
      -- on = "TSHighlightCapturesUnderCursor",
    })
    use "nvim-treesitter/nvim-treesitter-textobjects"
    use "RRethy/nvim-treesitter-textsubjects"
    use("windwp/nvim-autopairs", {
      ['do'] = "make",
      config = function()
        require("nvim-autopairs").setup {}
      end,
    })
    use("windwp/nvim-ts-autotag", {
      config = function()
        require("nvim-ts-autotag").setup { enable = true }
      end,
    })
    use("romgrk/nvim-treesitter-context", {
      config = function()
        require("treesitter-context.config").setup { enable = true }
      end,
    })
    use("mfussenegger/nvim-ts-hint-textobject", {
      config = function()
        vim.cmd [[omap     <silent> m :<C-U>lua require("tsht").nodes()<CR>]]
        vim.cmd [[vnoremap <silent> m :lua require("tsht").nodes()<CR>]]
      end,
    })
    use("nvim-treesitter/nvim-treesitter", {
      as = "nvim-treesitter",
      -- on = "BufRead",
      -- opt = true,
      ['do'] = ":TSUpdate",
      config = function()
        require("config.treesitter").setup()
      end,
    })

    -- LSP and completion
    use "williamboman/nvim-lsp-installer"
    use "jose-elias-alvarez/null-ls.nvim"
    use("neovim/nvim-lspconfig", {
      as = "nvim-lspconfig",
      -- after = { "nvim-treesitter", "telescope" },
      -- opt = true,
      config = function()
        require("config.lsp").setup()
        -- require("config.dap").setup()
      end,
    })
    
    -- Completion
    -- use { "nvim-lua/completion-nvim" }
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-nvim-lsp"
    use "quangnguyen30192/cmp-nvim-ultisnips"
    use "hrsh7th/cmp-nvim-lua"
    use "octaltree/cmp-look"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-calc"
    use "hrsh7th/cmp-cmdline"
    use "f3fora/cmp-spell"
    use "hrsh7th/cmp-emoji"
    use "ray-x/cmp-treesitter"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-nvim-lsp-document-symbol"
    use("hrsh7th/nvim-cmp", {
      config = function()
        require("config.cmp").setup()
      end,
    })
    use("tami5/lspsaga.nvim", {
      config = function()
        require("config.lspsaga").setup()
      end,
    })
    use("onsails/lspkind-nvim", {
      config = function()
        require("lspkind").init()
      end,
    })
    use("kshenoy/vim-signature", {
      -- on = "BufWinEnter" ,
    })
    use "ray-x/lsp_signature.nvim"
    -- For vsnip users.
    -- use { "hrsh7th/cmp-vsnip" }
    -- use { "hrsh7th/vim-vsnip" }

    -- For luasnip users.
    -- use { "L3MON4D3/LuaSnip" }
    -- use { "saadparwaiz1/cmp_luasnip" }

       -- Snippets
    use "SirVer/ultisnips"
    use "quangnguyen30192/cmp-nvim-ultisnips"

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
    use "tjdevries/nlua.nvim"
    use("folke/lua-dev.nvim", {
       event = "VimEnter",
    })
    use("simrat39/symbols-outline.nvim", {
      -- on = "VimEnter",
      config = function()
        require("config.symbols-outline").setup()
      end,
    })

    -- DAP
    use("mfussenegger/nvim-dap", {
      -- on = "BufWinEnter", 
      as = "nvim-dap" 
    })
    use "mfussenegger/nvim-dap-python"
    use("theHamsta/nvim-dap-virtual-text", {
      config = function()
        require("nvim-dap-virtual-text").setup {}
      end,
    })
    use "rcarriga/nvim-dap-ui"
    use "Pocco81/DAPInstall.nvim"
    use "jbyuki/one-small-step-for-vimkind"

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

    use("nvim-lualine/lualine.nvim", {
      config = function()
        require("config.lualine").setup()
      end,
    })

    use("akinsho/nvim-bufferline.lua", {
      config = function()
        require("config.bufferline").setup()
      end,
      -- on = "BufReadPre",
    })

    -- Filesystem
    use("scrooloose/nerdtree", {
      config = function()
        require("config.nerdtree").setup()
      end,
      -- on = "NERDTreeToggle",
    })

    -- Colorschemes

    use("AckslD/nvim-neoclip.lua", {
      config = function()
        require("neoclip").setup()
      end,
    })

    -- if plug_bootstrap then
    --   print "Setting up Neovim. Restart required after installation!"
    --   require("packer").sync()
    -- end
  end

  pcall(require, "impatient")
  -- pcall(require, "packer_compiled")
  vim.call('plug#begin', '~/.config/nvim/plugged')
  plugins(vim.fn['plug#'])
  vim.call('plug#end')
end

return M
