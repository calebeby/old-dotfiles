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
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>

" imap <up> <NOP>
" imap <down> <NOP>
" imap <left> <NOP>
" imap <right> <NOP>

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
  let g:ctrlp_use_caching = 0
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

" use fancy characters
let g:airline_powerline_fonts = 1

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

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Go to other buffers, even with unsaved work
set hidden

" Open a new file in a new buffer
nmap <C-t> :CtrlP<F5><CR>
vmap <C-t> <Esc><C-t>gv
imap <C-t> <Esc><C-t>

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

" airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

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
