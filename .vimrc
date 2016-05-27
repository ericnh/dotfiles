""" PLUGINS
set nocompatible                  " be iMproved, required 
filetype off                      " required 
filetype plugin indent on    " required
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize

call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'        " plugin management
  Plugin 'vim-ctrlspace/vim-ctrlspace' " project management
  Plugin 'scrooloose/nerdtree'         " file management
  Plugin 'mileszs/ack.vim'             " text search
  Plugin 'valloric/youcompleteme'      " code completion
  Plugin 'tpope/vim-rails'             " rails helper
  Plugin 'scrooloose/nerdcommenter'    " comment helper
  Plugin 'vim-airline/vim-airline'     " statusline helper
  Plugin 't9md/vim-textmanip'          " movement helper
  Plugin 'vim-coffee-script'           " syntax coffee
  Plugin 'briancollins/vim-jst'        " syntax jst
  Plugin 'cakebaker/scss-syntax.vim'   " syntax sass
call vundle#end()            " required
" see :h vundle for more details or wiki for FAQ


""" LEADER
let mapleader='\'
map <space> <leader>
set showcmd

""" CUSTOM MAPPINGS
" newline
nnoremap <CR> o<esc>
" select all
nnoremap <M-a> ggvG$
" quick save
nnoremap <leader>s :w<CR> 
" easy scrolling
nnoremap J <C-e>
nnoremap K <C-y>
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
map B ^
map E $
 
""" PLUGIN MAPPINGS
" nerdtree mapping
map <leader>t :NERDTreeToggle<CR>
" ctrlspace mappings
map <leader>h :CtrlSpace<CR>
map <leader>H :CtrlSpace<CR>H
map <leader>l :CtrlSpace<CR>l
map <leader>L :CtrlSpace<CR>L
map <leader>o :CtrlSpace<CR>o
map <leader>O :CtrlSpace<CR>O
map <leader>b :CtrlSpace<CR>b
map <leader>B :CtrlSpace<CR>B
map <leader>w :CtrlSpace<CR>w
map <leader>W :CtrlSpace<CR>W
" ctrlspace settings
set hidden          " not sure what this one does, I think ctrl space wanted it
set showtabline=0   " ctrlspace organizes the tabs in a list
" ctrlspace font settings when gui running
if has("gui_running")
    let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
endif
" ctrlspace and ack use ag for search
if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
    let g:ackprg = 'ag --vimgrep'
endif
" ack mapping
nnoremap <leader>a :Ack<space>
" textmanip duplicate lines
xmap <D-d> <Plug>(textmanip-duplicate-down)
nmap <D-d> <Plug>(textmanip-duplicate-down)
xmap <D-D> <Plug>(textmanip-duplicate-up)
nmap <D-D> <Plug>(textmanip-duplicate-up)
" textmanip move lines
xmap <C-j> <Plug>(textmanip-move-down)
nmap <C-j> <Plug>(textmanip-move-down)
xmap <C-k> <Plug>(textmanip-move-up)
nmap <C-k> <Plug>(textmanip-move-up)
xmap <C-h> <Plug>(textmanip-move-left)
xmap <C-l> <Plug>(textmanip-move-right)


""" SYNTAX
syntax enable
set autoindent
au BufNewFile,BufRead *.ejs set filetype=html " highlight ejs with html syntax

" TABS AS SPACES
set tabstop=2    " number of visual spaces per TAB
set softtabstop=2    " number of spaces in tab when editing
set shiftwidth=2  " indent two spaces
set expandtab    " tabs are spaces
set smarttab

" GUI
color desert
set guioptions -=T   " remove dumb fucking toolbar on gvim
" haxor list colors
highlight Pmenu guibg=black guifg=green 
highlight PmenuSel guibg=green guifg=black gui=bold
" show line numbers in dark grey
set number
highlight LineNr ctermfg=16

" MISC
set noswapfile    " seem to be more trouble than they are worth
set cursorline    " highlight current line

