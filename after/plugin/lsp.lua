-- Personal language servers. Keep these outside init.lua so upstream updates
-- can be merged without reapplying local LSP changes.
vim.lsp.config('pyright', {})
vim.lsp.enable 'pyright'
