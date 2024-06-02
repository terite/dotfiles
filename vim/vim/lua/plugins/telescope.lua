return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', build="make" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        pickers = {
          live_grep = {
            file_ignore_patterns = { 'node_modules', '.git', '.venv' },
            additional_args = function(_)
              return { "--hidden" }
            end
          },
          find_files = {
            file_ignore_patterns = { 'node_modules', '.git', '.venv' },
            hidden = true
          }

        },
        extensions = {
          "fzf"
        },
      })
      telescope.load_extension("fzf")

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

      vim.keymap.set("n", "<c-p>", builtin.find_files, {})
    end
  }
}
