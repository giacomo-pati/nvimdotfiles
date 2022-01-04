local M = {}

local opts = {
    --[[
    auto_save_enabled = true, 
    auto_restore_enabled = true, 
    auto_session_enable_last_session = false
    --]]
}


function M.setup() require('auto-session').setup(opts) end
--[[
" Automatisch letzte Session speichern
function! MakeSession()
  if (filewritable(g:auto_session_root_dir) != 2)
    exe 'silent !mkdir -force ' g:auto_session_root_dir
    redraw!
  endif
  let b:filename = g:auto_session_root_dir . '/autosession.vim'
  exe "mksession! " . b:filename
endfunction
au VimLeave * :call MakeSession()
return M
--]]
