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
set number
set cursorline

autocmd FileType c,cpp,py,js,ts,md,tex autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType c,cpp,py packadd termdebug

augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END

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
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

" WRAP ------------------------------------------------------------- {{{

set wrap
set textwidth=79
set formatoptions=qrn1
"set colorcolumn=100
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

" BACKUP ------------------------------------------------------------- {{{

set swapfile
set undofile
set undoreload=10000
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set undodir=~/.vim/tmp/undo//

" }}}

" SEARCH ------------------------------------------------------------- {{{

nnoremap / /\v
vnoremap / /\v
set incsearch
set ignorecase
set smartcase
set gdefault
set showmatch
set hlsearch
set history=1000
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" }}}

" COLORSCHEME & SYNTAX  ------------------------------------------------------------- {{{

filetype on
filetype plugin on
filetype indent on
syntax on

colorscheme codedark
hi Normal ctermbg=NONE guibg=NONE
hi LineNr ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
hi CursorLine ctermbg=NONE guibg=NONE
hi CursorColumn ctermbg=NONE guibg=NONE
hi EndOfBuffer ctermbg=NONE guibg=NONE
hi Visual ctermbg=4

autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

augroup python
    autocmd!
    autocmd FileType python syn keyword pythonStatement class nextgroup=pythonClass skipwhite
    autocmd FileType python syn match pythonClass "\%(\%(class\s\)\s*\)\@<=\h\%(\w\|\.\)*" contained nextgroup=pythonClassVars
                \ | highlight def link pythonClass pythonClassDef
    autocmd Filetype python syn region pythonClassVars start="(" end=")" contained contains=pythonClassParameters transparent keepend
    autocmd FileType python syn match pythonClassParameters "[^,\*]*" contained contains=pythonBuiltin,pythonBuiltinObj,pythonBuiltinType,pythonExtraOperatorpythonStatement,pythonBrackets,pythonString,pythonComment skipwhite
                \ | highlight def link pythonClassParameters pythonClassVar
    autocmd FileType python syn keyword pythonNone        None
                \ | highlight def link pythonNone pythonNone
    autocmd FileType python syn keyword pythonBoolean     True False
                \ | highlight def link pythonBoolean pythonBoolean
augroup end

" }}}

" PLUGINS ---------------------------------------------------------------- {{{

" TermDebug
let g:termdebug_popup = 0
let g:termdebug_wide = 163

" NERDTree
let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDCreateDefaultMappings = 1

" Airline
let g:airline_theme = 'codedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1

" FZF
set rtp+=/usr/bin/fzf
let g:fzf_preview_window = ['right:50%', 'CTRL-/']

" VimTeX
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_forward_search_on_start = 0

" Gutentags
let g:gutentags_modules = ['ctags', 'gtags_cscope'] " Requires gutentags_plus
let g:gutentags_project_root = ['.root'] " can add .root to non-git tracked project
let g:gutentags_cache_dir = expand('~/.cache/tags')
let g:gutentags_plus_switch = 1 " change focus to quickfix window after search (optional).

" }}}

" MAPPINGS --------------------------------------------------------------- {{{

inoremap jj <Esc>
nnoremap <space> :
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
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

" NERDTree
nnoremap <leader>t :NERDTree %<CR>
nnoremap <leader>T :NERDTreeToggle<CR>

" FZF
noremap <leader>F :Files<cr>
noremap <leader>f :Rg<cr>

" }}}

" BRACKETED-PASTE --------------------------------------------------------------- {{{

" - https://github.com/ConradIrwin/vim-bracketed-paste/blob/master/plugin/bracketed-paste.vim

if exists("g:loaded_bracketed_paste")
  finish
endif
let g:loaded_bracketed_paste = 1

let &t_ti .= "\<Esc>[?2004h"
let &t_te = "\e[?2004l" . &t_te

function! XTermPasteBegin(ret)
  set pastetoggle=<f29>
  set paste
  return a:ret
endfunction

execute "set <f28>=\<Esc>[200~"
execute "set <f29>=\<Esc>[201~"
map <expr> <f28> XTermPasteBegin("i")
imap <expr> <f28> XTermPasteBegin("")
vmap <expr> <f28> XTermPasteBegin("c")
cmap <f28> <nop>
cmap <f29> <nop>

" }}}
