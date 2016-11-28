set nocompatible
filetype off
set shell=/bin/bash
set rtp+=~/.config/nvim/bundle/Vundle.vim/
call vundle#begin('$HOME/.config/nvim/bundle')

Plugin 'VundleVim/Vundle.vim'

" support for editing .fish scripts
Plugin 'dag/vim-fish'

" Read .editorconfig files and apply settings to vim
Plugin 'editorconfig/editorconfig-vim'

" provides molokai
Plugin 'flazz/vim-colorschemes'

" Tabularize, for aligning = and such
Plugin 'godlygeek/tabular'

" highlights the matching HTML tag when the cursor is positioned on a tag.
Plugin 'gregsexton/MatchTag'

" syntax highlighting, indenting and autocompletion for .less stylesheets
Plugin 'groenewege/vim-less'

" when searching prints 'At match #N out of M matches'.
Plugin 'henrik/vim-indexed-search'

" relative line numbers in normal mode, absolute in insert mode
Plugin 'jeffkreeftmeijer/vim-numbertoggle'

" support for editing .coffee files
Plugin 'kchmck/vim-coffee-script'

" shows syntax/style errors for files while editing
Plugin 'scrooloose/syntastic'

" file browser sidebar
Plugin 'scrooloose/nerdtree'

" provides a motion for commenting out lines of code
Plugin 'tpope/vim-commentary'

" Unix helpers like :Remove, :Mkdir, and :SudoWrite
Plugin 'tpope/vim-eunuch'

" git helpers like :Gmerge and :Gblame
Plugin 'tpope/vim-fugitive'

" syntax, indent, and filetype plugin files for git file formats
Plugin 'tpope/vim-git'

" helpers to change delimiters around text
Plugin 'tpope/vim-surround'

" helpers like ]q for :cnext and [q for :cprevious
Plugin 'tpope/vim-unimpaired'

" TODO: remove if I don't need this
" Plugin 'vitaly/vim-gitignore'
" Plugin 'ciaranm/detectindent'

" TODO: reenable later if I can get it to work
Plugin '5long/pytest-vim-compiler'
Plugin 'mindriot101/vim-pytest-runner'
Plugin 'tpope/vim-dispatch'

" TODO: reenable later
" Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'
"
Plugin 'davidhalter/jedi-vim'

" replaces ag.vim, provides support for :Ack term
Plugin 'mileszs/ack.vim'

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

" vim-dispatch and related test-running configuration
nnoremap <leader>t :Make %<cr>
let g:pytest_command = "Dispatch py.test -n0 {test}"
nnoremap <Leader>k :call RunNearestTest()<CR>

" Syntastic
let g:syntastic_python_checkers = ['flake8']

noremap <C-k>b :NERDTreeToggle<cr>

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" use ack.vim like ag.vim
let g:ackprg = 'ag --hidden --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack
