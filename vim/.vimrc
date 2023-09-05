" remap semicolon to colon
:nmap ; :

" colorscheme
colorscheme afterglow



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

" language client
Plug 'dense-analysis/ale'

" NOTE: consider installing YouCompleteMe

call plug#end()



" ctrlp extras
if executable('ag')
  " Use ag over grep
  let g:ackprg = 'ag --vimmgrep'
  " set grepprg=ag\ --nogroup\ --nocolor
  "
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|build|venv|DS_Store)|(\.(swp|ico|git|svn))$'
let g:ctrlp_max_files=0

" NERDTree
autocmd VimEnter * if argc() == 0 | NERDTree | endif



" highlight line in active window
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
set nocursorline

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" search highlighting
set hlsearch

" highlight column 80
set colorcolumn=80



" pane jumping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" easily resize pane
nnoremap <silent> = :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

" copy to system clipboard
vnoremap <C-c> :w !pbcopy<CR><CR>


" language specific settings below
