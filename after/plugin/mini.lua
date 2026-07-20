local files = require 'mini.files'
local bufremove = require 'mini.bufremove'

files.setup {
  options = {
    -- Keep Neovim's built-in directory browser available on `-`.
    use_as_default_explorer = false,
  },
}
bufremove.setup()
require('mini.pairs').setup()

vim.keymap.set('n', '<leader>e', function()
  -- If an explorer is already open in this tab, treat the mapping as a toggle.
  if files.close() ~= nil then return end

  local path = vim.api.nvim_buf_get_name(0)
  if path == '' or not vim.uv.fs_stat(path) then path = nil end
  files.open(path)
end, { desc = 'Files: Explorer' })

vim.keymap.set('n', '<leader>bd', function() bufremove.delete(0, false) end, { desc = 'Buffer: Delete' })
