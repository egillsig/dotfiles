set t_Co=256
" Install vim-plug automatically
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/taglist.vim'
" Plug 'Valloric/YouCompleteMe',  { 'do': './install.py' }
Plug 'mileszs/ack.vim'
Plug 'ervandew/supertab'

Plug 'vimwiki/vimwiki'
Plug 'vim-scripts/taglist.vim'
Plug 'ap/vim-buftabline'

" statusline + colors
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" language-specific
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'lervag/vimtex', { 'for': 'tex' }

Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'venantius/vim-cljfmt', {'for': 'clojure' }
Plug 'venantius/vim-eastwood', {'for': 'clojure'}
Plug 'guns/vim-slamhound', {'for': 'clojure'}
" Plug 'vim-scripts/paredit.vim', { 'for': 'clojure' }
Plug 'guns/vim-sexp', {'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': 'clojure' }
Plug 'kien/rainbow_parentheses.vim', { 'for': 'clojure' }

Plug 'fisadev/vim-isort', {'for': 'python' }
Plug 'tmhedberg/SimpylFold', {'for': 'python'}
" Plug 'python-mode/python-mode', { 'for': 'python' }
" let g:pymode_python = 'python3'
" Plug 'davidhalter/jedi-vim', {'for': 'python' }
" Plug 'guyzmo/vim-gf-python', {'for': 'python'}
" Plug 'fs111/pydoc.vim', {'for': 'python'}
" Plug 'vim-scripts/pydoc.vim', {'for': 'python'}

call plug#end()

"tab settings
set expandtab
" set softtabstop=4
" set tabstop=4
set shiftwidth=4

" Show tab characters and trailing spaces
set list

" Jump to last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set showcmd     " Show (partial) command in status line.
set showmatch   " Show matching brackets.
set ignorecase  " Do case insensitive matching
set infercase   " Case insensitive completion matching still completes case sensitively
set smartcase   " Do smart case matching (case sensitive iff pattern contains an uppercase letter)
set tagcase=match
set autowrite   " Automatically save before commands like :next and :make
set hidden    " Hide buffers when they are abandoned
set mouse=a   " Enable mouse usage (all modes)

set background=dark
colorscheme lucid
set undofile
set undodir=~/.vim/undo


" Autoreload .vimrc
autocmd! bufwritepost .vimrc source %

"highlight searching
set hlsearch

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

"line numbering
set nu

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set numberwidth=3
set cursorline

" make j and k work as expected for long lines
map j gj
map k gk
map <Down> gj
map <Up> gk

" lsit increment
function! Incr()
  let a = line('.') - line("'<")
  let c = virtcol("'<")
  if a > 0
    execute 'normal! '.c.'|'.a."\<C-a>"
  endif
  normal `<
endfunction
vnoremap <C-a> :call Incr()<CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Standard CtrlP also in insert mode
" imap <C-p> <ESC>:CtrlP<CR>

" Shortcuts
" imap <C-w> <Esc><C-w> " move through windows in insert mode
imap <C-v> <Esc><C-v> " allow block selection in insert mode

" noremap K i<CR><Esc> " Split line

"  " Stupid shift key fixes
cmap WQ wq
cmap Wq wq

imap jk <Esc>
vmap <CR> <Esc>

autocmd FileType scheme setlocal shiftwidth=2 softtabstop=2
autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2
autocmd FileType tex setlocal shiftwidth=2 softtabstop=2
autocmd FileType sml setlocal shiftwidth=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 softtabstop=2
autocmd FileType vue setlocal shiftwidth=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 softtabstop=2
autocmd FileType erb setlocal shiftwidth=2 softtabstop=2
autocmd FileType vim setlocal shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 softtabstop=2

augroup filetypedetect
  au! BufRead,BufNewFile *.sage,*.spyx,*.pyx setfiletype python
augroup END

augroup filetypedetect
  au! BufRead,BufNewFile *.decaf setfiletype java
augroup END

augroup filetypedetect
  au! BufRead,BufNewFile *.html.erb setfiletype html
augroup END

au Filetype clojure nmap <c-c><c-k> :Require<cr>

" au Filetype javascript setlocal path+=$PWD/node_modules,$PWD/node_modules/.bin suffixesadd+=.js

" Syntastic
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_wq = 0

let g:syntastic_scala_checkers = ['']
" let g:syntastc_disabled_filetypes=['java']

let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_python_checkers = ['pyflakes', 'flake8']
let g:syntastic_python_pylint_args = "--load-plugins pylint_django"
let g:syntastic_python_flake8_args = "--max-line-length=90"
let g:syntastic_python_exec = '/usr/bin/env python'

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
set undofile
set wrap
set linebreak

" let g:airline_theme='wombat'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '◀'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

nnoremap <C-s> :TlistToggle<CR>
map <C-n> :NERDTreeToggle<CR>
let mapleader = ","

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-g> :call NumberToggle()<CR>

" Complete-mode mappings
" tags
inoremap <C-]> <C-X><C-]>
" filenames
inoremap <C-F> <C-X><C-F>
" definitions or macros
inoremap <C-D> <C-X><C-D>
" whole lines
inoremap <C-L> <C-X><C-L>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" buftabline settings
let g:buftabline_show = 1 " Only show if at least two buffers
let g:buftabline_numbers = 1
nmap <leader><tab> :bnext<CR>
nmap <leader><s-tab> :bNext<CR>
nmap <leader>bd :bp\|bd #<CR>

" supertab
" Context-sensitive supertab completion
" recognizes / (filenames) ., :: and -> (omni)
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabClosePreviewOnPopupClose = 1

" Ack
let g:ackhighlight = 1
nnoremap <Leader>a :Ack!<Space>

" Rainbow parenthesis
au FileType clojure RainbowParenthesesActivate
au FileType clojure RainbowParenthesesLoadRound
au FileType clojure RainbowParenthesesLoadSquare
au FileType clojure RainbowParenthesesLoadBraces

" rainbow paren colors (reverse direction, removed black from default list)
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['red',         'firebrick3'],
    \ ]

" Python folding settings
let g:SimpylFold_fold_docstring=0
let g:SimpylFold_fold_import=0

" Folding shortcuts toggle w/space in insert mode, create folds in visual mode
nnoremap <space> za
vnoremap <space> zf

let g:vue_disable_pre_processors=1

let g:ctrlp_custom_ignore = 'node_modules\|git'

