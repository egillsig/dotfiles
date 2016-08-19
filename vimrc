" Install vim-plug automatically
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'
" Plug 'Valloric/YouCompleteMe'
Plug 'flazz/vim-colorschemes'

Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }

"" snippets
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

" Github repos of the user 'vim-scripts'
" => can omit the username part
" Plug 'AutomaticLaTeXPlugin'

call plug#end()

" Indentation rules and plugins according to detected filetype
if has("autocmd")
  filetype plugin indent on
endif

"tab settings
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start

" Show tab characters and trailing spaces
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list

if has("syntax")
  syntax on
endif

" Jump to last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching (case sensitive iff pattern contains an uppercase letter)
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

set background=dark
colorscheme lucid

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
imap <C-p> <ESC>:CtrlP<CR>

" Shortcuts
" imap <C-w> <Esc><C-w> " move through windows in insert mode
imap <C-v> <Esc><C-v> " allow block selection in insert mode

" noremap K i<CR><Esc> " Split line

"  " Stupid shift key fixes
cmap WQ wq
cmap Wq wq

imap jk <Esc>
vmap <CR> <Esc>


" IDE like curly braces
inoremap {<cr> {<cr>}<c-o>O
" inoremap [<cr> [<cr>]<c-o>O
" inoremap (<cr> (<cr>)<c-o>O)

autocmd FileType scheme setlocal shiftwidth=2 softtabstop=2
autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2
autocmd FileType tex setlocal shiftwidth=2 softtabstop=2
autocmd FileType sml setlocal shiftwidth=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 softtabstop=2
autocmd FileType erb setlocal shiftwidth=2 softtabstop=2
autocmd FileType vim setlocal shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2
let g:syntastic_scala_checkers = ['']
let g:syntastc_disabled_filetypes=['java']

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
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_exec = '/usr/bin/env python'

set omnifunc=syntaxcomplete#Complete

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
