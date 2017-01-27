set nocompatible              " be iMproved, required
filetype off                  " required
"------------------------------------------------------------------------------
" NerdTree and Tagbar Config
"------------------------------------------------------------------------------
autocmd vimenter * NERDTree | wincmd p
autocmd vimenter * Tagbar
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinSize=15
let g:tagbar_width=22
"------------------------------------------------------------------------------
"Powerline Section
"------------------------------------------------------------------------------
"set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim
"set nocompatible
"set t_Co=256
" 
"let g:minBufExplForceSyntaxEnable = 5
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup
"
"if ! has('gui_running')
"	set ttimeoutlen=10
"	augroup FastEscape
"	    autocmd!
"       au InsertEnter * set timeoutlen=0
"	    au InsertLeave * set timeoutlen=1000
"	augroup END
"endif
				    
"set laststatus=2 " Always display the statusline in all windows
"set guifont=Inconsolata\ for\ Powerline:h14
"set noshowmode " Hide the default mode text 
"------------------------------------------------------------------------------
"Vundle Section
"------------------------------------------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Bundle 'klen/python-mode'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'mhinz/vim-startify'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
" The following are examples of different formats supported.

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

"------------------------------------------------------------------------------
" The config below are for the tabs and spaces
"------------------------------------------------------------------------------
" number of visual spaces per TAB
"
set tabstop=4
" Indents will have a width of 4
set shiftwidth=4 
" number of spaces in tab when editing
set softtabstop=4
" tabs are spaces
set expandtab
"------------------------------------------------------------------------------
" The config below are for the search options
"------------------------------------------------------------------------------
set incsearch " search as characters are entered
set hlsearch " highlight matches
"------------------------------------------------------------------------------
" UI Layout
"------------------------------------------------------------------------------
"show line numbers
set number
"Show Ruler
set colorcolumn=80
"------------------------------------------------------------------------------
" Customize Keymapping
"------------------------------------------------------------------------------
map <C-A> <C-W>
