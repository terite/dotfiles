return {
  {
    "hrsh7th/nvim-cmp",
    -- event = "InsertEnter",
    lazy = false,
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      -- "hrsh7th/cmp-path",
      -- "hrsh7th/cmp-cmdline",
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp"
      },
      { "rafamadriz/friendly-snippets" },
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()

      local cmp = require'cmp'
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        snippet = {
          expand = function(args)
            require'luasnip'.lsp_expand(args.body)
          end
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
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

  -- Run :Copilot setup on new devices to get this working
  {
    "github/copilot.vim",
    event = "InsertEnter",
    lazy = false,
  }
}
