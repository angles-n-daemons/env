" Must have
:nmap ; :

" PLUGINS
"
" set plugin location
call plug#begin('~/.vim/plugged')

" NerdTREE
Plug 'scrooloose/nerdtree'

" Fugitive
Plug 'tpope/vim-fugitive'

" vim-airline
Plug 'vim-airline/vim-airline'

" ctrl-p
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

echo 'YouCompleteMe not installed. Install and comment out echo in vimrc'

if executable('ag')
  " Use ag over grep
  let g:ackprg = 'ag --vimmgrep'
  " set grepprg=ag\ --nogroup\ --nocolor
  "
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" NERDTree
autocmd VimEnter * if argc() == 0 | NERDTree | endif

