"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
set modelines=0
filetype on
filetype plugin on
filetype indent on
syntax on
set number
set cursorline
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set encoding=utf-8
set autoindent
set scrolloff=10
set showcmd
set showmode
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

" WRAP ------------------------------------------------------------- {{{

set wrap
set textwidth=100
set formatoptions=qrn1
"set colorcolumn=100

" }}}

" SEARCH ------------------------------------------------------------- {{{

nnoremap / /\v
vnoremap / /\v
set nobackup
set swapfile
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set undodir=~/.vim/tmp/undo//
set incsearch
set ignorecase
set smartcase
set gdefault
set showmatch
set hlsearch
set history=1000
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" }}}

" BACKGROUND ------------------------------------------------------------- {{{
colorscheme codedark
hi Normal ctermbg=NONE guibg=NONE
hi LineNr ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
hi CursorLine ctermbg=NONE guibg=NONE
hi CursorColumn ctermbg=NONE guibg=NONE
hi EndOfBuffer ctermbg=NONE guibg=NONE
hi Visual ctermbg=4

" }}}

" PLUGINS ---------------------------------------------------------------- {{{
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.colnr = "\u33c7"

let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let g:NERDCreateDefaultMappings = 1
let g:airline_theme = 'codedark'
let g:airline_powerline_fonts = 1

" }}}

" MAPPINGS --------------------------------------------------------------- {{{

"let mapleader
inoremap jj <Esc>
nnoremap <space> :
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>v V`]
nnoremap <leader>w <C-w>v<C-w>h
nnoremap <leader>h <C-w>s
nnoremap <leader>r <C-W>R
nnoremap <leader>R <C-w>R

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype c setlocal tabstop=2 shiftwidth=2 expandtab

if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END

" }}}

