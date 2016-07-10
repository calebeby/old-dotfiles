" Start Pathogen
execute pathogen#infect()
syntax on
syntax enable
set number
set background=dark
colorscheme solarized
filetype plugin indent on
"filetype off
set shiftwidth=2
set expandtab
set timeoutlen=50
let g:indentLine_char = '¦'
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
set directory=~/tmp

" Characters for Airline:
let g:airline_powerline_fonts = 1

" Allow us to use Ctrl-s and Ctrl-q as keybinds
silent !stty -ixon

" Make subsitutions apply more than one per line default
set gdefault

set laststatus=2
set t_Co=256
set ttimeoutlen=50
set linespace=0
set pastetoggle=<F2>
" EasyMotion
map <Space> <Plug>(easymotion-prefix)

" Close vim if there are no more buffers open
:autocmd BufDelete * if len(filter(range(1, bufnr('$')), '!empty(bufname(v:val)) && buflisted(v:val)')) == 1 | quit | endif

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
nmap <c-s> :w<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>a

" Close file
nmap <c-w> <c-s>:bd<CR>
vmap <c-w> <Esc><c-w>gv
imap <c-w> <Esc><c-w>

" air-line
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
