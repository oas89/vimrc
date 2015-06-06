set nocompatible " Incompatable mode
set ttyfast " Smooth scrolling
set number " Show line numbers

" Search tunning
set hlsearch
set incsearch
set ignorecase
set smartcase

" Enable syntax highlight
syntax enable

" Colors tunning
colorscheme desert

" Show invisible symbols
set list
set listchars=tab:→\ ,trail:·

" Backspace over everything in insert mode
set backspace=indent,eol,start

" Show incomplete commands in normal mode
set showcmd

" Braces highlight tunning 
set showmatch
set matchpairs+=<:>

" Show 80th column
set colorcolumn=80

" Automatically reread externally edited files
set autoread

" Always ask confirmation dialog instead of errors
set confirm

" Extend command line history
set history=250

" Keep some screen lines above and below the cursor
set scrolloff=5

" Highlight current line
set cursorline

" Do not redraw screen while executing macros and other non-typed commands
set lazyredraw

" Setup status line format
set statusline=%f\ %L%y%r\ [%{&ff}][%{&fenc}]\ %=%m\ %-15(0x%02B\ (%b)%)%-15(%l,%c%V%)%P
set laststatus=2

" Save swap and backup files in single directory
set directory=$HOME/.vim/swapfiles
set backupdir=$HOME/.vim/backupfiles

" Edit multiple buffers without saving modifications
set hidden

" Default encodings and line ending
set termencoding=utf-8
set encoding=utf-8
set fileformat=unix
set fileencodings=utf-8,cp1251,koi8-r,cp866
set fileformats=unix,dos,mac

" Enable command line completions with <Tab>
set wildmenu
set wcm=<Tab>

" Spaces and tabs behaviour
set tabstop=3
set shiftwidth=3
set autoindent smartindent
"set smarttab
"set expandtab


if has("mouse")
    set mouse=         " выключает поддержку мыши при работе в терминале (без GUI)
    set mousehide       " скрывать мышь в режиме ввода текста
endif

if version >= 700
    set sessionoptions=curdir,buffers,help,options,resize,slash,tabpages,winpos,winsize 
else
    set sessionoptions=curdir,buffers,help,options,resize,slash,winpos,winsize
endif

set formatoptions=croql
set cinoptions=l1,g0,p0,t0,c0,(s,U1,m1


" Enable filetype detection and hooks
filetype on
filetype plugin on
filetype indent on


" Keybindings
let mapleader=","

inoremap jk <Esc>

nnoremap Z :bprev<cr>
nnoremap X :bnext<cr>

nnoremap <F2> <ESC>:w<CR>
inoremap <F2> <ESC>:w<CR>i<Right>
nnoremap <F3> <ESC>:nohlsearch<CR>
inoremap <F3> <ESC>:nohlsearch<CR>
noremap <F4> <ESC>:buffers<CR>
noremap <F8> :emenu Encoding.<TAB>
noremap <F9> :emenu LineEndings.<TAB>
nnoremap <F10> <ESC>:w !sudo tee %<CR>


" Menus configuration 
menu Encoding.CP1251 :e ++enc=cp1251<CR>
menu Encoding.CP866  :e ++enc=cp866<CR>
menu Encoding.KOI8-R :e ++enc=koi8-r<CR>
menu Encoding.UTF-8  :e ++enc=utf-8<CR>

menu LineEndings.unix :setlocal fileformat=unix<CR>
menu LineEndings.dos  :setlocal fileformat=dos<CR>
menu LineEndings.mac  :setlocal fileformat=mac<CR>


" Hooks for different filetypes
autocmd FileType crontab,fstab,make set noexpandtab tabstop=8 shiftwidth=8
autocmd FocusLost * :wa


" Enable pathogen plugin manager if available
let VIM_DIRECTORY=expand("$HOME/.vim/")
if filereadable(VIM_DIRECTORY."autoload/pathogen.vim")
    execute pathogen#helptags()
    execute pathogen#runtime_append_all_bundles()
    execute pathogen#infect()
endif


" Ловля имени редактируемого файла из vim'а. (^[ вводится как Ctrl+V Esc)
set title
let &titlestring = "vim (" . expand("%:t") . ")"
if &term == "screen"
    set t_ts=k
    set t_fs=\
endif

if &term == "screen" || &term == "xterm"
    set title
endif


let g:pyflakes_use_quickfix = 0
let g:flake8_cmd="flake8-python2"
autocmd BufWritePost *.py call Flake8()

" NERDTree
noremap <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']


:command WQ wq
:command Wq wq
:command W w
:command Q q
