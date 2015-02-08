" TODO: Figure out what the hell I'm doing.

" =============================================================
set nocompatible          " get rid of Vi compatibility mode. SET FIRST!

" =============================================================
"                     General Configuration
" =============================================================

filetype indent on        " activates indenting for files
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set autoindent            " auto-indent
set tabstop=4             " tab spacing
set softtabstop=4         " unify
set shiftwidth=4          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set nowrap                " don't wrap text
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]

syntax enable             " enable syntax highlighting (previously syntax on).
set number                " show line numbers
set laststatus=2          " last window always has a statusline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if has('gui_running')
  set guioptions-=T  " no toolbar
  colorscheme elflord
endif

" =============================================================
"                       Visual Styling
" =============================================================
set t_Co=256              " enable 256-color mode.
colorscheme desert        " set colorscheme
set wrap
set linebreak
set nolist

" =============================================================
"                            Mappings
" =============================================================

" The visual mode mappings below have issues. Just avoid them for now.
nnoremap <A-j> :m .+1<CR>==        " Alt-j > Move current line(s) down in normal mode.
nnoremap <A-k> :m .-2<CR>==        " Alt-k > Move current line(s) up in normal mode.
inoremap <A-j> <Esc>:m .+1<CR>==gi " Alt-j > Move current line(s) down in insert mode.
inoremap <A-k> <Esc>:m .-2<CR>==gi " Alt-k > Move current line(s) up in insert mode.
vnoremap <A-j> :m '>+1<CR>gv=gv    " Alt-j > Move current line(s) down in visual mode. 
vnoremap <A-k> :m '<-2<CR>gv=gv    " Alt-k > Move current line(s) up in normal mode.
