-- nvim-treesitter: подсветка синтаксиса и парсеры для других Tree-sitter функций.
-- XML необходим для автоматического закрытия тегов в pom.xml и других XML-файлах.
vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
})

require("nvim-treesitter").setup({})
require("nvim-treesitter").install({
  "go",
  "gomod",
  "gowork",
  "rust",
  "toml",
  "lua",
  "html",
  "xml",
  "markdown"
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    -- Включаем подсветку там, где доступен подходящий парсер.
    pcall(vim.treesitter.start, args.buf)
  end,
})
