
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

vim.keymap.set('n', '<ESC><ESC>', ':nohlsearch<cr>')

if vim.fn.executable('rg') == 1 then
  vim.opt.grepprg='rg --vimgrep --hidden --smart-case --'
end

vim.api.nvim_create_user_command('Ack', function(opts)
  local term = opts.args[1]
  if term == nil or term == "" then
    term = vim.fn.expand("<cword>")
  end

  vim.cmd('silent grep! ' .. term)
  vim.cmd.copen()
end, { nargs = '?' })


vim.cmd([[
  cnoreabbrev ag Ack
  cnoreabbrev aG Ack
  cnoreabbrev Ag Ack
  cnoreabbrev AG Ack
  cnoreabbrev rg Ack
]])
