" Maintainer
"   Christopher Perry
"   ozbonus@gmail.com
"   github.com/ozbonus
" Version
"   0.4
"   2015 September 17
" Repository
"   https://github.com/ozbonus/toolbox
" Inspiration
"   Amir Salihefendic - http://amix.dk
"   Doug Black - https://dougblack.io
" Sections
"   Vundle
"   General
"   User Interface and Appearance.
"   Extra GVim Options
"   Spaces and Tabs
"   Searching

" Vundle
" TODO

" General
set history=500         " Sets how many lines of history VIM must remember.
set autoread            " Auto read when a file is changed from the outside.
let mapleader=","       " A more sensible map leader.
nmap <leader>w :w!<cr>  " Fast saving.
nmap <leader>s :so%<cr> " Fast sourcing.

" VIM User Interface and Appearance
set number         " Show line numbers.
set cursorline     " Highlight the current line.
set so=5           " Buffer the cursor with at least five lines.
syntax enable      " Enable syntax processing.
set laststatus=2   " Always show status bar.
set ruler          " Always show the current position.
set showmatch      " Show matching brackets.
set mat=2          " Blink time for matches in tenths of a second.
set showcmd        " Show the last command used.
set noerrorbells   " Disable obnoxious bells.
set visualbell     " Disable obnoxious bells.
set ttyfast        " Fix scrolling issues on WSL.

" Extra GVIM Options
if has("gui_running")
    set guioptions-=T " Hide tool bar.
    set guioptions-=m " Hide menu bar.
    set guioptions-=e " Terminal-style tab menu.
    set guioptions-=r " Hide right scroll bar.
    set guioptions-=L " Hide left scroll bar.
    set guitablabel=%M\ %t
    set guifont=liberation\ mono\ for\ powerline\ 12
    set background=dark
endif

" Spaces, Tabs, and Indentation
set tabstop=4      " Visual spaces per tab character.
set softtabstop=4  " Number of spaces in a new tab.
set expandtab      " New tabs are spaces.
filetype indent on " Load indent files. TODO

" Searching
set wildmenu " Visual auto complete for the command menu.
set wildignore=*.o,*~,*.pyc " Ignore compiled files.
set hid " Abandoned buffers are hidden.
set ignorecase " Ignore case while searching.
set smartcase " Try to be smart about cases.
set magic " Enable regular expression magic.
set incsearch " Highlight characters as they are entered.
set hlsearch                             " Highlight matches
nnoremap <leader><space> :nohlsearch<CR> " Clear highlights.

" Movement
map <C-j> <C-W>j " Move cursor to window below.
map <C-k> <C-W>k " Move cursor to window above.
map <C-h> <C-W>h " Move cursor to window on the left.
map <C-l> <C-W>l " Move cursor to window on the right.

" Function - Return to last edit position when reopening a file.
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

