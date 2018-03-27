" Maintainer
"   Christopher Perry
"   ozbonus@gmail.com
"   github.com/ozbonus
" Version
"   0.5
"   2018 March 26
" Repository
"   https://github.com/ozbonus/toolbox
" Sections
"   General
"   Shortcuts

" General
set nocompatible             " Ignore Vi relics.
filetype plugin indent on    " Turn on filetype plugins (:help filetype-plugin).
syntax enable                " Enable syntax highlighting.
let mapleader=','            " A more sensible leader key.
set autoindent               " Automatically indent new lines.
set showcmd                  " Show command as it is being entered.
set incsearch                " Highlighted case-sensitive incremential search.
set laststatus=2             " Always show window status.
set ruler                    " Show the position of the cursor.
set wildmenu                 " Autocomplete commands, scroll with Ctrl-N and Ctrl-P.
set display+=lastline        " When wrapping, display last line even if it doesn't fit.
set encoding=utf-8           " Force UTF-8 encoding.
set history=1000             " So many undos.
set scrolloff=8              " Always show at least 8 lines above or below the cursor.
set sidescroll=1             " Show at least 15 columns to the left or right of the cursor.
set sidescrolloff=16         " Above.
set wrap linebreak           " Wrap lines by default.
set number                   " Show line numbers.
set noerrorbells             " Stop annoying sounds.
set visualbell               " Above.
set nomodeline               " Disable a silly feature and close a security hole.
set noswapfile               " Avoid some annoying messages.
set ignorecase               " Ignore character case while searching.
set noshowmode               " Show mode only in the status bar.
set smartcase                " Don't ignore case when starting with a majiscule letter.
set title                    " Change window title to the name of the current file.

" Shortcuts
map <C-j> <C-W>j             " Move cursor to window below.
map <C-k> <C-W>k             " Move cursor to window above.
map <C-h> <C-W>h             " Move cursor to window on the left.
map <C-l> <C-W>l             " Move cursor to window on the right.
nmap <leader>w :w!<cr>       " Fast saving.
