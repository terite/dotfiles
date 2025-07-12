local globalkeys = function()
  -- from ale
  vim.keymap.set("n", "<C-k>", vim.diagnostic.goto_prev, { silent = true })
  vim.keymap.set("n", "<C-j>", vim.diagnostic.goto_next, { silent = true })

  -- Global mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
end

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)

    vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
  end,
})

return {
  {
    "neovim/nvim-lspconfig",
    -- enabled = false,
    config = function()
      local lspconfig = require('lspconfig')

      if vim.fn.executable('pyright') == 1 then
        lspconfig.pyright.setup {}
      end

      -- https://quick-lint-js.com/install/
      if vim.fn.executable('quick-lint-js') == 1 then
        lspconfig.quick_lint_js.setup({})
      end

      -- npm install -g @vtsls/language-server
      if vim.fn.executable('vtsls') == 1 then
        lspconfig.vtsls.setup({})
      end

      -- npm i -g vscode-langservers-extracted
      if vim.fn.executable('vscode-html-language-server') == 1 then
        lspconfig.html.setup({})
      end
      if vim.fn.executable('vscode-css-language-server') == 1 then
        lspconfig.cssls.setup{}
      end
      if vim.fn.executable('vscode-json-language-server') == 1 then
        lspconfig.jsonls.setup({})
      end
      if vim.fn.executable('vscode-eslint-language-server') == 1 then
        lspconfig.eslint.setup({})
      end

      -- pipx install python-lsp-server
      -- pipx install python-lsp-black
      if vim.fn.executable('pylsp') == 1 then
        lspconfig.pylsp.setup({
          plugins = {
            flake8 = {
              enabled = true,
            },
          },
        })
      end

      -- https://luals.github.io/#neovim-install
      -- config from https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
      if vim.fn.executable('lua-language-server') == 1 then
        lspconfig.lua_ls.setup{
          on_init = function(client)
            local path = client.workspace_folders[1].name
            if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
              return
            end

            client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
              runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
              },
              -- Make the server aware of Neovim runtime files
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME
                  -- Depending on the usage, you might want to add additional paths here.
                  -- "${3rd}/luv/library"
                  -- "${3rd}/busted/library",
                }
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                -- library = vim.api.nvim_get_runtime_file("", true)
              }
            })
          end,
          settings = {
            Lua = {}
          }
        }
      end
      globalkeys()
    end
  }
}
