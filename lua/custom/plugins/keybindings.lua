-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
require 'custom.plugins.plugs'

return {

  -- NOTE: Vim Related Keybingdings

  -- Go back to last buffer.
  vim.keymap.set('n', '<BS>', function()
    vim.cmd 'buffer #'
  end, { noremap = true, silent = true }),
  vim.keymap.set('t', 'jk', '<C-\\><C-n>'),
  vim.keymap.set('i', 'jk', '<ESC>'),
  vim.keymap.set('n', '<leader>W', ':w<CR>', { desc = 'Save current file/buffer' }),
  vim.keymap.set('n', '<S-x>', ':x<CR>', { desc = 'Save and e[x]it current file/buffer' }),

  -- NOTE: Customs Plugs Related Keybingdings
  vim.keymap.set('n', '<leader>mh', ':1ToggleTerm size=30 direction=horizontal name="main"<CR>', { desc = 'Open [h]orizontal terminal' }),
  vim.keymap.set('n', '<leader>mf', ':2ToggleTerm size=30 direction=float name="float"<CR>', { desc = 'Open [f]loating terminal' }),
  vim.keymap.set('n', '<leader>mv', ':3ToggleTerm size=70 direction=vertical name="vertical"<CR>', { desc = 'Open [v]ertical terminal' }),
  vim.keymap.set('n', '<leader>mg', LazyGitToggle, { desc = 'Open Lazy[g]it' }),
  vim.keymap.set('n', '<leader>ms', ':TermSelect<CR>', { desc = 'Open [s]elect terminal' }),
  -- turn off lsp messages.
  vim.keymap.set('n', '<leader>ml', function()
    vim.diagnostic.config { virtual_text = false }
  end, { desc = 'Turn off [l]sp virtual text' }),
}
