vim.pack.add {
  {
    src = 'https://github.com/folke/snacks.nvim',
    version = vim.version.range '2.*',
  },
}

require('snacks').setup {
  lazygit = {
    enabled = true,
    config = {
      gui = {
        nerdFontsVersion = vim.g.have_nerd_font and '3' or '',
      },
    },
    win = {
      -- A local, immediate `j` wins over the global terminal `jk` mapping.
      -- This keeps LazyGit navigation responsive without changing other terminals.
      on_buf = function(win)
        vim.keymap.set('t', 'j', 'j', {
          buffer = win.buf,
          nowait = true,
          silent = true,
          desc = 'Send j to LazyGit',
        })
      end,
    },
  },
}
