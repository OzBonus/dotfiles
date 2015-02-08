" =============================================================================
" I don't know what I'm doing! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" =============================================================================

" =============================================================================
" Vundle Settings ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" =============================================================================

filetype off                 " Vundle told me to do this.
set nocompatible             " get rid of Vi compatibility mode. SET FIRST!

" Set the runtime path to include Vundle and initialize.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Alternately, pass a different path where Vundle should initialize plugins.
" call vundle#begin('~/some/path/here')

Plugin 'gmarik/Vundle.vim'            " REQUIRED! Let Vundle manage Vundle.

Plugin 'tpope/vim-sensible'           " https://github.com/tpope/vim-sensible
Plugin 'terryma/vim-multiple-cursors' " https://github.com/terryma/vim-multiple-cursors
Plugin 'scrooloose/nerdtree'          " https://github.com/scrooloose/nerdtree
Plugin 'bling/vim-airline'            " https://github.com/bling/vim-airline
Plugin 'tpope/vim-fugitive'           " https://github.com/tpope/vim-fugitive
Plugin 'junegunn/goyo.vim'            " https://github.com/junegunn/goyo.vim
Plugin 'junegunn/limelight.vim'       " https://github.com/junegunn/limelight.vim
Plugin 'davidhalter/jedi-vim'         " https://github.com/davidhalter/jedi-vim

" All of your Plugins must be added before the following line
call vundle#end()            " REQUIRED!
filetype plugin indent on    " REQUIRED!

" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" =============================================================================
" Plugin Settings ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" =============================================================================

let g:airline_powerline_fonts=1 " Airline - Enable Powerline fonts (https://github.com/powerline/fonts)
set guifont=Liberation\ Mono\ for\ Powerline\ 11

" =============================================================================
" General Configuration ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" =============================================================================

set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set autoindent            " auto-indent
set ruler                 " Always show info along bottom.
set tabstop=4             " tab spacing
set softtabstop=4         " TODO: I'm not sure what this does exactly.
set shiftwidth=4          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set nowrap                " don't wrap text
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]

syntax enable             " enable syntax highlighting (previously syntax on).
set number                " show line numbers
set laststatus=2          " last window always has a statusline

set encoding=utf-8

" =============================================================================
" Visual Styling ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" =============================================================================

if has('gui_running')
    set guioptions-=T  " no toolbar
endif

set t_Co=256               " enable 256-color mode.

set wrap                   " Enable word-wrap.
set linebreak              " Only break at breakat characters.
set nolist                 " list disables linebreak
set textwidth=0
set wrapmargin=0

colorscheme badwolf        " BADWOLF: Set colorscheme.
let g:badwolf_darkgutter=1 " BADWOLF: Make gutter color darker than the background of the file.

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 81
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=IndianRed3
    autocmd FileType python match Excess /\%81v.*/
    autocmd FileType python set nowrap
    augroup END

" =============================================================================
" Custom Mappings ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" =============================================================================

" The visual mode mappings below have issues. Just avoid them if possible.
nnoremap <A-k> :m .-2<CR>==        " Alt-k > Move current line(s) up in normal mode.
inoremap <A-j> <Esc>:m .+1<CR>==gi " Alt-j > Move current line(s) down in insert mode.
inoremap <A-k> <Esc>:m .-2<CR>==gi " Alt-k > Move current line(s) up in insert mode.
vnoremap <A-j> :m '>+1<CR>gv=gv    " Alt-j > Move current line(s) down in visual mode. 
vnoremap <A-k> :m '<-2<CR>gv=gv    " Alt-k > Move current line(s) up in normal mode.
nnoremap <A-j> :m .+1<CR>==        " Alt-j > Move current line(s) down in normal mode.
