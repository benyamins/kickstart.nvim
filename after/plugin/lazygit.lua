local snacks = require 'snacks'

vim.keymap.set('n', '<leader>gg', function()
  local root = snacks.git.get_root() or snacks.git.get_root(vim.uv.cwd())
  if not root then
    vim.notify('Not inside a Git repository', vim.log.levels.WARN)
    return
  end

  snacks.lazygit { cwd = root }
end, { desc = 'Git: LazyGit' })
