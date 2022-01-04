local M = {}

local g = vim.g
local cmd = vim.cmd
local o = vim.o
local wo = vim.wo
local bo = vim.bo
local indent = 4
local opt = vim.opt

function M.setup()
  cmd [[filetype plugin indent on]]
  cmd [[syntax enable]]

  g.mapleader = " "
  g.maplocalleader = ","

  bo.expandtab = true                   -- Tabs are space
  bo.shiftwidth = indent
  bo.softtabstop = indent
  bo.tabstop = indent
  o.breakindent = true
  o.clipboard = "unnamed,unnamedplus"
  o.cmdheight = 2
  o.hidden = true
  o.history = 100
  o.ignorecase = true
  o.inccommand = "split"
  o.laststatus = 2
  o.lazyredraw = true
  o.mouse = "a"
  o.scrolloff = 5
  o.sessionoptions = "blank,buffers,curdir,folds,help,options,tabpages,winsize,resize,winpos,terminal"
  o.sidescrolloff = 3
  o.splitbelow = true
  o.splitright = true
  o.synmaxcol = 240
  o.termguicolors = true
  o.timeoutlen = 300
  o.updatetime = 300
  o.showmode = true
  wo.cursorline = true
  wo.linebreak = true
  wo.number = true
  wo.relativenumber = true
  wo.scrolloff = 5
  wo.sidescrolloff = 3
  wo.wrap = false
  
  opt.formatoptions:append "cqnj"
  opt.formatoptions:remove "ator2"
  opt.shortmess:append "c"                      -- Don't pass messages to |ins-completion-menu|
  opt.pumblend = 17
  
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
  g.python3_host_prog = "~/miniconda3/bin/python3"
  g.vim_markdown_fenced_languages = { "html", "javascript", "typescript", "css", "python", "lua", "vim" }
end

M.setup()
pcall(require, "user.defaults")
