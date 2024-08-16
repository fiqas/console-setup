" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')
execute pathogen#infect()


" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

map <F2> :NERDTreeToggle<CR>
" let g:NERDTreeMapOpenSplit="<F3>"


Plug 'scrooloose/nerdcommenter'

Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

Plug 'Valloric/YouCompleteMe'

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'https://github.com/vim-scripts/a.vim.git'

Plug 'tmux-plugins/vim-tmux-focus-events'

Plug 'roxma/vim-tmux-clipboard'
let g:vim_tmux_clipboard#loadb_option = '-w'

" Colorscheme
syntax enable
colorscheme monokai

" Airline

Plug 'bling/vim-airline'

Plug 'rhysd/vim-clang-format'


" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()

    
    
" Nerdcommenter

let NERDSpaceDelims=1

nmap <Leader>c :call NERDComment(0, 'invert')<CR>
vmap <Leader>c :call NERDComment(1, 'invert')<CR>

set number
set laststatus=2
set showtabline=2
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files

set completeopt-=preview

let maplocalleader = "\\"
let mapleader = ','

noremap j gj
noremap k gk
noremap gj j
noremap gk k
noremap <Down> gj
noremap <Up> gk

noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l

imap jj <Esc>

vnoremap < <gv
vnoremap > >gv

inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

" let g:syntastic_python_checkers = ['flake8']
" let g:syntastic_python_flake8_args='--ignore=E501,E225'
" let g:syntastic_python_pep8_args='--ignore=E501 --fix'
" let g:pep8_ignore="E501,W601"

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_w = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting=0

let g:EclimFileTypeValidate = 0

augroup python
	au!
	au BufRead,BufNewFile *.py,*.pyw set tabstop=4
	au BufRead,BufNewFile *.py,*.pyw set shiftwidth=4
	au BufRead,BufNewFile *.py,*.pyw set expandtab
	au BufRead,BufNewFile *.py,*.pyw set softtabstop=4  "Insert 4 spaces when tab is pressed
	au BufRead,BufNewFile *.py,*.pyw set smarttab       "Indent instead of tab at start of line
	au BufRead,BufNewFile *.py,*.pyw set shiftround     "Round spaces to nearest shiftwidth multiple
	au BufRead,BufNewFile *.py,*.pyw set colorcolumn=80 "Color last legal column

augroup end

augroup c++
	au!
	au BufRead,BufNewFile *.cpp,*.hpp set tabstop=2
	au BufRead,BufNewFile *.cpp,*.hpp set shiftwidth=2
	au BufRead,BufNewFile *.cpp,*.hpp set expandtab
	au BufRead,BufNewFile *.cpp,*.hpp set softtabstop=2  "Insert 4 spaces when tab is pressed
	au BufRead,BufNewFile *.cpp,*.hpp set smarttab       "Indent instead of tab at start of line
	au BufRead,BufNewFile *.cpp,*.hpp set shiftround     "Round spaces to nearest shiftwidth multiple
	au BufRead,BufNewFile *.cpp,*.hpp set colorcolumn=80 "Color last legal column

augroup end

augroup c
	au!
	au BufRead,BufNewFile *.c,*.h set tabstop=2
	au BufRead,BufNewFile *.c,*.h set shiftwidth=2
	au BufRead,BufNewFile *.c,*.h set expandtab
	au BufRead,BufNewFile *.c,*.h set softtabstop=2  "Insert 4 spaces when tab is pressed
	au BufRead,BufNewFile *.c,*.h set smarttab       "Indent instead of tab at start of line
	au BufRead,BufNewFile *.c,*.h set shiftround     "Round spaces to nearest shiftwidth multiple
	au BufRead,BufNewFile *.c,*.h set colorcolumn=80 "Color last legal column

augroup end

let g:clang_format#style_options = {
	    \ "AccessModifierOffset" : -4,
	    \ "AllowShortIfStatementsOnASingleLine" : "true",
	    \ "AlwaysBreakTemplateDeclarations" : "true",
	    \ "Standard" : "C++11"}
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR> 
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" " if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" " Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

autocmd FileType c ClangFormatAutoEnable

set clipboard=unnamed

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
set mouse=a
