"-----------------------------------------------------------------------------
" Global Stuff
"-----------------------------------------------------------------------------

" Set filetype stuff to on
filetype on
filetype plugin on
filetype indent on


" Tabstops are 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4


" set the search scan to wrap lines
set wrapscan


" set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase

" Incrementally match the search
set incsearch

" Enable search highlighting
set hlsearch

" Make command line two lines high
set ch=2

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" set visual bell
"set vb          

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" Show the current command in the lower right corner
set showcmd

" Show the current mode
set showmode

" Switch on syntax highlighting.
syntax on

" Hide the mouse pointer while typing
set mousehide

" Keep some stuff in the history
set history=100

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

set autowrite

set background=dark

set backspace=indent,eol,start

"set fileencodings=ucs-bom,utf-8,default,latin1

"set runtimepath=~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim71,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after

set showmatch

"set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set helplang=en

set ruler

set undolevels=1000

set foldcolumn=2

set number

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" Make the command-line completion better
set wildmenu

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" get rid of the silly characters in window separators
set fillchars=""

" Turn tabs into spaces
set expandtab


" O tamanho de 160 caracteres para quebra automatica de linhas é bom no notebook
set textwidth=160
set nowrap

" Destaca a linha atual do cursor
set cursorline


set shortmess=AI


"-----------------------------------------------------------------------------
" NERD Tree Plugin Settings
"-----------------------------------------------------------------------------
" Toggle the NERD Tree on an off with F7
nmap <F7> :NERDTreeToggle<CR>

" Store the bookmarks file in perforce
let NERDTreeBookmarksFile="~/.vim/NERDTreeBookmarks"

" Show the bookmarks table on startup
" let NERDTreeShowBookmarks=1
"
" " Don't display these kinds of files
" let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
"             \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
"                         \ '\.embed\.manifest$', '\.embed\.manifest.res$',
"                                     \ '\.intermediate\.manifest$',
"                                     '^mt.dep$' ]


"-----------------------------------------------------------------------------
" MAPs
"-----------------------------------------------------------------------------
"map <F12> :!clear; time python3 make.py<Return>
"map <C-F12> :!clear; ./FORGATRAN<Return>






