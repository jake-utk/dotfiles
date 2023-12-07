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

set modelines=0
set number
set nocursorcolumn
set nocursorline

autocmd FileType c,cpp,py,js,jsx,ts,tsx,md,tex,scm,rkt setlocal expandtab
autocmd BufWritePre *.c,*.cpp,*.py,*.js,*.jsx,*.ts,*.tsx,*.md,*.tex,*.scm,*.rkt %s/\s\+$//e

autocmd BufNewFile,BufRead *.py
            \ set tabstop=4
            \ softtabstop=4
            \ shiftwidth=4
            \ textwidth=79
autocmd BufNewFile,BufRead {*.js,*.jsx,*.ts,*.tsx,*.html,*.css}
            \ set tabstop=2
            \ softtabstop=2
            \ shiftwidth=2
            \ textwidth=99
autocmd BufNewFile,BufRead {*.c,*.cpp}
            \ set tabstop=2
            \ softtabstop=2
            \ shiftwidth=2
            \ textwidth=79
autocmd BufNewFile,BufRead {*.tex,*.md}
            \ set tabstop=4
            \ softtabstop=4
            \ shiftwidth=4
            \ textwidth=99

set fileformat=unix
set autoindent
set encoding=utf-8
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
set wrap
set formatoptions=qrn1
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" BACKUP ------------------------------------------------------------- {{{

" Disabling backups for coc.nvim
set nobackup
set nowritebackup

set swapfile
set undofile
set undoreload=10000
"set backupdir=~/.vim/tmp/backup//
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

" PLUGINS ---------------------------------------------------------------- {{{

" ALE
let g:ale_disable_lsp = 1
let g:ale_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['trim_whitespace', 'remove_trailing_lines'],
\   'python': ['black', 'isort'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'javascriptreact': ['prettier'],
\   'typescriptreact': ['prettier'],
\   'css': ['prettier'],
\   'json': ['prettier'],
\}
let g:ale_linters = {
\   'python': ['ruff', 'mypy'],
\   'c': ['cc', 'cpplint'],
\   'cpp': ['cpplint'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'javascriptreact': ['eslint'],
\   'typescriptreact': ['eslint'],
\   'css': ['eslint'],
\   'json': ['eslint'],
\}
" C
let g:ale_c_cc_options = '-std=c11'
let g:ale_c_cppcheck_options = '--template "{file}({line}): {severity} ({id}): {message}"'
let g:ale_c_cpplint_options = '--filter=-readability/casting,-runtime/threadsafe_fn'
" C++
let g:ale_cpp_cc_options = '-std=c++14'
let g:ale_cpp_cppcheck_options = '--template "{file}({line}): {severity} ({id}): {message}"'
let g:ale_cpp_cpplint_options = '--filter=-build/header_guard'

" TermDebug
autocmd FileType c,cpp packadd termdebug
let g:termdebug_popup = 0
let g:termdebug_wide = 163

" NERDTree
let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDCreateDefaultMappings = 1
let NERDTreeHighlightCursorline=0

" Airline
let g:airline_theme = 'codedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1

" FZF
set rtp+=/usr/bin/fzf
let g:fzf_preview_window = ['right:50%', 'CTRL-/']

" VimTeX
if executable('zathura')
  let g:vimtex_view_method = 'zathura'
endif
let g:vimtex_view_forward_search_on_start = 0
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" SLIMV
let g:slimv_repl_split=4
let g:slimv_repl_split_size=40

" }}}

" COLORSCHEME & SYNTAX  ------------------------------------------------------------- {{{

" Below is commented out due to causing tmuxline discoloration when terinal
" opened in VIM
"autocmd VimEnter * set termguicolors
filetype on
filetype plugin on
filetype indent on
syntax on

autocmd BufRead,BufNewFile *.py let python_highlight_all=1
let g:codedark_term256=1
let g:codedark_transparent=1
colorscheme codedark

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

" Next buffer, previous buffer
nnoremap <c-n> :bn<CR>
nnoremap <c-p> :b#<CR>


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
