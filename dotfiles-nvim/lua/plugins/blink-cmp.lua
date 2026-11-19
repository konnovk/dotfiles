-- blink.cmp: автодополнение из LSP, сниппетов, путей и открытых буферов.
-- LuaSnip раскрывает шаблоны, friendly-snippets предоставляет готовую коллекцию.
-- Горячие клавиши:
--   <C-n> / <C-p> — следующий/предыдущий вариант
--   <C-y>         — подтвердить выбор
--   <C-e>         — закрыть меню
--   <C-space>     — открыть меню или документацию
--   <Tab> / <S-Tab> — перейти к следующему/предыдущему месту вставки в сниппете
vim.pack.add({
  {
    src = "https://github.com/Saghen/blink.cmp",
    version = vim.version.range("1.*"),
  },
  {
    src = "https://github.com/L3MON4D3/LuaSnip",
    version = vim.version.range("2.*"),
  },
  "https://github.com/rafamadriz/friendly-snippets",
})

require("luasnip.loaders.from_vscode").lazy_load()

local luasnip = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

-- В friendly-snippets есть pkgm для package main + func main, но нет
-- отдельного объявления пакета.
luasnip.add_snippets("go", {
  luasnip.snippet("package", fmt("package {}", { luasnip.insert_node(1, "main") })),
})

require("blink.cmp").setup({
  keymap = { preset = "default" },
  snippets = { preset = "luasnip" },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 300,
    },
    list = {
      selection = {
        preselect = false,
        auto_insert = false,
      },
    },
  },
  fuzzy = { implementation = "prefer_rust" },
})

-- Одна общая настройка capabilities для языковых серверов.
vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
})
