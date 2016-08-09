" Start Pathogen
execute pathogen#infect()
syntax enable

" <- Show numbers
set number

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

" No more arrow keys!
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Align markdown tables with bar or tab
au FileType markdown vmap <Bslash> :EasyAlign*<Bar><Enter>
au FileType markdown vmap <tab> :EasyAlign*<Bar><Enter>

" Complete properly
au FileType php setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType slim,html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType scss,sass,css setl ofu=csscomplete#CompleteCSS

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

" in markdown files look up suggestions in the dictionary
autocmd FileType text,markdown let b:vcm_tab_complete = 'dict'

" airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

autocmd BufRead,BufNewFile *.md set filetype=markdown

" Spell-check Markdown files
autocmd FileType markdown setlocal spell

" Spell-check Git messages
autocmd FileType gitcommit setlocal spell

" Set spellfile to location that is guaranteed to exist,
" can be symlinked to Dropbox or kept in Git
" and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" use thin cursor in insert mode
if has("nvim")
  au InsertEnter * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_BLOCK/TERMINAL_CURSOR_SHAPE_UNDERLINE/' ~/.config/xfce4/terminal/terminalrc"
  au InsertLeave * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_UNDERLINE/TERMINAL_CURSOR_SHAPE_BLOCK/' ~/.config/xfce4/terminal/terminalrc"
  au VimLeave * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_UNDERLINE/TERMINAL_CURSOR_SHAPE_BLOCK/' ~/.config/xfce4/terminal/terminalrc"  
endif

