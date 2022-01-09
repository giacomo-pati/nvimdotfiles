local M = {}

local packer_bootstrap = false

local function packer_init()
  local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packer_bootstrap = vim.fn.system {
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

  local function plugins(use)
    use { "lewis6991/impatient.nvim" } -- speed up loading Lua modules
    use { "wbthomason/packer.nvim" }   -- plugin manager

    -- Development
    require("plugins-development").setup(use)

    -- Color scheme
    require("plugins-colorscheme").setup(use)

    -- Dashboard
    require("plugins-dashboard").setup(use)

    -- Telescope
    require("plugins-telescope").setup(use)

    -- LSP and completion
    require("plugins-lsp").setup(use)
    
    -- Completion
    require("plugins-completion").setup(use)

    -- DAP
    require("plugins-dap").setup(use)

    -- Better syntax
    require("plugins-syntax").setup(use)

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
