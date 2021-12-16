if exists('g:loaded_toggle_split_orientation')
  finish
endif

let s:save_cpo = &cpo
set cpo&vim

function! s:toggle_split_orientation() abort
  let nr = winnr()
  let pos = getpos('.')
  wincmd t
  exe 'windo wincmd' (&columns == winwidth(0) ? 'L' : 'J')
  wincmd =
  exe nr . 'wincmd w'
  call setpos('.', pos)
  normal! zz
endfunction

command! ToggleSplitOrientation  call s:toggle_split_orientation()
nnoremap <silent> <Plug>(toggle-split-orientation)  :<C-u>call <SID>toggle_split_orientation()<CR>

let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_toggle_split_orientation = 1

" vim: set et sts=2 sw=2:
