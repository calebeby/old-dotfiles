set nocompatible

" Required Vundle setup
filetype off

call plug#begin('~/.vim/plugged')

" Plug 'guns/xterm-color-table.vim'
" Plug 'ap/vim-buftabline'
" Plug 'neomake/neomake'
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'scrooloose/nerdtree'
" Plug 'junegunn/fzf.vim'
" Plug 'easymotion/vim-easymotion'
" Plug 'flazz/vim-colorschemes'
" Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
" Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'lifepillar/vim-mucomplete'
" Plug 'mattn/emmet-vim'
Plug 'janko-m/vim-test'
" Plug 'terryma/vim-multiple-cursors'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
" Plug 'Shougo/denite.nvim'

Plug 'davidhalter/jedi-vim', { 'for': 'py' }
Plug 'fatih/vim-go', { 'for': 'go' }

" Text objects
Plug 'kana/vim-textobj-user'
" Plug 'kana/vim-textobj-function'
" Plug 'kana/vim-textobj-indent'
" Plug 'glts/vim-textobj-indblock'
Plug 'kana/vim-textobj-line'
Plug 'mattn/vim-textobj-url'
Plug 'sgur/vim-textobj-parameter'

" Snippets

" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'slm-lang/vim-slm', { 'for': 'slm' }

" Add plugins to &runtimepath
call plug#end()

set path+=**

" use syntax detection/highlighting
syntax enable

" Automatically :write before running commands
set autowrite

" Reload files changed outside vim
set autoread

" Trigger autoread when changing buffers or coming back to vim in terminal.
au FocusGained,BufEnter * :silent! !

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1

" let g:mucomplete#enable_auto_at_startup = 1

"NeoVim handles ESC keys as alt+key, set this to solve the problem
if has('nvim')
  set ttimeout
  set ttimeoutlen=0
endif

let g:indentLine_char = '┆'
" let g:indentLine_char = '│'

map <space> <Plug>(easymotion-prefix)

" Colors
let color = 'gruvbox'
" colorscheme &color
exec "colorscheme ".color 
set background=dark

autocmd BufRead,BufNewFile *.sgr set ft=pug
" Fixes bug where Vim thinks doctype means html
autocmd BufRead,BufNewFile *.slim set ft=slim

" let g:UltiSnipsExpandTrigger="<C-J>"
" let g:UltiSnipsJumpForwardTrigger="<C-J>"
" let g:UltiSnipsJumpBackwardTrigger="<C-K>"
" " let g:UltiSnipsExpandTrigger="<tab>"
" " let g:UltiSnipsJumpForwardTrigger="<tab>"
" " let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" let g:UltiSnipsSnippetDirectories=["~/UltiSnips"]

" function! Complete_or_snippet()
"   echo 'running function'

"   if len(UltiSnips#SnippetsInCurrentScope()) == 0
"     return "\<plug>(MUcompleteFwd)"
"   else
"     " call "\<plug>(UltiSnips#ExpandSnippet)"
"     " call feedkeys("\<C-J>")
"     return UltiSnips#ExpandSnippet()
"   endif
" endfunction

" augroup DisableMappings
"   autocmd! VimEnter * :imap <expr> <tab> Complete_or_snippet()
" augroup END

" include dashes in completion
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

" times for leader commands
set timeoutlen=1000
set ttimeoutlen=10

" let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'coffee']

" don't mess with my markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1

" Save swap files here
set directory=~/tmp
" don't make something.some~ files
set nowritebackup

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

noremap <c-q> :xall<CR>

noremap + <C-a>
noremap - <C-x>

" Align markdown tables with tab
au FileType markdown vmap <tab> :EasyAlign*<Bar><Enter>
au FileType markdown map <Bar> vip :EasyAlign*<Bar><Enter>

" Show hidden files
let g:ctrlp_show_hidden = 1

if executable('rg')
  let g:CtrlSpaceGlobCommand = 'rg --files --hidden ""'
  let g:ctrlp_user_command = 'rg --files --hidden %s""'
  let g:ctrlp_use_caching = 0
elseif executable('ag')
  let g:ctrlp_user_command = 'ag --ignore-case --nogroup --hidden --follow
        \ -U -p ~/.agignore
        \ -l -m 50000
        \ %s -g ""'
  let g:ctrlp_use_caching = 0
endif

" Use system clipboard
" requires xsel
set clipboard=unnamedplus
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" fugitive git bindings
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gbl :Gblame<CR><CR>
" nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gp :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>
nnoremap <space>gl :Dispatch! git pull<CR>
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

