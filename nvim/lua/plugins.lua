local M = {}

local packer_bootstrap = false

local function packer_init()
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    }
    vim.cmd [[packadd packer.nvim]]
  end
  vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
end

packer_init()

function M.setup()
  local conf = {
    compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  --[[
"Plug 'iCyMind/NeoSolarized'
"Plug 'sheerun/vim-polyglot'
""Plug 'tpope/vim-sleuth'             " Indentation management (favoring vim-polyglot)
"" Plug 'junegunn/limelight.vim'
"Plug 'ryanoasis/vim-devicons'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
""Plug 'junegunn/vim-easy-align'
""Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'neovim/nvim-lspconfig'        " Language Server Protocol
"Plug 'liuchengxu/vista.vim'         " Functions, Variablen anzeigen
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } " Markdown Preview
""Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
""Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"Plug 'fatih/vim-go', { 'tag': '*' }
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"Plug 'junegunn/fzf', { 'dir': stdpath('config') . '/fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
"Plug 'yegappan/mru'                 " Most Recently Used Ã¼ber :MRU 
"Plug 'rmagatti/auto-session'        " Session management
"Plug 'tpope/vim-fugitive'           " Git commands within vim
"Plug 'airblade/vim-gitgutter'       " Git changes on the gutter
"Plug 'Xuyuanp/nerdtree-git-plugin'  " NERDTree git changes
"" Plug 'aserowy/tmux.nvim'           " TMux integration
"" Plug 'nikvdp/neomux'
"" Plug 'akinsho/toggleterm.nvim'
--]]

  local function plugins(use)
    use { "lewis6991/impatient.nvim" } -- speed up loading Lua modules
    use { "wbthomason/packer.nvim" }   -- plugin manager
    -- use { 'iCyMind/NeoSolarized' }
    -- use { 'preservim/nerdtree' }
    -- use { 'Xuyuanp/nerdtree-git-plugin' }

    -- Development
    use { "tpope/vim-dispatch" }   -- Asynchronous build and test dispatcher
    use { "tpope/vim-fugitive" }   -- Fugitive is the premier Vim plugin for Git
    use { "tpope/vim-surround" }   -- About "surroundings": parentheses, brackets, ...
    use { "tpope/vim-rhubarb" }
    use { "tpope/vim-unimpaired" }
    use { "tpope/vim-vinegar" }
    use { "tpope/vim-sleuth" }
    --[[
    use { "rmagatti/auto-session", -- Session management
      config = function()
        require("config.auto-session").setup()
      end,
    }
    --]]
    use { 'ryanoasis/vim-devicons' }
    -- use { 'vim-airline/vim-airline' }
    -- use { 'vim-airline/vim-airline-themes' }
    use {
      "TimUntersberger/neogit",
      cmd = "Neogit",
      config = function()
        require("config.neogit").setup()
      end,
      requires = 'nvim-lua/plenary.nvim',
    }
    use {
      "nvim-lualine/lualine.nvim",
      event = "VimEnter",
      config = function()
        require("config.lualine").setup()
      end,
    }
    use {
      "folke/which-key.nvim",
      config = function()
        require("config.whichkey").setup()
      end,
    }

    -- Color scheme
    use {
      "kyazdani42/nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup { default = true }
      end,
    }
    use { "sainnhe/gruvbox-material" }
    use { "folke/tokyonight.nvim" }
    use { "joshdick/onedark.vim" }

    --[[
    --]]

    -- LSP config
    use { "williamboman/nvim-lsp-installer" }
    use { "jose-elias-alvarez/null-ls.nvim" }
    --[[
    use {
      "tamago324/nlsp-settings.nvim",
      -- event = "BufReadPre",
      config = function()
        require("config.nlsp-settings").setup()
      end,
    }
    --]]
    use {
      "neovim/nvim-lspconfig",
      config = function()
        require("config.lsp").setup()
        require("config.dap").setup()
      end,
    }

    -- Completion - use either one of this
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "quangnguyen30192/cmp-nvim-ultisnips",
        "hrsh7th/cmp-nvim-lua",
        "octaltree/cmp-look",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-calc",
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
    use {
      "tami5/lspsaga.nvim",
      config = function()
        require("config.lspsaga").setup()
      end,
    }
    use {
      "onsails/lspkind-nvim",
      config = function()
        require("lspkind").init()
      end,
    }
    use { "sbdchd/neoformat" }
    use { "ray-x/lsp_signature.nvim" }
    use { "szw/vim-maximizer" }
    use { "kshenoy/vim-signature" }
    use { "kevinhwang91/nvim-bqf" }
    use { "andymass/vim-matchup", event = "CursorMoved" }
    use {
      "folke/trouble.nvim",
      event = "VimEnter",
      cmd = { "TroubleToggle", "Trouble" },
      config = function()
        require("trouble").setup { auto_open = false }
      end,
    }
    use {
      "folke/todo-comments.nvim",
      cmd = { "TodoTrouble", "TodoTelescope" },
      config = function()
        require("todo-comments").setup {}
      end,
    }
    use {
      "nacro90/numb.nvim",
      config = function()
        require("numb").setup()
      end,
    }
    use { "junegunn/vim-easy-align" }
    use { "antoinemadec/FixCursorHold.nvim" }

    -- Better syntax
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require("config.treesitter").setup()
      end,
      requires = {
        { "jose-elias-alvarez/nvim-lsp-ts-utils" },
        { "JoosepAlviste/nvim-ts-context-commentstring" },
        { "p00f/nvim-ts-rainbow" },
        {
          "nvim-treesitter/playground",
          cmd = "TSHighlightCapturesUnderCursor",
        },
        {
          "nvim-treesitter/nvim-treesitter-textobjects",
        },
        { "RRethy/nvim-treesitter-textsubjects" },
        {
          "windwp/nvim-autopairs",
          run = "make",
          config = function()
            require("nvim-autopairs").setup {}
          end,
        },
        {
          "windwp/nvim-ts-autotag",
          config = function()
            require("nvim-ts-autotag").setup { enable = true }
          end,
        },
        {
          "romgrk/nvim-treesitter-context",
          config = function()
            require("treesitter-context.config").setup { enable = true }
          end,
        },
        {
          "mfussenegger/nvim-ts-hint-textobject",
          config = function()
            vim.cmd [[omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>]]
            vim.cmd [[vnoremap <silent> m :lua require('tsht').nodes()<CR>]]
          end,
        },
      },
    }
    
    -- Debugging
    -- use { "puremourning/vimspector", event = "BufWinEnter" }

    -- DAP
    use { "mfussenegger/nvim-dap" }
    use { "mfussenegger/nvim-dap-python" }
    use {
      "theHamsta/nvim-dap-virtual-text",
      config = function()
        require("nvim-dap-virtual-text").setup {}
      end,
    }
    use { "rcarriga/nvim-dap-ui" }
    use { "Pocco81/DAPInstall.nvim" }
    use { "jbyuki/one-small-step-for-vimkind" }
    
    -- Markdown
    use {
      "iamcco/markdown-preview.nvim",
      run = "cd app && yarn install",
      ft = "markdown",
      cmd = { "MarkdownPreview" },
    }
    use {
      "plasticboy/vim-markdown",
      event = "VimEnter",
      ft = "markdown",
      requires = { "godlygeek/tabular" },
    }

    -- Telescope
    use { "nvim-lua/plenary.nvim" }
    use { "nvim-lua/popup.nvim" }
    use {
      "nvim-telescope/telescope.nvim",
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

    -- Performance
    use { "tweekmonster/startuptime.vim" }
    use {
      "dstein64/vim-startuptime",
      cmd = "StartupTime",
      config = [[vim.g.startuptime_tries = 10]],
    }

    -- Clipboard
    use {
      "AckslD/nvim-neoclip.lua",
      config = function()
        require("neoclip").setup()
      end,
    }

    if packer_bootstrap then
      print "Setting up Neovim. Restart required after installation!"
      require("packer").sync()
    end
  end

  pcall(require, "impatient")
  pcall(require, "packer_compiled")
  require("packer").init(conf)
  require("packer").startup(plugins)
end

return M
