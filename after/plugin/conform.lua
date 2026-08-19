local conform = require 'conform'
local config_root = vim.fs.normalize(vim.fn.stdpath 'config')

local upstream_files = {
  [vim.fs.joinpath(config_root, 'init.lua')] = true,
  [vim.fs.joinpath(config_root, 'lua', 'custom', 'plugins', 'init.lua')] = true,
}
local upstream_dirs = {
  vim.fs.joinpath(config_root, 'lua', 'kickstart'),
}

local function is_same_or_child(path, root) return path == root or path:sub(1, #root + 1) == root .. '/' end

local function is_upstream_config(path)
  if upstream_files[path] then return true end
  for _, root in ipairs(upstream_dirs) do
    if is_same_or_child(path, root) then return true end
  end
  return false
end

conform.setup {
  formatters_by_ft = {
    lua = { 'stylua' },
  },
  format_on_save = function(bufnr)
    if vim.bo[bufnr].filetype ~= 'lua' then return nil end
    if vim.b[bufnr].disable_autoformat or vim.g.disable_autoformat then return nil end

    local path = vim.api.nvim_buf_get_name(bufnr)
    if path ~= '' and is_upstream_config(vim.fs.normalize(path)) then return nil end

    return {
      timeout_ms = 500,
      lsp_format = 'fallback',
    }
  end,
}
