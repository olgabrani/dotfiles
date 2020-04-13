set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'nelsyeung/twig.vim'
Plugin 'leafgarland/typescript-vim'

call vundle#end()

filetype plugin indent on

"Set colorscheme
let g:molokai_original = 1
:colorscheme molokai

"Automatically save undo history to an undo file
set undofile

"Set spell checking languages
set spell
set spelllang=en

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
"Ignore case when searching
set ignorecase
set smartcase
set autoindent
"Highlight all search matches
set hlsearch
set incsearch
set showmatch
set vb t_vb=
"Highlight the current line
set cursorline
syntax on
set encoding=utf-8

"Show line numbers
set number
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
let mapleader = ","
nnoremap <leader>l :bn<cr>
nnoremap <leader>t :CtrlP<cr>
nnoremap <leader>r :NERDTree<cr>


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


set mouse=v
set nohidden

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

set pastetoggle=<F2>
" Show file title in terminal tab
set title
" Show current line and column position in file
set ruler
"Faster Normal Mode
imap ii <Esc>
"Use <Space> to go half-page down
nnoremap <Space> <c-d>

" Set tabspace=2 for javascript files
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2


" When invoked, unless a starting directory is specified, CtrlP will set its
" 'a':  the directory of the current file but only applies when the current working directory outside of CtrlP
" isn't a direct ancestor of the directory of the current file
let g:ctrlp_working_path_mode = 'a'

" Vim jumps to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
