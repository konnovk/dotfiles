-- Общая конфигурация LSP: горячие клавиши, диагностика и подключение серверов.
-- Пользовательские горячие клавиши:
--   gd       — перейти к определению (если сервер поддерживает эту возможность)
-- Стандартные горячие клавиши Neovim LSP:
--   K        — показать документацию для символа под курсором
--   grn      — переименовать символ
--   gra      — показать доступные действия с кодом (Normal/Visual)
--   grr      — показать ссылки на символ
--   gri      — перейти к реализации
--   gO       — показать список символов в текущем документе
--   <C-s>    — показать сигнатуру функции (Insert)
-- Автодополнение кода настраивается в lua/plugins/blink-cmp.lua.

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      return
    end

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
      buffer = args.buf,
      desc = "Go to definition",
    })
  end,
})

vim.diagnostic.config({
  virtual_text = true,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.go", "*.rs" },
  callback = function(args)
    vim.lsp.buf.format({
      bufnr = args.buf,
      async = false,
      timeout_ms = 2000,
    })
  end,
  desc = "Format Go and Rust files before saving",
})

require("lsp.gopls")
require("lsp.rust_analyzer")
require("lsp.lua_ls")

