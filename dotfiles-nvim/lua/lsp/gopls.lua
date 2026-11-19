-- gopls: языковой сервер для Go.
-- Обеспечивает навигацию по коду, автодополнение, диагностику и другие возможности LSP.
-- Собственные горячие клавиши: нет; общие клавиши задаются в lua/lsp/init.lua.
vim.lsp.config("gopls", {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.work", "go.mod", ".git" },
  settings = {
    gopls = {
      staticcheck = true,
    },
  },
})

vim.lsp.enable("gopls")
