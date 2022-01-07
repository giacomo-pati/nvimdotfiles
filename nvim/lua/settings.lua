local M = {}

function M.setup()
  -- Colors
  --  Override the search highlight color with a combination that is easier to
  --  read. The default PaperColor is dark green backgroun with black foreground.
  -- 
  --  Reference:
  --  - http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
  vim.api.nvim_exec([[
      set background=dark
      highlight Search guibg=DeepPink4 guifg=White ctermbg=53 ctermfg=White
      highlight ColorColumn ctermbg=0 guibg=grey
      map <leader>bg :let &background = (&background == "dark"? "light" : "dark")<cr>
    ]], false)

  -- Highlight on yank
  vim.cmd 'autocmd TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
  vim.cmd "autocmd TextYankPost * silent! lua vim.highlight.on_yank()"

  -- Autosave buffers before leaving them
  vim.cmd 'autocmd BufLeave * silent! :wa'

  -- don't auto commenting new lines
  vim.cmd 'autocmd BufEnter * set fo-=c fo-=r fo-=o'

  -- Remove trailing white spaces on save
  vim.cmd [[autocmd BufWritePre * :%s/\s\+$//e]]

  -- Window highlight
  vim.api.nvim_exec([[
      highlight InactiveWindow guibg=#282C34
      autocmd VimEnter * set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
    ]], false)

  -- Center the screen quickly
  -- vim.cmd 'nnoremap <space> zz'

  -- Clear search highlights
  vim.cmd 'map <leader>c :nohlsearch<cr>'
  
  -- These mappings will make it so that going to the next one in a search will
  -- center on the line it's found in.
  vim.api.nvim_exec([[
      nnoremap n nzzzv
      nnoremap N Nzzzv
    ]], false)

  -- move between panes with C-j C-k C-h C-l
  vim.api.nvim_exec([[
      map <C-j> <C-W>j
      map <C-k> <C-W>k
      map <C-h> <C-W>h
      map <C-l> <C-W>l
    ]], false)

  -- Move between buffers with Shift + arrow key...
  -- but skip the quickfix when navigating
  vim.api.nvim_exec([[
      nnoremap <S-Left> :bprevious<cr>
      nnoremap <S-Right> :bnext<cr>
      augroup qf
        autocmd!
        autocmd FileType qf set nobuflisted
      augroup END
    ]], false)

  -- Fix some common typos
  vim.api.nvim_exec([[
      cnoreabbrev W! w!
      cnoreabbrev Q! q!
      cnoreabbrev Qall! qall!
      cnoreabbrev Wq wq
      cnoreabbrev Wa wa
      cnoreabbrev wQ wq
      cnoreabbrev WQ wq
      cnoreabbrev W w
      cnoreabbrev Q q
      cnoreabbrev Qall qall
    ]], false)

  -- Creating splits
  vim.cmd 'nnoremap <leader>v :vsplit<cr>'
  vim.cmd 'nnoremap <leader>h :split<cr>'

  -- Closing splits
  vim.cmd 'nnoremap <leader>q :close<cr>'

  -- DAP
  -- require('telescope').load_extension('dap')
  -- require('dbg.python')

  -- local opt = { noremap = true, silent = true }
  -- vim.api.nvim_set_keymap('n', '<leader>dc', '<cmd>lua require"dap".continue()<CR>', opt) 
  -- vim.api.nvim_set_keymap('n', '<leader>dsv', '<cmd>lua require"dap".step_over()<CR>', opt) 
  -- vim.api.nvim_set_keymap('n', '<leader>dsi', '<cmd>lua require"dap".step_into()<CR>', opt) 
  -- vim.api.nvim_set_keymap('n', '<leader>dso', '<cmd>lua require"dap".step_out()<CR>', opt) 
  -- vim.api.nvim_set_keymap('n', '<leader>dtb', '<cmd>lua require"dap".toggle_breakpoint()<CR>', opt) 
  -- vim.api.nvim_set_keymap('n', '<leader>dsbr', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', opt) 
  -- vim.api.nvim_set_keymap('n', '<leader>dsbm', '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', opt) 
  -- vim.api.nvim_set_keymap('n', '<leader>dro', '<cmd>lua require"dap".repl.open()<CR>', opt) 
  -- vim.api.nvim_set_keymap('n', '<leader>drl', '<cmd>lua require"dap".repl.run_last()<CR>', opt) 

-- telescope-dap
  -- vim.api.nvim_set_keymap('n', '<leader>dcc', '<cmd>lua require"telescope".extensions.dap.commands{}<CR>', opt)
  -- vim.api.nvim_set_keymap('n', '<leader>dco', '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>', opt)
  -- vim.api.nvim_set_keymap('n', '<leader>dlb', '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>', opt)
  -- vim.api.nvim_set_keymap('n', '<leader>dv', '<cmd>lua require"telescope".extensions.dap.variables{}<CR>', opt)
  -- vim.api.nvim_set_keymap('n', '<leader>df', '<cmd>lua require"telescope".extensions.dap.frames{}<CR>', opt)

  -- vim.cmd [[
  --       set expandtab smarttab shiftround autoindent smartindent smartcase
  --       set path+=**
  --       set wildmode=longest,list,full
  --       set wildoptions=pum
  --       set wildmenu
  --       set wildignore+=*.pyc
  --       set wildignore+=*_build/*
  --       set wildignore+=**/coverage/*
  --       set wildignore+=**/node_modules/*
  --       set wildignore+=**/android/*
  --       set wildignore+=**/ios/*
  --       set wildignore+=**/.git/*
  --   ]]


  -- Auto format
  -- vim.api.nvim_exec([[
  -- augroup auto_fmt
  --     autocmd!
  --     autocmd BufWritePre *.py,*.lua,*.rs try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
  -- aug END
  -- ]], false)

  -- vim.api.nvim_exec(
  --   [[
  --       augroup auto_html
  --           autocmd!
  --           autocmd Filetype html setlocal ts=2 sw=2 expandtab
  --           autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 noexpandtab
  --       augroup END
  --   ]],
  --   false
  -- )

  -- Terminal
  -- vim.api.nvim_exec(
  --   [[
  --       augroup auto_term
  --           autocmd!
  --           autocmd TermOpen * setlocal nonumber norelativenumber
  --           autocmd TermOpen * startinsert
  --       augroup END
  --   ]],
  --   false
  -- )

  -- Trimming and highlight search
  -- vim.api.nvim_exec(
  --   [[
  --       fun! TrimWhitespace()
  --           let l:save = winsaveview()
  --           keeppatterns %s/\s\+$//e
  --           call winrestview(l:save)
  --       endfun

  --       "-- autocmd FileType * autocmd BufWritePre <buffer> call TrimWhitespace()

  --       nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()
  --   ]],
  --   false
  -- )

  -- vim.cmd [[ autocmd CmdWinEnter * quit ]]

  -- Copilot
  -- vim.api.nvim_exec(
  --   [[
  --       imap <silent><script><expr> <C-s> copilot#Accept("\<CR>")
  --       let g:copilot_no_tab_map = v:true
  --   ]],
  --   false
  -- )

  -- NERDTree
  -- vim.api.nvim_exec(
  --   [[
  --     let NERDTreeQuitOnOpen = 3
  --     let NERDTreeShowHidden = 1
  --     let NERDTreeNaturalSort = 1
  --     let NERDTreeIgnore=[]
  --     autocmd StdinReadPre * let s:std_in=1
  --     autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
  --       \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
  --   ]],
  --   false
  -- )

  -- nnoremap g1 <cmd>!tmux new-window vd <cfile><CR>
  -- nnoremap g1 <cmd>vsplit term://vd <cfile><CR>
  -- nnoremap g2 <cmd>lua require("utils.term").send()<CR>
  -- xnoremap g2 <cmd>lua require("utils.term").send(true)<CR>
  -- nnoremap ,r :update<CR>:exec '!python3' shellescape(@%, 1)<CR>
  -- nnoremap ,d :update<CR>:sp term://python3 -m pdb %<CR>
  -- nnoremap ,n :update<CR>:sp term://nodemon -e py %<CR>
  -- vim.api.nvim_exec(
  --   [[
  --     autocmd BufNewFile  test_*.py	0r ~/.config/nvim/snippets/unittest.py
  --     autocmd BufNewFile  *.html	0r ~/.config/nvim/snippets/html5.html
  --     xmap <silent> . :normal .<CR>
  --   ]],
  --   false
  -- )

  -- make it extensible to individual users
  pcall(require, "user.settings")
end

return M
