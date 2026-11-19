-- nvim-ts-autotag: автоматически закрывает и синхронно переименовывает теги.
-- Работает в HTML, XML, JSX/TSX, Vue, Svelte и других поддерживаемых файлах.
-- Горячие клавиши: нет; работает автоматически в режиме вставки.
vim.pack.add({
  "https://github.com/windwp/nvim-ts-autotag",
})

require("nvim-ts-autotag").setup({
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = false,
  },
})
