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

require('lazy').setup(
  {
    { import = "plugins" },

    -- fzf https://github.com/junegunn/fzf
    -- maybe at set rtp+=/usr/local/opt/fzf
    {
      dir = "~/.fzf",
      enabled = false,
      build = function()
        vim.cmd[[call fzf#install()]]
      end,
      config = function()
        vim.keymap.set("n", "<c-p>", ":FZF<cr>")
      end
    },
  }, {
    change_detection = {
      enabled = false,
    },
  }
)

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
