return {
  -- "flazz/vim-colorschemes",
  {
    "folke/tokyonight.nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    opts = {
    },
    config = function()
      vim.cmd("colorscheme tokyonight-moon")
    end
  },
  {
    "catppuccin/nvim",
    -- name = "catppuccin",
    priority = 1000 ,
    enabled = true,
    lazy = false,
    config = function()
      vim.cmd("colorscheme catppuccin")
    end
  }, {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    enabled = false,
    config = function()
      vim.cmd("colorscheme poimandres")
    end
  }
}
