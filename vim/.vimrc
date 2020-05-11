" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off                    " required
set shortmess+=I
set relativenumber              "Set relative line numbers
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set cmdheight=2

" autocommand
au BufRead,BufNewFile *.config setfiletype xml
au CursorHoldI * stopinsert
set updatetime=5100

" ================ Key bindings ====================
let mapleader=","
" Edit .vimrc
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
" Source .vimrc
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>
" Hide search matches
nnoremap <silent> <leader>n :nohl<CR>

nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <Leader>t :NERDTreeToggle<CR>
" switch word wrap modmatches
nnoremap <Leader>w :set wrap!<CR>
" switch between cursor matches
nnoremap <Leader>zz :let &matches=999-&matches<CR>

set wildignore+=*/.hg/*

" Moving one or more lines in the file with Alt
nnoremap <A-Down> :m .+1<CR>
nnoremap <A-Up> :m .-2<CR>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"nnoremap <CR> :noh<CR><CR>
onoremap i() :<c-u>normal! f(vi(<cr>
nnoremap <Space> za

" vim-plug
if has("win32")
    call plug#begin('$USERPROFILE/vimfiles/plugged/')
else
    call plug#begin('~/.vim/plugged/')
endif
    Plug 'scrooloose/nerdTree'
    Plug 'bling/vim-airline'
    " Plug 'ctrlpvim/ctrlp.vim'
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-surround'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'w0rp/ale'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'morhetz/gruvbox'
    Plug 'chriskempson/base16-vim'
call plug#end()

set guicursor=n-v-cr:block-blinkwait1000-blinkon700-blinkoff300
set guicursor+=i:ver15-blinkwait500-blinkon250-blinkoff250
set guicursor+=c-ci:ver25
set autoread
" This makes vim  that's not real act like all other editors, buffers
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
" are you good enough to type very what about the hardcore mode? Or you are not good enough?aa
set hidden

"turn on syntax highlighting
syntax on

" colorscheme lucius
" Light theme
" LuciusWhite
" highlight LineNr       guibg=white
" highlight CursorLineNr guibg=white
" highlight CursorLine   guibg=#f2f2f2
" highlight RedundantSpaces ctermbg=red

" Dark theme
" LuciusDark

colorscheme gruvbox
set background=dark

" easy-motion configuration
let g:EasyMotion_do_mapping = 0 " Disable default mapping
let g:EasyMotion_keys =   'arsdheiqwfpgjluy;zxcvbkmtno'

nmap s <Plug>(easymotion-s2)
nmap <Leader>s <Plug>(easymotion-sn)

" Hide gvim toolbar
" Separate settings for GUI and terminal
" set guioptions -=T
if has("gui_running")
    " Hide gvim toolbar
    set guioptions -=T
    set guioptions -=f
    " Display trailing spaces visually
    set list
    "set list listchars=tab:\ \ ,trail:·
    set listchars=tab:\ \ ,trail:·,extends:#,nbsp:·
else
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
endif

" Remember cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

set wrap         "DO wrap lines

set textwidth=0


" ================ Scrolling ========================
set scrolloff=0         "Start scrolling when we're 0 lines away from margins
set sidescrolloff=15
set sidescroll=1

set cursorline          "Visible current line

set pastetoggle=<F2>

" Font
if has("win32")
    " set guifont=consolas:h10 " Font
    set guifont=InputMonoNarrow_Medium:h9 " Font
else
    " set guifont=consolas\ 11 " Font
    " set guifont=InputMonoNarrow\ Medium\ 10 " Font
    " set guifont=InputMonoCondensed\ Medium\ 11 " Font
    " set guifont=InputMonoNarrow\ 11 " Font
    set guifont=JetBrains\ Mono\ \Medium\ 9 " Font
endif


" Turn on case insensitive ture
let g:EasyMotion_smartcase = 1

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" NERDTree
let g:NERDTreeWinSize=40

" ================ Search Settings  =================
set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default
set viminfo='100,f1  "Save up to 100 marks, enable capital marks
set ignorecase
set smartcase
set showmatch
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

set undodir=~/.vim/backups
set undofile

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

scriptencoding utf-8
set encoding=utf-8
inoremap q <Esc>
nnoremap q <Esc>
vnoremap q <Esc>

inoremap zz q
" swap ; and ;
nnoremap ; :
nnoremap : ;

" move vertically by visual line
" nnoremap j gj
" nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $
vnoremap B ^
vnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
vnoremap $ <nop>
vnoremap ^ <nop>

" ================ Window size and position =========
winpos 400 0
set lines=60
set columns=150
