call plug#begin('~/.config/nvim/plugins')

Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'

call plug#end()

syntax on
set background=dark
set number
        
set hlsearch
set incsearch

"open key
map <C-x> :NERDTreeToggle<CR>
"close NT if close project
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"more clean look
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"close NT if choose file
let NERDTreeQuitOnOpen = 1

"autocmd BufWritePost config.h, config.def.h !sudo make install
