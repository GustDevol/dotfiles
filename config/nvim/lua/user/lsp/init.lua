local ok, _ = pcall(require, "lspconfig")
if not ok then
  return
end

-- require('lsp.cmp')
require('user.lsp.lspinstaller')
require('user.lsp.handlers').setup()
