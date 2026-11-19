-- fzf-lua: нечёткий поиск файлов, текста, буферов и справки.
-- Горячие клавиши:
--   <leader>ff — найти файл
--   <leader>fg — найти текст в файлах
--   <leader>fb — выбрать буфер
--   <leader>fh — найти страницу справки

vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" })

require("fzf-lua").setup({})

vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", {
  desc = "Find files",
})
vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", {
  desc = "Find text in files",
})
vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", {
  desc = "Find buffer",
})
vim.keymap.set("n", "<leader>fh", "<cmd>FzfLua help_tags<cr>", {
  desc = "Find help tag",
})