" Save file
nmap <c-s> :up<CR>
vmap <c-s> <Esc>:up<CR>gv
imap <c-s> <Esc>:up<CR>a

set hidden

function! Current_git_branch()
  let l:branch = split(fugitive#statusline(),'[()]')
  if len(l:branch) > 1
    return winwidth(0) > 55 ? remove(l:branch, 1) : ''
  endif
  return ""
endfunction

let g:buftabline_indicators = 1
hi BufTabLineCurrent ctermfg=15 ctermbg=236 cterm=bold
hi BufTabLineHidden ctermfg=7 ctermbg=0 cterm=NONE
hi BufTabLineFill ctermfg=7 ctermbg=0 cterm=NONE
hi BufTabLineActive ctermfg=15 ctermbg=0 cterm=bold

let g:lightline = {
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'filename', 'branch' ],
      \     [ 'ctrlpmark' ],
      \    ],
      \   'right': [
      \     [ 'syntastic', 'line' ],
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
      \   'percent': 'LightLinePercent',
      \   'line': 'LightLineLine',
      \ },
      \ 'component': {
      \   'branch': ' %{Current_git_branch()}',
      \ },
      \ 'component_visible_condition': {
      \   'branch': '(Current_git_branch()!="")',
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

let g:lightline.colorscheme = color

function! LightLineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? '🔒' : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  let file = fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
  return winwidth(0) > 30 ? file : ''

endfunction

function! LightLineFileformat()
  return winwidth(0) > 75 ? &fileformat : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 68 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 60 ? (&filetype !=# '' ? &filetype : '') : ''
endfunction

function! LinePercent()
  return line('.') * 100 / line('$') . '%'
endfunction

function! LightLinePercent()
  return winwidth(0) > 42 ? LinePercent() : ''
endfunction

function! LightLineLine()
  if winwidth(0) > 37
    return line('.') . ':' . col('.')
  elseif winwidth(0) > 35
    return line('.')
  else
    return ''
  endif
endfunction

function! LightLineMode()

  let fname = expand('%:t')
  return fname == 'ControlP' ? 'OPEN' :
        \ winwidth(0) > 10 ? lightline#mode() : ''
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
" set complete+=kspell
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Change cursor shape on entering insert or replace mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

let &t_SI = "\<esc>[5 q"
let &t_SR = "\<esc>[5 q"
let &t_EI = "\<esc>[2 q"

if exists('$TMUX')
  let &t_SI = "\ePtmux;\e" . &t_SI . "\e\\"
  let &t_EI = "\ePtmux;\e" . &t_EI . "\e\\"
endif

" Show relative numbers
set relativenumber number

" run :sudo to add sudo permissions
" NOTE: doesn't work in Neovim (August 2016)
" https://github.com/neovim/neovim/issues/1716
command! Sudo w !sudo tee %

" clear search
nnoremap <silent> <esc> :noh<return><esc>

" split right and below instead of left and up
set splitbelow
set splitright

set fillchars+=vert:│

hi VertSplit ctermbg=NONE guibg=NONE

autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open a new file in a new buffer
nmap <C-t> :FZF<CR>
vmap <C-t> <Esc><C-t>gv
imap <C-t> <Esc><C-t>
tmap <C-t> <c-e><C-t>

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

" " C-space is NUL
" nmap <silent> <NUL> :call fzf#run({
" \   'source':  reverse(<sid>buflist()),
" \   'sink':    function('<sid>bufopen'),
" \   'options': '+m',
" \   'down':    len(<sid>buflist()) + 2
" \ })<CR>
" vmap <NUL> <Esc><C-space>gv
" imap <NUL> <Esc><C-space>
" tmap <NUL> <c-e><C-space><C-space>

if has('nvim')
  tmap <esc>   <c-\><c-n>
  tmap <c-j> <esc><c-j>
  tmap <c-k> <esc><c-k>
  tmap <c-l> <esc><c-l>
  tmap <c-h> <esc><c-h>

  tmap <c-q> <esc><c-q>
  let test#strategy = "neovim"
endif

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" nnoremap <C-p> :Denite file_rec/async<cr>
" Close file
map zz :up\|b#\|bd#<CR>
let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }

nnoremap ; :

" Move to the previous buffer with "gp"
nnoremap gp :bp<CR>

" Move to the next buffer with "gn"
nnoremap gn :bn<CR>

vmap < <gv
vmap > >gv

" set foldmethod=indent   
" set foldnestmax=10
" set nofoldenable
" set foldlevel=2

autocmd! FileType fzf tnoremap <buffer> <esc> <c-c><esc>:q<CR>
