""" PLUGINS
set nocompatible                  " be iMproved, required 
syntax on
filetype off                      " required 
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize

call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'        " plugin management
  Plugin 'vim-ctrlspace/vim-ctrlspace' " project management
  Plugin 'scrooloose/nerdtree'         " file management
  Plugin 'mileszs/ack.vim'             " text search
  Plugin 'easymotion/vim-easymotion'   " movement helper
  Plugin 't9md/vim-textmanip'          " movement helper
  Plugin 'tpope/vim-surround'          " editor helper
  Plugin 'scrooloose/nerdcommenter'    " comment helper
  Plugin 'vim-scripts/ZoomWin'         " window focus
  Plugin 'tpope/vim-rails'             " rails helper
  Plugin 'vim-coffee-script'           " syntax coffee
  Plugin 'briancollins/vim-jst'        " syntax jst
  Plugin 'cakebaker/scss-syntax.vim'   " syntax sass
  Plugin 'leafgarland/typescript-vim'  " syntax typescript
  if has("gui_running")
    Plugin 'valloric/youcompleteme'      " code completion
  endif
call vundle#end()            " required
" see :h vundle for more details or wiki for FAQ


""" LEADER
let mapleader='\'
map <space> <leader>
set showcmd

""" CUSTOM MAPPINGS
" nnoremap <CR> o<esc>
" select all
nnoremap <M-a> ggvG$
" quick save
nmap <C-s> :write<CR>
nmap S :write<CR>
" easy scrolling
nnoremap J <C-e>
nnoremap K <C-y>
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
map H ^
map L $
" window navigation
nmap <silent> <Up> :wincmd k<CR>
nmap <silent> <Down> :wincmd j<CR>
nmap <silent> <Left> :wincmd h<CR>
nmap <silent> <Right> :wincmd l<CR>
" Redo symetrically
nnoremap U <C-r>
 
""" PLUGIN MAPPINGS
" nerdtree mapping
map <leader>t :NERDTreeToggle<CR>
" nerdcommenter settings
let NERDSpaceDelims=1 " Add space after comment mark
" ctrlspace mappings
map <leader>h :CtrlSpace<CR>
map <leader>l :CtrlSpace<CR>l
map <leader>o :CtrlSpace<CR>O
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
xmap <C-d> <Plug>(textmanip-duplicate-down)
nmap <C-d> <Plug>(textmanip-duplicate-down)
xmap <C-D> <Plug>(textmanip-duplicate-up)
nmap <C-D> <Plug>(textmanip-duplicate-up)
" textmanip move lines
xmap <C-j> <Plug>(textmanip-move-down)
nmap <C-j> <Plug>(textmanip-move-down)
xmap <C-k> <Plug>(textmanip-move-up)
nmap <C-k> <Plug>(textmanip-move-up)
xmap <C-h> <Plug>(textmanip-move-left)
nmap <C-h> <Plug>(textmanip-move-left)
xmap <C-l> <Plug>(textmanip-move-right)
nmap <C-l> <Plug>(textmanip-move-right)

nmap gl :Loremipsum 5<CR>


""" SYNTAX
filetype plugin indent on
set autoindent
au BufNewFile,BufRead *.ejs set filetype=html " highlight ejs with html syntax

" TABS AS SPACES
set tabstop=2    " number of visual spaces per TAB
set softtabstop=2    " number of spaces in tab when editing
set shiftwidth=2  " indent two spaces
set shiftround   " rounds indent to multiple of shiftwidth
set expandtab    " tabs are spaces
set smarttab

" GUI
color desert
set autoread " get rid of warning after git makes a change to a file
" remove dumb fucking toolbar on gvim
if has("gui_running")
  set guioptions -=T 
endif
" haxor list colors
highlight Pmenu guibg=black guifg=green 
highlight PmenuSel guibg=green guifg=black gui=bold
" show line numbers in dark grey
set number
highlight LineNr ctermfg=16

" MISC
set noswapfile    " seem to be more trouble than they are worth
set cursorline    " highlight current line

" SEARCH
set incsearch
map f <Plug>(easymotion-s)

" TYPESCRIPT
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
