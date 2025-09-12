-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'lazy'
---@type LazySpec
return {
  {
    'stevearc/resession.nvim',
    opts = {},
    config = function()
      local resession = require 'resession'
      resession.setup()

      local function get_session_name()
        local name = vim.fn.getcwd()
        local branch = vim.trim(vim.fn.system 'git branch --show-current')
        if vim.v.shell_error == 0 then
          return name .. branch
        else
          return name
        end
      end
      vim.api.nvim_create_autocmd('VimEnter', {
        callback = function()
          -- Only load the session if nvim was started with no args
          if vim.fn.argc(-1) == 0 then resession.load(get_session_name(), { dir = 'dirsession', silence_errors = true }) end
        end,
      })
      vim.api.nvim_create_autocmd('VimLeavePre', {
        callback = function() resession.save(get_session_name(), { dir = 'dirsession', notify = false }) end,
      })

      vim.keymap.set('n', '<leader>rs', resession.save, { desc = 'ressesion [s]ave' })
      vim.keymap.set('n', '<leader>rl', resession.load, { desc = 'ressesion [l]oad' })
      vim.keymap.set('n', '<leader>rd', resession.delete, { desc = 'ressesion [d]elete' })
    end,
  },
  {
    'datsfilipe/vesper.nvim',
    config = function()
      local vesper = require 'vesper'
      vesper.setup {
        transparent = false, -- Boolean: Sets the background to transparent
        italics = {
          comments = true, -- Boolean: Italicizes comments
          keywords = false, -- Boolean: Italicizes keywords
          functions = true, -- Boolean: Italicizes functions
          strings = false, -- Boolean: Italicizes strings
          variables = false, -- Boolean: Italicizes variables
        },
        overrides = {}, -- A dictionary of group names, can be a function returning a dictionary or a table.
        palette_overrides = {},
      }
    end,
  },
  {
    'thesimonho/kanagawa-paper.nvim',
    priority = 1000,
    opts = {},
    config = function()
      local theme = require 'kanagawa-paper'
      theme.setup {
        color_offset = {
          ink = { brightness = 1, saturation = 1 },
          canvas = { brightness = 0, saturation = 0 },
        },
      }
    end,
  },
  -- lua/plugins/rose-pine.lua
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {
        styles = {
          bold = true,
          italic = false,
          transparency = false,
        },
      }
    end,
  },
}
