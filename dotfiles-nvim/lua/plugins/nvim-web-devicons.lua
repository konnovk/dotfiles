-- nvim-web-devicons: иконки файлов для bufferline и других плагинов.
-- Горячие клавиши: нет.
vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
})

require("nvim-web-devicons").setup({
  default = true, -- иконка по умолчанию для неизвестных типов файлов
})
