-- gitsigns: отображает добавленные, изменённые и удалённые строки Git.
vim.pack.add({
  "https://github.com/lewis6991/gitsigns.nvim",
})

require("gitsigns").setup({
  sign_priority = 20,
  signs = {
    add = { text = "┃" },
    change = { text = "┃" },
    delete = { text = "▁" },
    topdelete = { text = "▔" },
    changedelete = { text = "~" },
    untracked = { text = "┆" },
  },
})
