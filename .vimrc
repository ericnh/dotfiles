""" PERSONAL SETTINGS 
let mapleader=' '
syntax enable
set autoindent
set showcmd
set hidden
set showtabline=0
set number

" remove dumb fucking toolbar on gvim
set guioptions -=T
colorscheme desert
highligh Pmenu guibg=black guifg=green gui=bold

" tabs as 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

" custom mappings
noremap <leader>V :w<CR>:source ~/.vimrc<CR>
noremap <leader>s :w<CR>
noremap <M-a> ggvG$

""" VUNDLE PLUGINS
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim " set runtime path
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" project management
Plugin 'vim-ctrlspace/vim-ctrlspace'
" nerdtree file management
Plugin 'scrooloose/nerdtree'
" sassy css syntax highlighting
Plugin 'cakebaker/scss-syntax.vim'
call vundle#end()
filetype on
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal



""" PLUGIN CONFIGURATIONS
" nerdtree
" autocmd vimenter * NERDTree " open nerdtree upon start
map <leader>t :NERDTreeToggle<CR>
" LustyJuggler
map <leader>j :CtrlSpace<CR>
if executable ("ag")
  let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif
