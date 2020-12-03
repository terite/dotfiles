set nocompatible
set nomodeline

filetype off
set shell=/bin/bash

" let g:python_host_prog = expand('~/local/venv2.7-vim/bin/python')
let g:python3_host_prog = expand('~/local/venv3.6-vim/bin/python')

set rtp+=~/.config/nvim/bundle/Vundle.vim/
call vundle#begin('$HOME/.config/nvim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" various language support
Plugin 'pangloss/vim-javascript'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'keith/swift.vim'
Plugin 'martinda/Jenkinsfile-vim-syntax'
Plugin 'posva/vim-vue'
Plugin 'dag/vim-fish'
Plugin 'groenewege/vim-less'
Plugin 'ElmCast/elm-vim'

" Like syntastic but faster?
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\    'typescript': ['prettier', 'eslint'],
\    'typescriptreact': ['prettier', 'eslint'],
\    'css': ['prettier'],
\}
nmap <leader>g :ALEGoToDefinition<CR>
nmap <leader>t :ALEGoToTypeDefinition<CR>
nmap <leader>h :ALEHover<CR>
nmap <leader>r :ALEFindReferences<CR>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" https://github.com/dense-analysis/ale/issues/1700
set completeopt+=noinsert
Plugin 'w0rp/ale.git'

" Read .editorconfig files and apply settings to vim
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
" let g:EditorConfig_verbose = 1
Plugin 'editorconfig/editorconfig-vim'

" Allow using :BD to delete a buffer but keep the window open
Plugin 'qpkorr/vim-bufkill'

" Provides tons of color schemes
Plugin 'flazz/vim-colorschemes'

" highlights the matching HTML tag when the cursor is positioned on a tag.
Plugin 'gregsexton/MatchTag'

" when searching prints 'At match #N out of M matches'.
Plugin 'henrik/vim-indexed-search'

" relative line numbers in normal mode, absolute in insert mode
Plugin 'jeffkreeftmeijer/vim-numbertoggle'

" Plugin 'strager/quick-lint-js', {'rtp': 'plugin/vim/quick-lint-js.vim'}

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

" let g:jedi#goto_command = ""
" let g:jedi#goto_assignments_command = ""
" let g:jedi#goto_definitions_command = ""
" let g:jedi#documentation_command = ""
" let g:jedi#usages_command = ""
" let g:jedi#completions_command = ""
" let g:jedi#rename_command = ""
"Plugin 'davidhalter/jedi-vim'

" replaces ag.vim, provides support for :Ack term
let g:ackprg = 'ag --hidden --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack
Plugin 'mileszs/ack.vim'

" use <Tab> for completion
" Plugin 'ervandew/supertab'

call vundle#end()
filetype plugin indent on

" fzf https://github.com/junegunn/fzf
set rtp+=/usr/local/opt/fzf
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
set softtabstop=2
set shiftwidth=2
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

" set colorcolumn=101

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

" Use tab to navigate splits.
nnoremap <tab> <C-w><C-w>
nnoremap <s-tab> <C-w><left>

map <unique> <F1> <ESC>:make<CR>
" set makeprg=make\ -j4\ -w

nmap <unique> <Leader>s vip:sort u<CR>
vmap <unique> <Leader>s :sort u<CR>
nmap <unique> <Leader>S vip:sort iu<CR>
vmap <unique> <Leader>S :sort iu<CR>

" Color scheme
set background=dark
set termguicolors
colorscheme Tomorrow-Night-Eighties
" colorscheme solarized8_dark_high
" colorscheme brogrammer
" highlight ColorColumn ctermbg=8

" Show whitespace (default off for now, too distracting)
set listchars=eol:¬,tab:▸\ ,trail:~,extends:>,precedes:<,space:·
nmap <leader>l :set list!<CR>
set nolist

set wildignore+=*.o,*.obj,.git,node_modules,bower_components

" press f11 to fix syntax
noremap <F11> <C-o>:syntax sync fromstart<CR>
