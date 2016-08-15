" Start Pathogen
execute pathogen#infect()

" use syntax detection/highlighting
syntax enable

" Colors
set background=dark
colorscheme solarized

" Use emmet for tab in xml, html, etc. files
autocmd FileType html,svg,css,scss,sass imap <buffer> <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Fixes bug where Vim thinks doctype means html
autocmd BufNewFile,BufRead *.slim set ft=slim

" Close vim if there are no more buffers open
:autocmd BufDelete * if len(filter(range(1, bufnr('$')), '!empty(bufname(v:val)) && buflisted(v:val)')) == 1 | quit | endif

" In completion, include dashes
set iskeyword+=-

set ignorecase
set infercase
set smartcase
set wildignorecase

let mapleader = ","

" use different indents in different filetypes
filetype plugin indent on

" default tab width
set shiftwidth=2

set expandtab

" Show hidden files
let g:ctrlp_show_hidden = 1

" times for leader commands
set timeoutlen=1000
set ttimeoutlen=10

" don't mess with my markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1

" Save swap files here
set directory=~/tmp

" Go up and down properly in long lines
nnoremap j gj
nnoremap k gk

" No arrow keys in normal and insert
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

imap <up> <NOP>
imap <down> <NOP>
imap <left> <NOP>
imap <right> <NOP>

" Align markdown tables with tab
au FileType markdown vmap <tab> :EasyAlign*<Bar><Enter>

" Complete properly
au FileType php setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType slim,html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType scss,sass,css setl ofu=csscomplete#CompleteCSS

if executable('ag')
  " Use ag in CtrlP for listing files
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " Don't cache results
  " let g:ctrlp_use_caching = 0
endif

" Use system clipboard
" requires xsel
set clipboard=unnamedplus
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" subsitute more than once per line
set gdefault

set laststatus=2
set t_Co=256
set linespace=0
set pastetoggle=<F2>

" use vim-commentary with slim
autocmd FileType slim setlocal commentstring=//%s

" Tab Width
set tabstop=2

" Go to other buffers, even with unsaved work
set hidden

" Open a new file in a new buffer
nmap <C-t> :CtrlP<F5><CR>
vmap <C-t> <Esc><C-t>gv
imap <C-t> <Esc><C-t>

" Save file
nmap <c-s> :up<CR>
vmap <c-s> <Esc>:up<CR>gv
imap <c-s> <Esc>:up<CR>a

nnoremap <C-Q> <C-W>

" Close file
nmap <c-w> :up \| :bd<CR>
vmap <c-w> <Esc><c-w>
imap <c-w> <Esc><c-w>

set hidden
nnoremap <C-M> :bnext<CR>
nnoremap <C-N> :bprev<CR>

function! Current_git_branch()
    let l:branch = split(fugitive#statusline(),'[()]')
    if len(l:branch) > 1
         return remove(l:branch, 1)
    endif
    return ""
endfunction

let g:lightline = {
\ 'colorscheme': 'solarized',
\ 'active': {
\   'left': [
\     [ 'mode', 'paste' ],
\     [ 'filename', 'branch' ],
\     [ 'ctrlpmark' ],
\    ],
\   'right': [
\     [ 'syntastic', 'lineinfo' ],
\     [ 'percent' ],
\     [ 'fileformat', 'fileencoding', 'filetype' ]
\   ]
\ },
\ 'component_function': {
\   'filename': 'LightLineFilename',
\   'fileformat': 'LightLineFileformat',
\   'filetype': 'LightLineFiletype',
\   'fileencoding': 'LightLineFileencoding',
\   'mode': 'LightLineMode',
\   'ctrlpmark': 'CtrlPMark',
\ },
\ 'component': {
\   'branch': ' %{Current_git_branch()}',
\ },
\ 'component_visible_condition': {
\   'branch': '(Current_git_branch()!="")'
\ },
\ 'component_expand': {
\   'syntastic': 'SyntasticStatuslineFlag',
\ },
\ 'component_type': {
\   'syntastic': 'error',
\ },
\ 'separator': { 'left': '', 'right': '' },
\ 'subseparator': { 'left': '', 'right': '' },
\}

function! LightLineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? '🔒' : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == 'ControlP' ? 'OPEN' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

" don't say insert, etc. below lightline
set noshowmode

autocmd BufRead,BufNewFile *.md set filetype=markdown

" Spell-check Markdown and git commits
autocmd FileType markdown,gitcommit setlocal spell

" Autocomplete with dictionary words when spell check is on
set complete+=kspell
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Change cursor shape on entering insert or replace mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
let &t_SI = "\<esc>[5 q"
let &t_SR = "\<esc>[5 q"
let &t_EI = "\<esc>[2 q"

" Show relative numbers
set relativenumber

" clear search
nnoremap <esc> :noh<return><esc>

" split right and below instead of left and up
set splitbelow
set splitright

set fillchars+=vert:│
hi VertSplit ctermbg=NONE guibg=NONE

if has('nvim')
  nmap <bs> :<c-u>TmuxNavigateLeft<cr>
endif
