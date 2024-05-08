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

" coc vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" vimspector
Plug 'puremourning/vimspector'


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


" vimspector settings
let g:vimspector_enable_mappings = 'HUMAN'
noremap <F2> :VimspectorReset<CR>


" coc configuration ----
set encoding=utf-8
set updatetime=300
set signcolumn=yes
" complete with tab
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Make <CR> to accept selected completion item or notify coc.nvim to format
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f :call CocActionAsync('format')

" Applying code actions to the selected code block
" " Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)
" coc configuration ----



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

" tab navigation bindings

nnoremap tn  :tabnext<Space>

" backspace over newlines and indents
:set backspace=indent,eol,start

" pane jumping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" easily resize pane
nnoremap <silent> = :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

" copy to system as well
set clipboard=unnamed


" language specific settings below
