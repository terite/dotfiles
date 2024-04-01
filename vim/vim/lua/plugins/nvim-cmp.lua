return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      -- "hrsh7th/cmp-buffer",
      -- "hrsh7th/cmp-path",
      -- "hrsh7th/cmp-cmdline",

      -- For luasnip users.
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require'cmp'
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
        }, {
          { name = 'buffer' },
        })
      })
    end
  },

  -- {
  --   "zbirenbaum/copilot.lua",
  --   lazy = false,
  --   config = function()
  --     require('copilot').setup({})
  --   end
  -- },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   dependencies = {
  --     "zbirenbaum/copilot.lua",
  --     "rsh7th/nvim-cmp",
  --   },
  --   config = function ()
  --     require("copilot_cmp").setup()
  --   end
  -- }
}
