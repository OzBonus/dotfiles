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
"   Custom Functions

" Vundle
set nocompatible                     " Ignore Vi relics.
filetype off                         " Vundle told me so.
set rtp+=~/.vim/bundle/Vundle.vim    " Set runtime path.
call vundle#begin()                  " Initialize.
Plugin 'VundleVim/Vundle.vim'        " Let Vundle manage itself.
    Plugin 'scrooloose/nerdtree'     " Filesystem explorer.
    Plugin 'airblade/vim-gitgutter'  " Visual git diff.
    Plugin 'tpope/vim-fugitive'      " Git wrapper.
    Plugin 'godlygeek/tabular'       " Line up text.
    Plugin 'jiangmiao/auto-pairs'    " Add complementary brackets.
    Plugin 'vim-airline/vim-airline' " Awesome status bar.
    Plugin 'chriskempson/base16-vim' " Base 16 color schemes.
        let base16colorspace=256
        set ttimeoutlen=10           " Leave insert mode faster.
        let g:airline_left_sep=''    " Left left side seperator.
        let g:airline_right_sep=''   " Set right side seperator.
    Plugin 'vim-airline/vim-airline-themes'
        let g:airline_theme='bubblegum'
call vundle#end()                    " Vundle told me so.
filetype plugin indent on            " Vundle told me so.

" General
set history=500         " Sets how many lines of history VIM must remember.
set autoread            " Auto read when a file is changed from the outside.
let mapleader=','       " A more sensible map leader.
nmap <leader>w :w!<cr>  " Fast saving.
nmap <leader>s :so%<cr> " Fast sourcing.

" VIM User Interface and Appearance
set number         " Show line numbers.
set t_Co=256       " Confirm ability to show 256 colors.
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
set cursorline     " Highlight the current line.
colorscheme base16-default-dark
"hi LineNr ctermfg=darkgrey
"hi CursorLineNr ctermbg=red ctermfg=white
"hi Visual ctermbg=white ctermfg=black
"hi CursorLine cterm=none
"hi MatchParen ctermbg=white ctermfg=black

" Extra GVIM Options
if has('gui_running')
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
autocmd FileType sh let b:did_indent=1

" Searching
set wildmenu                             " Visual auto complete for the command menu.
set wildignore=*.o,*~,*.pyc              " Ignore compiled files.
set hid                                  " Abandoned buffers are hidden.
set ignorecase                           " Ignore case while searching.
set smartcase                            " Try to be smart about cases.
set magic                                " Enable regular expression magic.
set incsearch                            " Highlight characters as they are entered.
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
