call plug#begin('~/.config/nvim/plugins')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim'
Plug 'wakatime/vim-wakatime'

call plug#end()

syntax on

"Настройка табов 
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4

set autoindent "Автоотступ
set t_Co=256 "Включаем 256 цветов
set background=dark "Темная тема
set number "Нумерация строк
set ignorecase
set smartcase
set mousehide "Спрятать курсор когда набираем текст
set mouse=a "Включить поддержку мыши
set novisualbell "Не мигать
set nocompatible
set laststatus=2
set termencoding=utf-8 "Кодировка на utf-8
set backspace=indent
set showtabline=1 "Черточки на табах

"Перенос строк
set wrap
set linebreak

set noswapfile
set encoding=utf-8
set nobackup

set clipboard=unnamed
set ruler
set hidden
