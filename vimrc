
syntax on               " 语法高亮    
set nocompatible        " 不要vim模仿vi模式
set noswapfile          " 不生成swap文件

filetype off

" Bundles settings, vuble 
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
Plugin 'Yggdroot/indentLine'
"Plugin 'Valloric/YouCompleteMe'
" colorscheme
Plugin 'flazz/vim-colorschemes'
Plugin 'tomasr/molokai'

call vundle#end()

set ts=4
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
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

colorscheme molokai " jellybeans
" let g:molokai_original = 1

let g:indentLine_color_term = 239

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

