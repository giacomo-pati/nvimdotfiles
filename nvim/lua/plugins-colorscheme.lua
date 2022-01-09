local M = {}

function M.setup(use)
  -- Color scheme
  use {
    "kyazdani42/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup { default = true }
    end,
  }
  use { "NLKNguyen/papercolor-theme",
      config = function()
          vim.cmd("colorscheme PaperColor")
      end
  }
  -- use {
  --   "sainnhe/gruvbox-material",
  --   config = function()
  --     vim.cmd "colorscheme gruvbox-material"
  --   end,
  -- }
end

return M
