-- Personal options
vim.o.winborder = 'rounded'
vim.o.pumborder = 'rounded'
vim.opt.jumpoptions:append 'view'

-- Personal keymaps
vim.api.nvim_set_keymap('n', '<backspace>', '<C-^>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true, desc = 'Save like [:w]' })
vim.keymap.set('t', 'jk', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })

local has_which_key, which_key = pcall(require, 'which-key')
if has_which_key then which_key.add {
  { '<leader>b', group = '[B]uffer' },
  { '<leader>g', group = '[G]it' },
} end

-- Restore the last cursor position after the buffer's filetype is known.
local restore_cursor_group = vim.api.nvim_create_augroup('personal-restore-cursor', { clear = true })
vim.api.nvim_create_autocmd('BufReadPre', {
  group = restore_cursor_group,
  callback = function(event)
    local finished = false
    local function restore_cursor()
      if finished then return end
      finished = true

      local filetype = vim.bo[event.buf].filetype
      local last_line = vim.api.nvim_buf_get_mark(event.buf, '"')[1]
      local line_count = vim.api.nvim_buf_line_count(event.buf)

      if last_line < 1 or last_line > line_count then return end
      if filetype:find('commit', 1, true) then return end
      if filetype == 'xxd' or filetype == 'gitrebase' or vim.wo.diff then return end

      vim.cmd.normal { 'g`"', bang = true }
    end

    vim.api.nvim_create_autocmd('FileType', {
      group = restore_cursor_group,
      buffer = event.buf,
      once = true,
      callback = restore_cursor,
    })
    vim.api.nvim_create_autocmd('BufWinEnter', {
      group = restore_cursor_group,
      buffer = event.buf,
      once = true,
      callback = restore_cursor,
    })
  end,
})

-- Personal UI
if vim.g.neovide then vim.o.guifont = 'Iosevka_NF:h9' end

vim.cmd.colorscheme 'lunaperche'
