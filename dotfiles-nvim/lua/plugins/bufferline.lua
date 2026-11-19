-- bufferline: отображает открытые буферы как вкладки в верхней части окна.
-- Поддерживает переключение мышью и показывает диагностику LSP.
-- Горячие клавиши:
--   <S-h>        — предыдущий буфер
--   <S-l>        — следующий буфер
--   <leader>bd   — закрыть текущий буфер
--   <leader>bo   — закрыть остальные буферы
vim.pack.add({
  "https://github.com/akinsho/bufferline.nvim",
})

require("bufferline").setup({
  options = {
    mode = "buffers", -- показывать открытые файлы, а не Vim tabpages

    diagnostics = "nvim_lsp", -- показывать ошибки и предупреждения LSP
    always_show_bufferline = true,

    show_close_icon = false,
    show_buffer_close_icons = true,

    separator_style = "thin",

    -- Не перекрывать файловый менеджер
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "left",
        separator = true,
      },
    },
  },
})

-- Переключение между вкладками
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", {
  desc = "Previous buffer",
})

vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", {
  desc = "Next buffer",
})

-- Закрытие вкладок
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", {
  desc = "Close current buffer",
})

vim.keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", {
  desc = "Close other buffers",
})
