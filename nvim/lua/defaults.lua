local M = {}

local g = vim.g
local cmd = vim.cmd
local o = vim.o
local wo = vim.wo
local bo = vim.bo
local opt = vim.opt
local indent = 4

function M.setup()
  cmd [[filetype plugin indent on]]
  cmd [[syntax enable]]
  opt.autoindent = true                    -- take indent for new line from previous line
  opt.autoread = true                      -- reload file if the file changes on the disk
  opt.autowrite = true                     -- write when switching buffers
  opt.autowriteall = true                  -- write on :quit
  opt.background = 'dark'
  opt.clipboard = 'unnamed,unnamedplus'
  opt.completeopt:remove 'preview'         -- remove the horrendous preview window
  opt.cursorline = true                    -- highlight the current line for the cursor
  opt.encoding = 'utf-8'
  opt.errorbells = false                   -- No bells!
  opt.expandtab = true                     -- expands tabs to spaces
  opt.formatoptions = 'tcqronj'            -- text formatting options
  opt.hlsearch = true                      -- disable search result highlighting
  opt.inccommand = 'split'                 -- enables interactive search and replace
  opt.incsearch = true                     -- move to match as you type the search query
  opt.lazyredraw = true
  opt.list = true                          -- show trailing whitespace
  opt.listchars = {tab='| ',trail='▫'}
  opt.mouse = 'a'                          -- enable mouse
  opt.spell = false                        -- disable spelling
  opt.swapfile = false                     -- disable swapfile usage
  opt.wrap = false
  opt.pumblend = 17
  opt.relativenumber = true                -- show relative numbers in the ruler
  opt.ruler = true
  opt.shortmess:append "c"                 -- Don't pass messages to |ins-completion-menu|
  opt.smartindent = true                   -- enable smart indentation
  opt.softtabstop = 2
  opt.tabstop = 2
  opt.termguicolors = true
  opt.title = true                         -- let vim   opt.the terminal title
  opt.updatetime = 300                     -- redraw the status bar often
  opt.visualbell = false                   -- I said, no bells!

  g.python_host_prog = '/usr/bin/python2'
  g.python3_host_prog = '/usr/bin/python3'
  g.loaded_python_provider = 0
  g.loaded_perl_provider = 0

  g.mapleader = ','
  g.maplocalleader = "_"

  o.cmdheight = 2  
  o.history = 100
  o.ignorecase = true
  o.inccommand = "split"
  o.scrolloff = 3
  o.sessionoptions = "blank,buffers,curdir,folds,help,options,tabpages,winsize,resize,winpos,terminal"
  o.sidescrolloff = 3
  o.splitbelow = true
  o.splitright = true
  o.synmaxcol = 240
  o.timeoutlen = 300

  wo.colorcolumn = '81'                   -- highlight the 80th column as an indicator
  wo.number = true                        -- show number ruler
  wo.wrap = false
  
  -- opt.formatoptions = opt.formatoptions
  --   - "a" -- Auto formatting is BAD.
  --   - "t" -- Don't auto format my code. I got linters for that.
  --   + "c" -- In general, I like it when comments respect textwidth
  --   + "q" -- Allow formatting comments w/ gq
  --   - "o" -- O and o, don't continue comments
  --   - "r" -- Don't insert comment after <Enter>
  --   + "n" -- Indent past the formatlistpat, not underneath it.
  --   + "j" -- Auto-remove comments if possible.
  --   - "2" -- I'm not in gradeschool anymore

  -- g.virtualedit = "all"
  g.vim_markdown_fenced_languages = { "html", "javascript", "typescript", "css", "python", "lua", "vim" }

  -- make it extensible to individual users
  pcall(require, "user.defaults")
end

return M
