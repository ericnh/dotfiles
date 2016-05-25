""" LEADER
let mapleader='\'
map <space> <leader>
set showcmd
""" SYNTAX
syntax enable
set autoindent
au BufNewFile,BufRead *.ejs set filetype=html " highlight ejs with html syntax
" TABS AS SPACES
set tabstop=2    " number of visual spaces per TAB
set softtabstop=2    " number of spaces in tab when editing
set expandtab    " tabs are spaces
set smarttab
" MISC
set noswapfile    " seem to be more trouble than they are worth
set cursorline    " highlight current line

" gui configuration
color desert
set guioptions -=T   " remove dumb fucking toolbar on gvim
" haxor list colors
highlight Pmenu guibg=black guifg=green 
highlight PmenuSel guibg=green guifg=black gui=bold
" show line numbers in dark grey
set number
highlight LineNr ctermfg=16

""" CUSTOM MAPPINGS
nnoremap <CR> G
nnoremap <M-a> ggvG$   " highlight all
" Quick save
nnoremap <leader>s :w<CR> 
nnoremap <leader>v :source ~/.vimrc<CR>
" Easy scrolling
nnoremap J <C-e>
nnoremap K <C-y>
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
map B ^
map E $


""" PLUGINS
set nocompatible                  " be iMproved, required 
filetype off                      " required 
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'        " plugin management
  Plugin 'vim-ctrlspace/vim-ctrlspace' " project management
  Plugin 'scrooloose/nerdtree'         " file management
  Plugin 'scrooloose/nerdcommenter'    " comment helper
  Plugin 'vim-airline/vim-airline'     " statusline helper
  Plugin 't9md/vim-textmanip'          " movement helper
  Plugin 'vim-coffee-script'           " syntax coffee
  Plugin 'briancollins/vim-jst'        " syntax jst
  Plugin 'cakebaker/scss-syntax.vim'   " syntax sass
call vundle#end()            " required

filetype plugin indent on    " required
 
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
map <leader>t :NERDTreeToggle<CR>

" ctrlspace setting
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

set hidden          " not sure what this one does, I think ctrl space wanted it
set showtabline=0   " ctrlspace organizes the tabs in a list
if has("gui_running")
    " Settings for MacVim and Inconsolata font
    let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
endif
if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

" textmanip
xmap <D-d> <Plug>(textmanip-duplicate-down)
nmap <D-d> <Plug>(textmanip-duplicate-down)
xmap <D-D> <Plug>(textmanip-duplicate-up)
nmap <D-D> <Plug>(textmanip-duplicate-up)

xmap <C-j> <Plug>(textmanip-move-down)
nmap <C-j> <Plug>(textmanip-move-down)
xmap <C-k> <Plug>(textmanip-move-up)
nmap <C-k> <Plug>(textmanip-move-up)
xmap <C-h> <Plug>(textmanip-move-left)
xmap <C-l> <Plug>(textmanip-move-right)

