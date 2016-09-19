" Start Pathogen
execute pathogen#infect()

" use syntax detection/highlighting
syntax enable

" Automatically :write before running commands
set autowrite

" Reload files changed outside vim
set autoread

" Trigger autoread when changing buffers or coming back to vim in terminal.
au FocusGained,BufEnter * :silent! !

"NeoVim handles ESC keys as alt+key, set this to solve the problem
if has('nvim')
  set ttimeout
  set ttimeoutlen=0
endif

" Colors
set background=dark
colorscheme solarized

" Use emmet for tab in xml, html, etc. files
" autocmd FileType html,svg,css,scss,sass imap <buffer> <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
"
function! Emmet_or_ultisnip()
  echo 'running function'

  if ((&ft=='html' || &ft=='xml' || &ft=='svg' || &ft=='css' || &ft=='scss' || &ft=='sass') && emmet#isExpandable())
    return "\<plug>(emmet-expand-abbr)"
  else
    return "\<plug>SuperTabForward"
  endif
endfunction

augroup DisableMappings
  autocmd! VimEnter * :imap <expr> <tab> Emmet_or_ultisnip()
augroup END

" Fixes bug where Vim thinks doctype means html
autocmd BufNewFile,BufRead *.slim set ft=slim

" Close vim if there are no more buffers open
:autocmd BufDelete * if len(filter(range(1, bufnr('$')), '!empty(bufname(v:val)) && buflisted(v:val)')) == 1 | quit | endif

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

noremap + <C-a>
noremap - <C-x>

" Align markdown tables with tab
au FileType markdown vmap <tab> :EasyAlign*<Bar><Enter>
au FileType markdown map <Bar> vip :EasyAlign*<Bar><Enter>

" " Complete properly
" au FileType php setl ofu=phpcomplete#CompletePHP
" au FileType ruby,eruby setl ofu=rubycomplete#Complete
" au FileType slim,html,xhtml setl ofu=htmlcomplete#CompleteTags
" au FileType c setl ofu=ccomplete#CompleteCpp
" au FileType scss,sass,css setl ofu=csscomplete#CompleteCSS

let g:SuperTabDefaultCompletionType = 'context'

" Show hidden files
let g:ctrlp_show_hidden = 1

if executable('ag')
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
    return winwidth(0) > 55 ? remove(l:branch, 1) : ''
  endif
  return ""
endfunction

let g:buftabline_indicators = 1
hi BufTabLineCurrent ctermfg=14 ctermbg=0 cterm=bold
hi BufTabLineHidden ctermfg=10 ctermbg=8 cterm=NONE
hi BufTabLineFill ctermfg=8 ctermbg=8 cterm=NONE
hi BufTabLineActive ctermfg=14 ctermbg=8 cterm=bold

let g:lightline = {
      \ 'colorscheme': 'solarized',
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
set complete+=kspell
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
set relativenumber

" run :sudo to add sudo permissions
" NOTE: doesn't work in Neovim (August 2016)
" https://github.com/neovim/neovim/issues/1716
command! Sudo w !sudo tee %

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
