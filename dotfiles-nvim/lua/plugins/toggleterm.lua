-- toggleterm: встроенный терминал в отдельной вкладке.
-- Горячие клавиши:
--   <leader>t — открыть/скрыть терминал (в обычном режиме)
--   <F12>     — открыть/скрыть терминал (в обычном и терминальном режимах)
vim.pack.add({
  "https://github.com/akinsho/toggleterm.nvim",
})

require("toggleterm").setup({
  direction = "tab",
  start_in_insert = true,
})

vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<cr>", {
  desc = "Toggle terminal",
})

vim.keymap.set({ "n", "t" }, "<F12>", "<cmd>ToggleTerm<cr>", {
  desc = "Toggle terminal",
})
