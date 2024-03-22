-- Do not allow files to override vim settings
vim.opt.modeline = false

-- Some plugins do not play nicely with fish / other shells
vim.opt.shell = "/bin/bash"

vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Like syntastic but faster?
  {
    "dense-analysis/ale",
    config = function() 
      vim.cmd([[
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
      ]])
    end
  },

  -- Read .editorconfig files and apply settings to vim
  {
    "editorconfig/editorconfig-vim",
    config = function()
      vim.g.EditorConfig_exclude_patterns = { 'fugitive://.*' }
    end
  },

  -- "flazz/vim-colorschemes",

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      vim.cmd("TSUpdate")
    end,
  },

  -- using :BD to delete a buffer but keep the window open
  "qpkorr/vim-bufkill",

  -- Provides tons of color schemes
  -- "flazz/vim-colorschemes",

  -- highlights the matching HTML tag when the cursor is positioned on a tag.
  "gregsexton/MatchTag",

  -- when searching prints 'At match #N out of M matches'.
  "henrik/vim-indexed-search",

  -- relative line numbers in normal mode, absolute in insert mode
  "jeffkreeftmeijer/vim-numbertoggle",

  -- "strager/quick-lint-js", {'rtp': 'plugin/vim/quick-lint-js.vim'}

  -- provides a motion for commenting out lines of code
  "tpope/vim-commentary",

  -- Unix helpers like :Remove, :Mkdir, and :SudoWrite
  "tpope/vim-eunuch",

  -- git helpers like :Gmerge and :Gblame
  'tpope/vim-fugitive',

  -- syntax, indent, and filetype plugin files for git file formats
  'tpope/vim-git',

  -- helpers to change delimiters around text
  'tpope/vim-surround',

  -- helpers like ]q for :cnext and [q for :cprevious
  'tpope/vim-unimpaired',

  -- Run :Copilot setup on new devices to get this working
  "github/copilot.vim",

  -- It's a frog
  {
    'tamton-aquib/duck.nvim',
    config = function()
      vim.keymap.set('n', '<leader>dd', function() require("duck").hatch("🐸", 3) end, {})
      vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
      vim.keymap.set('n', '<leader>da', function() require("duck").cook_all() end, {})
    end,
  },

  -- replaces ag.vim, provides support for :Ack term
  {
    "mileszs/ack.vim",
    config = function()
      vim.cmd([[
        let g:ackprg = 'rg --hidden --vimgrep --smart-case'
        cnoreabbrev ag Ack
        cnoreabbrev aG Ack
        cnoreabbrev Ag Ack
        cnoreabbrev AG Ack
        cnoreabbrev rg Ack
      ]])
    end
  },

  -- fzf https://github.com/junegunn/fzf
  -- maybe at set rtp+=/usr/local/opt/fzf
  {
    dir = "~/.fzf",
    build = function()
      vim.cmd[[call fzf#install()]]
    end,
    config = function()
      vim.cmd([[
        noremap <c-p> :FZF<cr>
      ]])
    end
  },
})

vim.cmd([[

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
" set background=dark
set termguicolors
colorscheme tokyonight-night
" colorscheme luna
" colorscheme Tomorrow-Night-Eighties
" colorscheme solarized8_dark_high
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

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
