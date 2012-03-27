set nocompatible

" A nice dark colorscheme
colorscheme koehler

" Use nice filespecific syntax highlighting
filetype plugin indent on
syntax on

" Tab -> 4 spaces
set backspace=2
set laststatus=2
set ts=4
set sw=4
set softtabstop=4
set expandtab smarttab autoindent

" Show all commands and settings you can tab-complete to
set wildmenu
set wildmode=longest,list

" Only use case-matching when you mix big and small chars
set ignorecase smartcase

" Show what you are doing
set showmatch showcmd ruler hidden incsearch hlsearch

" Disable spellchecking
set nospell

" Underline the current line
set cul

" Show line numbers
set number

" Pretty menu with useful info about the current file
set laststatus=2
set statusline=%F%m%r%h%w%R\ %y\ [%l,%v][%p%%]

" If you let go of Shift too slow in a :w
cab Q q
cab W w

" Save a file with sudo
cmap w!! w !sudo tee % >/dev/null

" If you write this in insertmode you probably ment something else
inoremap jj <Esc>
inoremap :wq <Esc>

" Center on the match you searched for
map N Nzz
map n nzz

" Previous and next buffer, useful together with 'gf'
nmap gb :bN<cr>
nmap gn :bn<cr>

" Move up and down one line at a time even on linewrapped rows.
nnoremap <silent> k gk
nnoremap <silent> j gj

" Disable menu when running gVim
if has("gui_running")
    set guioptions-=T
    set guicursor=a:blinkon0
endif

" Set vim to chdir for each file you open
if exists('+autochdir')
    set autochdir
else
    autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
    " % current file name
    " :p expand to full path
    " :h head (last path component removed)
    " gs/ /\\ /  replace " " with "\ "
endif
