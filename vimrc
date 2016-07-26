" Start Pathogen
execute pathogen#infect()
syntax enable
set number
set background=dark
colorscheme solarized
autocmd FileType html,xml,svg,css,scss imap <buffer> <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
" Fixes bug where Vim thinks doctype means html
autocmd BufNewFile,BufRead *.slim set ft=slim
set ignorecase
set infercase
set smartcase
set wildignorecase
let mapleader = ","
filetype plugin indent on
set shiftwidth=2
set expandtab
let g:ctrlp_show_hidden = 1   " Show hidden files
set timeoutlen=1000
set ttimeoutlen=10
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
set directory=~/tmp           " Save swap files here
" Go up and down properly in long lines
nnoremap j gj
nnoremap k gk

" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Bslash> :EasyAlign*<Bar><Enter>
au FileType markdown vmap <tab> :EasyAlign*<Bar><Enter>

if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Use system clipboard
" NOTE: requires xsel
set clipboard=unnamedplus
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
let g:vcm_default_maps = 0

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Characters for Airline:
let g:airline_powerline_fonts = 1

" Allow us to use Ctrl-s and Ctrl-q as keybinds
"silent !stty -ixon

" Make subsitutions apply more than one per line default
set gdefault

set laststatus=2
set t_Co=256
set linespace=0
set pastetoggle=<F2>

" Close vim if there are no more buffers open
:autocmd BufDelete * if len(filter(range(1, bufnr('$')), '!empty(bufname(v:val)) && buflisted(v:val)')) == 1 | quit | endif

autocmd FileType slim setlocal commentstring=//%s

" Tab Width
set tabstop=2

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" Open a new file in a new buffer
nmap <C-t> :CtrlP<F5><CR>
vmap <C-t> <Esc><C-t>gv
imap <C-t> <Esc><C-t>
nmap <C-o> :CtrlP<F5><CR>
vmap <C-o> <Esc><C-o>gv
imap <C-o> <Esc><C-o>

" Move to the next buffer
nmap <C-right> :bnext<CR>
vmap <C-right> <Esc><C-right>gv
imap <C-right> <Esc><C-right>

" Move to the previous buffer
nmap <C-left> :bprevious<CR>
vmap <C-left> <Esc><C-left>gv
imap <C-left> <Esc><C-left>

" Save file
nmap <c-s> :up<CR>
vmap <c-s> <Esc>:up<CR>gv
imap <c-s> <Esc>:up<CR>a

" Close file
nmap <c-w> :up \| :bd<CR>
vmap <c-w> <Esc><c-w>
imap <c-w> <Esc><c-w>

autocmd FileType text,markdown let b:vcm_tab_complete = 'dict'

" air-line
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
