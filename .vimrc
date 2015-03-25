" Version: 1.24
if &term =~ "xterm" || &term =~ "screen"
 set t_Co=256
 if has("terminfo")
   let &t_Sf=nr2char(27).'[3%p1%dm'
   let &t_Sb=nr2char(27).'[4%p1%dm'
 else
   let &t_Sf=nr2char(27).'[3%dm'
   let &t_Sb=nr2char(27).'[4%dm'
 endif
endif

" call pathogen#infect()

let g:molokai_original = 1
:colorscheme molokai

" set background=dark
" colorscheme solarized

" Requires vim 7.3
" set undodir=~/.vim/undodir
" set undofile
" set undolevels=1000
" set undoreload=10000
set spell
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set bs=2
set ignorecase
set smartcase
set gdefault
set autoindent
set autowrite
set hlsearch
set incsearch
set showmatch
set vb t_vb=
set cursorline
syntax on
setlocal spell spelllang=en
set encoding=utf-8

"Show line numbers
set number
set modeline
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
let mapleader = ","
nnoremap <leader><space> :noh<cr>
nnoremap <leader>t :tabnew<cr>:e<space>
nnoremap <leader>pp :set paste<cr>
nnoremap <leader>np :set nopaste<cr>
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap <up> gk
nnoremap <down> gj

filetype plugin on 
set ofu=syntaxcomplete#Complete

" Tab autocompletes
function! Mosh_Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
endfunction

vmap C :s/^/\/\/<cr>gv:s/^\/\/\/\/<cr>gv:s/^<cr>:noh<cr>

:inoremap <Tab> <C-R>=Mosh_Tab_Or_Complete()<CR>

" Ctrl + T opens new tab
:nmap <C-S-tab> :tabprevious<cr>
:nmap <C-tab> :tabnext<cr>
:nmap <C-t> :tabnew<cr>
:map <C-t> :tabnew<cr>:e<space> 
:map <C-S-tab> :tabprevious<cr>
:map <C-tab> :tabnext<cr>
:imap <C-S-tab> <ESC>:tabprevious<cr>i
:imap <C-tab> <ESC>:tabnext<cr>i
:imap <C-t> <ESC>:tabnew<cr>


command! W :w
command! Q :q

map <F1> <Esc>
imap <F1> <Esc>
imap <C-c> <Esc>

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

cmap w!! w !sudo tee % >/dev/null

set mouse=v
set nohidden

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Restore cursor position to where it was before
augroup JumpCursorOnEdit
   au!
   autocmd BufReadPost *
            \ if expand("<afile>:p:h") !=? $TEMP |
            \   if line("'\"") > 1 && line("'\"") <= line("$") |
            \     let JumpCursorOnEdit_foo = line("'\"") |
            \     let b:doopenfold = 1 |
            \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
            \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
            \        let b:doopenfold = 2 |
            \     endif |
            \     exe JumpCursorOnEdit_foo |
            \   endif |
            \ endif
   " Need to postpone using "zv" until after reading the modelines.
   autocmd BufWinEnter *
            \ if exists("b:doopenfold") |
            \   exe "normal zv" |
            \   if(b:doopenfold > 1) |
            \       exe  "+".1 |
            \   endif |
            \   unlet b:doopenfold |
            \ endif
augroup END

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

set pastetoggle=<F2>

" Show file title in terminal tab
set title

" Show current line and column position in file
set ruler


" Show a blue vertical line on the 80th character (pep8 compliant)
if exists('+colorcolumn')
  set colorcolumn=80
  highlight ColorColumn ctermbg=33
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif


" Set tabspace=2 for javascript files
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

