" =============================================================================
" Vundle and Plugins
" =============================================================================
set nocompatible              " be iMproved, required for vundle
filetype off                  " required for vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required for vundle
Plugin 'VundleVim/Vundle.vim'

" list of installed plugins
Plugin 'sickill/vim-monokai'
Plugin 'airblade/vim-gitgutter'

" all of your Plugins must be added before the following line
call vundle#end()             " required for vundle
filetype plugin indent on     " required for vundle

" =============================================================================
" UI and Colours
" =============================================================================
syntax enable                 " enable syntax processing
set background=dark           " setting dark mode
colorscheme monokai

set tabstop=4                 " number of visual spaces per TAB
set softtabstop=4             " number of spaces in tab when editing
filetype indent on            " load filetype-specific indent files

set number                    " show line numbers
set cursorline                " highlight current line
set colorcolumn=80
set showmatch                 " highlight matching [{()}]

" =============================================================================
" Search
" =============================================================================
set incsearch                 " search as characters are entered
set hlsearch                  " highlight matches

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" =============================================================================
" Code Folding
" =============================================================================
set foldenable                " enable folding
set foldlevelstart=10         " open most folds by default
set foldnestmax=10            " 10 nested fold max
set foldmethod=indent         " fold based on indent level

" space open/closes folds
nnoremap <space> za

" =============================================================================
" Other
" =============================================================================
set wildmenu                  " visual autocomplete for command menu

set lazyredraw                " redraw only when we need to.

" disable the arrows to avoid bad habits
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
