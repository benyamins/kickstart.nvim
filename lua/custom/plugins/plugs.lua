function LazyGitToggle()
  local Terminal = require('toggleterm.terminal').Terminal
  local lazygit = Terminal:new {
    cmd = 'lazygit',
    count = 3,
    direction = 'float',
    display_name = 'lazygit',
    float_opts = { border = 'double' },
    on_open = function(term)
      vim.cmd 'startinsert!'
      vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
    end,
    on_close = function()
      vim.cmd 'startinsert!'
    end,
  }
  lazygit:toggle()
end

return {
  {
    'rmagatti/auto-session',
    version = '*',
    config = function()
      require('auto-session').setup {
        log_level = 'error',
        auto_session_supress_dirs = { '~/', '~/Downloads/', '/' },
      }
    end,
  },
  -- NOTE: ToggleTerm & Keys
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        open_mapping = [[<c-\>]],
      }
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup {
        max_lines = 4,
      }
    end,
  },
  require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.autopairs',
  {
    'OXY2DEV/markview.nvim',
    lazy = false, -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway

    dependencies = {
      -- You will not need this if you installed the
      -- parsers manually
      -- Or if the parsers are in your $RUNTIMEPATH
      'nvim-treesitter/nvim-treesitter',

      'nvim-tree/nvim-web-devicons',
    },
  },
  -- NOTE: SQL
  --{
  --  'kristijanhusak/vim-dadbod-ui',
  --  dependencies = {
  --    { 'tpope/vim-dadbod', lazy = true },
  --    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
  --  },
  --  cmd = {
  --    'DBUI',
  --    'DBUIToggle',
  --    'DBUIAddConnection',
  --    'DBUIFindBuffer',
  --  },
  --  init = function()
  --    -- Your DBUI configuration
  --    vim.g.db_ui_use_nerd_fonts = 1
  --  end,
  --},
}
