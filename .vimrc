"call pathogen#infect()

"tab settings
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set backspace=indent,eol,start

"colorscheme koehler

"highlight searching
set hlsearch

"line numbering
set nu
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set numberwidth=3

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
vnoremap <C-a> :call Incr()<CR>`'")'")

"map <C-n> :NERDTree<Enter>

" Standard CtrlP also in insert mode
imap <C-p> <ESC>:CtrlP<CR>

" Shortcuts
imap <C-w> <Esc><C-w> " move through windows in insert mode
imap <C-v> <Esc><C-v> " allow block selection in insert mode
