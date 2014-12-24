" Sources
"   https://gist.github.com/pthrasher/3933522
"   http://winged.ch/vim-auto-install-for-vundle.html
"   https://github.com/r00k/dotfiles/blob/master/vimrc

set nocompatible
filetype off

" If vundle is not installed, do it first
let fresh_install=0
let vundle_dir=expand("$HOME/.vim/bundle/vundle")
if (!isdirectory(vundle_dir))
    call system(expand("mkdir -p $HOME/.vim/bundle"))
    call system(expand("git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/vundle"))
    let fresh_install=1
endif

set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

Plugin 'flazz/vim-colorschemes'
Plugin 'indenthtml.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'leshill/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-markdown'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Now install the Plugins if it is a new build
if fresh_install == 1
    :BundleInstall
endif


syntax on " Syntax highlighting

set number " Show line numbers
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set smartindent " Intellegently dedent / indent new lines based on rules.

set laststatus=2
set statusline=%F%m%r%h%w\ (%Y)\%=[%l/%L,%v][%p%%]

if (!isdirectory(expand("$HOME/.tmp")))
    call system(expand("mkdir -p $HOME/.tmp"))
endif
" Don't clutter my dirs up with swp and tmp files
set backupdir=$HOME/.tmp,/tmp
set directory=$HOME/.tmp,/tmp
set noswapfile


" don't nag me when hiding buffers
set hidden " allow me to have buffers with unsaved changes.
set autoread " when a file has changed on disk, just load it. Don't ask.

" Make search more sane
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.

" allow the cursor to go anywhere in visual block mode.
set virtualedit+=block

" leader is a key that allows you to have your own "namespace" of keybindings.
" You'll see it a lot below as <leader>
let mapleader = ","

" So we don't have to press shift when we want to get into command mode.
nnoremap ; :
vnoremap ; :

" So we don't have to reach for escape to leave insert mode.
inoremap jf <esc>

" bindings for easy split nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use sane regex's when searching
nnoremap / /\v
vnoremap / /\v

" Clear match highlighting
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Quick buffer switching - like cmd-tab'ing
nnoremap <leader><leader> <c-^>


" Visual line nav, not real line nav
" If you wrap lines, vim by default won't let you move down one line to the
" wrapped portion. This fixes that.
noremap j gj
noremap k gk

" Plugin settings:

" Map the key for toggling comments with vim-commentary
nnoremap <leader>c <Plug>CommentaryLine

" Let ctrlp have up to 30 results.
let g:ctrlp_max_height = 30

set background=dark
colorscheme desert 
