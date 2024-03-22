-- Do not allow files to override vim settings
vim.opt.modeline = false

-- Some plugins do not play nicely with fish / other shells
vim.opt.shell = "/bin/bash"

vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

vim.cmd([[
" required by vundle
filetype off

" fzf https://github.com/junegunn/fzf
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf
noremap <c-p> :FZF<cr>

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('$HOME/.config/nvim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'w0rp/ale.git'

Plugin 'editorconfig/editorconfig-vim'

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
" Plugin 'w0rp/ale.git'

" Read .editorconfig files and apply settings to vim
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
" Plugin 'editorconfig/editorconfig-vim'

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

" Run :Copilot setup on new devices to get this working
Plugin 'github/copilot.vim'

" It's a duck
Plugin 'tamton-aquib/duck.nvim'
nnoremap <leader>dd :lua require("duck").hatch("🐸", 3)<CR>

" After install, run :TSUpdate
Plugin 'nvim-treesitter/nvim-treesitter'

" replaces ag.vim, provides support for :Ack term
let g:ackprg = 'rg --hidden --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack
cnoreabbrev rg Ack
Plugin 'mileszs/ack.vim'

call vundle#end()
filetype plugin indent on

" Searching
set ignorecase smartcase
set incsearch
set hlsearch
nnoremap <ESC><ESC> :nohlsearch<cr>

" No swap files
set noswapfile
set nobackup
set autoread "reload files changed outside of vim

set showcmd
set backspace=indent,eol,start

" Bash style completion.
set wildmode=list:longest
set wildmenu

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

" Use tab to navigate splits.
nnoremap <tab> <C-w><C-w>
nnoremap <s-tab> <C-w><left>

" Color scheme
set background=dark
set termguicolors
" colorscheme luna
" colorscheme Tomorrow-Night-Eighties
colorscheme solarized8_dark_high
" colorscheme brogrammer
" highlight ColorColumn ctermbg=8

" Show whitespace (default off for now, too distracting)
set listchars=eol:¬,tab:▸\ ,trail:~,extends:>,precedes:<,space:·
nmap <leader>l :set list!<CR>
set nolist
]])


-- show line numbers
vim.opt.number = true

-- Indentation
vim.opt.smarttab = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.tabstop = 4
vim.opt.expandtab = true
