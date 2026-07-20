local gitsigns = require 'gitsigns'

gitsigns.setup {
  on_attach = function(bufnr)
    local function map(mode, lhs, rhs, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal { ']c', bang = true }
      else
        gitsigns.nav_hunk 'next'
      end
    end, { desc = 'Git: Next hunk' })

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal { '[c', bang = true }
      else
        gitsigns.nav_hunk 'prev'
      end
    end, { desc = 'Git: Previous hunk' })

    map('v', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = 'Git: Stage hunk' })
    map('v', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = 'Git: Reset hunk' })

    map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Git: Stage hunk' })
    map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Git: Reset hunk' })
    map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Git: Stage buffer' })
    map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Git: Reset buffer' })
    map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Git: Preview hunk' })
    map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = 'Git: Preview hunk inline' })
    map('n', '<leader>hb', function() gitsigns.blame_line { full = true } end, { desc = 'Git: Blame line' })
    map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Git: Diff against index' })
    map('n', '<leader>hD', function() gitsigns.diffthis '@' end, { desc = 'Git: Diff against last commit' })
    map('n', '<leader>hQ', function() gitsigns.setqflist 'all' end, { desc = 'Git: Repository hunks' })
    map('n', '<leader>hq', gitsigns.setqflist, { desc = 'Git: Buffer hunks' })

    map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Toggle Git blame line' })
    map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = 'Toggle Git word diff' })
    map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { desc = 'Git: Select hunk' })
  end,
}
