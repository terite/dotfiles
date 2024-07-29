return {
  -- Read .editorconfig files and apply settings to vim
  {
    "editorconfig/editorconfig-vim",
    config = function()
      vim.g.EditorConfig_exclude_patterns = { 'fugitive://.*' }
    end
  },

  -- using :BD to delete a buffer but keep the window open
  -- "qpkorr/vim-bufkill",

  -- highlights the matching HTML tag when the cursor is positioned on a tag.
  "gregsexton/MatchTag",

  -- when searching prints 'At match #N out of M matches'.
  "henrik/vim-indexed-search",

  -- relative line numbers in normal mode, absolute in insert mode
  "jeffkreeftmeijer/vim-numbertoggle",

  -- provides a motion for commenting out lines of code
  "tpope/vim-commentary",

  -- Unix helpers like :Remove, :Mkdir, and :SudoWrite
  "tpope/vim-eunuch",

  -- git helpers like :Gmerge and :Gblame
  'tpope/vim-fugitive',

  -- syntax, indent, and filetype plugin files for git file formats
  {
    'tpope/vim-git',
    enabled = false,
  },

  -- helpers to change delimiters around text
  'tpope/vim-surround',

  -- helpers like ]q for :cnext and [q for :cprevious
  'tpope/vim-unimpaired',

  -- It's a frog
  {
    'tamton-aquib/duck.nvim',
    config = function()
      vim.keymap.set('n', '<leader>dd', function() require("duck").hatch("🐸", 2) end, {})
      vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
      vim.keymap.set('n', '<leader>da', function() require("duck").cook_all() end, {})
    end,
  },

  "AndrewRadev/linediff.vim",
}
