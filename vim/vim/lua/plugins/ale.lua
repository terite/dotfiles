return {
  {
    "dense-analysis/ale",
    enabled = false,
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
  }
}
