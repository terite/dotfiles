set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim/
set shell=/bin/bash

call vundle#begin('$HOME/.config/nvim/bundle')

Plugin 'gmarik/Vundle.vim'

Plugin '5long/pytest-vim-compiler'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ciaranm/detectindent'
Plugin 'dag/vim-fish'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'godlygeek/tabular'
Plugin 'gregsexton/MatchTag'
Plugin 'groenewege/vim-less'
" Plugin 'henrik/vim-indexed-search'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mindriot101/vim-pytest-runner'

" Plugin 'klen/python-mode'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vitaly/vim-gitignore'

Plugin 'mgedmin/pythonhelper.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'davidhalter/jedi-vim'

call vundle#end()
filetype plugin indent on

" fzf https://github.com/junegunn/fzf
set rtp+=~/.fzf
noremap <c-p> :FZF<cr>

set number
set ruler

syntax enable

" Searching
set ignorecase smartcase
set incsearch
set hlsearch
nnoremap <ESC><ESC> :nohlsearch<cr>

" No swap files
set noswapfile
set nobackup
set autoread "reload files changed outside of vim

" Indentation
set smarttab
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab

set showcmd
set backspace=indent,eol,start

" Bash style completion.
set wildmode=list:longest
set wildmenu

" Indentation
set foldmethod=indent
" set nofoldenable
set foldlevelstart=20

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Give up and admit that I hold shift for too long
cab Wq wq
cab W w
cab WQ wq
cab Q q
cab Vs vs
cab VS vs
cab Qa qa
cab QA qa

noremap <space>= :Tabularize /^[^=]*\zs=<cr>
noremap <space>, :Tabularize /^[^,]*\zs,<cr>
set colorcolumn=101

" Copy visual selection with :cz
command -range Cz :silent :<line1>,<line2>w !xsel -i -b
command -range Cx :silent :<line1>,<line2>w !xsel -i -p
command -range Cv :silent :<line1>,<line2>w !xsel -i -s
cabbrev cv Cv
cabbrev cz Cz
cabbrev cx Cx

" Paste to visual selection with :pz
command -range Pz :silent :r !xsel -o -b
command -range Px :silent :r !xsel -o -p
command -range Pv :silent :r !xsel -o -s
cabbrev pz Pz
cabbrev px Px
cabbrev pv Pv

" use \p to toggle paste node
set pastetoggle=<leader>p

" Use tab to navigate splits.
nnoremap <tab> <C-w><C-w>
nnoremap <s-tab> <C-w><left>

" Color scheme
set background=dark
colorscheme molokai
highlight ColorColumn ctermbg=8

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" Show whitespace (default off for now, too distracting)
set listchars=eol:¬,tab:▸\ ,trail:~,extends:>,precedes:<
nmap <leader>l :set list!<CR>
set nolist

set wildignore+=*.o,*.obj,.git,node_modules,bower_components

" vim-dispatch
nnoremap <leader>t :Make %<cr>

" python-mode
let g:pymode_lint = 0
let g:pymode_rope = 0
let g:pymode_indent = 0
let g:pymode_options_max_line_length = 100

" Syntastic
let g:syntastic_python_checkers = ['flake8']

noremap <C-k>b :NERDTreeToggle<cr>

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
