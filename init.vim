call plug#begin('~/.config/nvim/plugins')

Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'itchyny/lightline.vim'
Plug 'wakatime/vim-wakatime'

call plug#end()

syntax on
colorscheme gruvbox
set background=dark
set number
set expandtab
set tabstop=2

set hlsearch
set incsearch

"open key
map <C-x> :NERDTreeToggle<CR>
"open by default
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists(“s:std_in”) | NERDTree | endif
"close NT if close project
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"more clean look
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"close NT if choose file
let NERDTreeQuitOnOpen = 1
