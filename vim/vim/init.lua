--[[

Cheatsheet:
https://neovim.io/doc/user/lua-guide.html#lua-guide-vimscript

Options:
Before: set smarttab
After:  vim.opt.smarttab = true

Variables:
Before: let g:ale_completion_enabled = 1
After:  vim.g.ale_completion_enabled = 1

]]

--
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
      vim.g.ale_completion_enabled = 1
      vim.g.ale_fix_on_save = 1

      vim.g.ale_fixers = {
        javascript = { "eslint", "prettier" },
        typescript = { "eslint", "prettier" },
        typescriptreact = { "eslint", "prettier" },
        css = { "prettier" },
      }

      vim.keymap.set("n", "<leader>g", ":ALEGoToDefinition<CR>")
      vim.keymap.set("n", "<leader>t", ":ALEGoToTypeDefinition<CR>")
      vim.keymap.set("n", "<leader>h", ":ALEHover<CR>")
      vim.keymap.set("n", "<leader>r", ":ALEFindReferences<CR>")

      vim.keymap.set("n", "<C-k>", "<Plug>(ale_previous_wrap)", { silent = true })
      vim.keymap.set("n", "<C-j>", "<Plug>(ale_next_wrap)", { silent = true })

      -- https://github.com/dense-analysis/ale/issues/1700
      vim.opt.completeopt = vim.opt.completeopt + 'noinsert'

      -- maybe later
      -- vim.opt.omnifunc="ale#completion#OmniFunc"
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
    opts = {
    },
    config = function()
      vim.cmd("colorscheme tokyonight-moon")
    end
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      vim.cmd("TSUpdate")
    end,
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          "c", "lua", "vim", "vimdoc", "query",
          "typescript", "python", "javascript"
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        highlight = {
          enable = true,

          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true
        }
      })

      vim.opt.foldmethod = 'expr'
      vim.opt.foldexpr="nvim_treesitter#foldexpr()"
      vim.opt.foldenable = false
      vim.opt.foldlevel = 99
    end
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
  -- "github/copilot.vim",

  -- It's a frog
  {
    'tamton-aquib/duck.nvim',
    config = function()
      vim.keymap.set('n', '<leader>dd', function() require("duck").hatch("🐸", 2) end, {})
      vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
      vim.keymap.set('n', '<leader>da', function() require("duck").cook_all() end, {})
    end,
  },

  -- fzf https://github.com/junegunn/fzf
  -- maybe at set rtp+=/usr/local/opt/fzf
  {
    dir = "~/.fzf",
    build = function()
      vim.cmd[[call fzf#install()]]
    end,
    config = function()
      vim.keymap.set("n", "<c-p>", ":FZF<cr>")
    end
  },
})

-- No swap files
vim.opt.swapfile = false
vim.opt.backup = false

-- reload when files are changed outside of vim
vim.opt.autoread = true

vim.opt.showcmd = true
vim.opt.backspace = "indent,eol,start"

-- Bash style completion.
vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest"

-- Use tab to navigate splits.
vim.keymap.set("n", "<tab>", "<C-w><C-w>")
vim.keymap.set("n", "<s-tab>", "<C-w><left>")

vim.opt.termguicolors = true

-- Show whitespace (default off for now, too distracting)
-- set listchars=eol:¬,tab:▸\ ,trail:~,extends:>,precedes:<,space:·
vim.opt.listchars = { eol = "¬", tab = "▸ ", trail = "~", extends = ">", precedes = "<", space = "·" }
vim.opt.list = false
vim.keymap.set("n", "<leader>l", ":set list!<CR>")

vim.cmd([[

" Give up and admit that I hold shift for too long
cab Wq wq
cab W w
cab WQ wq
cab Q q
cab Vs vs
cab VS vs
cab Qa qa
cab QA qa
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

vim.api.nvim_create_user_command('Test', 'echo "It works!"', {})
