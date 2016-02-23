silent! execute pathogen#infect()

set autoindent
set backspace=indent,eol,start
set complete-=i
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

set nrformats-=octal

set ttimeout
set ttimeoutlen=100

" Disable mouse click to go to position
set mouse-=a

set incsearch
set hlsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

set laststatus=2
set ruler
set showcmd
set showmatch
set wildmenu

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags^=./tags;
endif

set autoread
set fileformats+=mac

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

inoremap <C-U> <C-G>u<C-U>

" A nice dark colorscheme
colorscheme darkblue

" Use nice filespecific syntax highlighting
filetype plugin indent on
syntax on

if has("gui_macvim")
    let macvim_hig_shift_movement = 1
    set mouse=niv
endif

" Show all commands and settings you can tab-complete to
set wildmode=longest,list

" Only use case-matching when you mix big and small chars
set ignorecase smartcase

" Disable spellchecking
set nospell

" Underline the current line
set cul

" Show line numbers
set number

" Pretty menu with useful info about the current file
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

vmap q <gv
vmap <TAB> >gv

" Previous and next buffer, useful together with 'gf'
nmap gb :bN<cr>
nmap gn :bn<cr>

" Move up and down one line at a time even on linewrapped rows.
nnoremap <silent> k gk
nnoremap <silent> j gj

" Disable menu when running gVim
if has("gui_running")
    set guioptions-=T
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

"let g:neocomplete#enable_at_startup = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
