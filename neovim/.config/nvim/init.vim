" source ~/.vimrc

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set relativenumber              "Set relative line numbers
set number                      "Line numbers are good
set showmode                    "Show current mode down the bottom
set cmdheight=2

" autocommand
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
elseif has("nvim")
    call plug#begin('~/.local/share/nvim/site/autoload/')
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
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
call plug#end()

set guicursor=n-v-cr:block-blinkwait1000-blinkon700-blinkoff300
set guicursor+=i:ver15-blinkwait500-blinkon250-blinkoff250
set guicursor+=c-ci:ver25
set autoread

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
elseif has("nvim")
else
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
endif

" Remember cursor position


" ================ Scrolling ========================
set scrolloff=0         "Start scrolling when we're 0 lines away from margins
set sidescrolloff=15
set sidescroll=1

set pastetoggle=<F2>

" Font
if has("win32")
    " set guifont=Consolas:h11 " Font
    set guifont=JetBrains_Mono_Medium:h9 " Font
else
    " set guifont=Ubuntu\ Mono\ 12 " Font
    set guifont=JetBrains\ Mono\ Medium:h9 " Font
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

set undofile

" ================ Indentation ======================

set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

inoremap q <Esc>
nnoremap q <Esc>
vnoremap q <Esc>

inoremap zz q

nnoremap zz q
vnoremap zz q
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

" nvim settings
if has("nvim")
endif

" CoC settings

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif


