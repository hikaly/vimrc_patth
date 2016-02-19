
syntax on
set nocompatible

filetype off

" Bundles settings
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'tomtom/tcomment_vim'
Plugin 'Raimondi/delimitMate'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'uarun/vim-protobuf'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/ctags.vim'
"Plugin 'Valloric/YouCompleteMe'
" colorscheme
Plugin 'flazz/vim-colorschemes'
Plugin 'tomasr/molokai'

call vundle#end()


set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set ignorecase
set showmatch
set matchtime=2
set hlsearch
set incsearch

set ruler
set number
set numberwidth=5
set nocursorline
set backspace=indent,eol,start
set history=100
set nofoldenable
set ttyfast
set pastetoggle=<F2>
set laststatus=2
set completeopt+=longest
set clipboard=unnamedplus

set encoding=utf-8
set fileencoding=utf-8

" Custom Key bindings

vnoremap > >gv
vnoremap < <gv
vnoremap <C-c> "+y

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

inoremap <C-e> <End>
inoremap <C-a> <Home>

noremap <F1> <Esc>
nnoremap <F3> :set hlsearch!<CR>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" For :CtrlPBuffer
noremap <c-m> :CtrlPBuffer<CR>

set t_Co=256

colorscheme  jellybeans
" let g:molokai_original = 1

let g:airline_powerline_fonts=1

let NERDTreeIgnore=['\.pyc$', '\.beam$', '\.o$', '\.so$', '\.a$', '\.bak$', '\.swp$', '\.log$']

let g:acp_enableAtStartup=0
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_start_case=1
let g:neocomplete#enable_auto_select=0
let g:neocomplete#sources#syntax#min_keyword_length=2
let g:neocomplete#sources#dictionary#dictionaries = {
	\ 'erlang': $HOME.'/.vimdictionary'
	\ }

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

let g:ctrlp_working_path_mode='cra'
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_max_depth=10
let g:ctrlp_lazy_update=1
let g:ctrlp_mruf_max=50
let g:ctrlp_mruf_include='\.py$\|\.c$\|\.cpp$\|\.h$\|\.erl$'
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/]\.(git|hg|svn|env)$',
	\ 'file': '\v\.(bak|swp|so|pyc|o|beam|dump|gz|bz2|tar)$',
	\}

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*)"

autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

autocmd FileType c setlocal completeopt-=preview
autocmd FileType cpp setlocal completeopt-=preview
autocmd FileType python setlocal completeopt-=preview
autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType eruby set tabstop=2 shiftwidth=2 softtabstop=2

if has("gui_running")
	" set guifont=Ubuntu\ Mono\ derivative\ Powerline\ Regular\ 14
    set guifont=Fira\ Mono\ 11
    set cursorline
    set colorcolumn=0

    " No menu or toolbar
    set guioptions-=m
    set guioptions-=T
    " No scrollbars
    set guioptions-=L
    set guioptions-=l
    set guioptions-=R
    set guioptions-=r
    set guioptions-=b

    set guioptions+=a
    set mousemodel=popup

    " paste via Crtl+Shift+V
    " nnoremap <silent> <c-s-v> "+gP
    " inoremap <silent> <c-s-v> <Esc><Right>"+gPi
endif


" Automatic remove trailing whitespaces
autocmd FileType c,cpp,java,php,ruby,python,erlang,go,rust,sql,sh,html,css,vim autocmd BufWritePre <buffer> :%s/\s\+$//e

" Automatic Insert/Update Header When File Create/Write
function! s:SetPythonFileHeader()
	call setline(1, "\# -*- coding: utf-8 -*-")
	call setline(2, "")
	call setline(3, "\"\"\"")
	call setline(4, "Author:        hikari")
	call setline(5, "Filename:      ".expand("%:t"))
	call setline(6, "Date created:  ".strftime("%Y-%m-%d %H:%M:%S"))
	call setline(7, "Description:   ")
	call setline(8, "")
	call setline(9, "\"\"\"")
	call setline(10, "")
	call setline(11, "")
	call cursor(11, 1)
endfunc


autocmd BufNewFile *.py call <SID>SetPythonFileHeader()

function! s:SetCHeaderFileHeader()
	let filename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
	let headername = "__" . filename . "__"
	call setline(1, "\#ifndef " . headername)
	call setline(2, "\#define " . headername)
	call setline(3, "")
	call setline(4, "")
	call setline(5, "")
	call setline(6, "\#endif // " . headername)
	call cursor(4, 1)
endfunc

autocmd BufNewFile *.{h,hpp} call <SID>SetCHeaderFileHeader()

function! s:SetErlangFileHeader()
	let modulename = substitute(expand("%:t"), "\\.erl", "", "")
	call setline(1, "%%% @author: hikari")
	call setline(2, "%%% @doc")
	call setline(3, "%%%")
	call setline(4, "%%% @end")
	call setline(5, "%%% Date created: ".strftime("%Y-%m-%d %H:%M:%S"))
	call setline(6, "")
	call setline(7, "")
	call setline(8, "-module(" . modulename . ")")
	call setline(9, "")
	call setline(10, "")
	call cursor(10, 1)
endfunc

autocmd BufNewFile *.erl call <SID>SetErlangFileHeader()

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Highlight current line
au winLeave * set nocursorline nocursorcolumn
au winEnter * set cursorline cursorcolumn
set cursorline cursorcolumn
hi CursorLine cterm=NONE ctermbg=black ctermfg=NONE guibg=NONE guifg=NONE
hi CursorColumn cterm=NONE ctermbg=black ctermfg=gray guibg=NONE guifg=NONE


filetype on
" filetype indent on
filetype plugin on
filetype plugin indent on

