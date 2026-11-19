-- nvim-tree: файловый менеджер в боковой панели.
-- Горячие клавиши:
--   <leader>e       — открыть/закрыть файловый менеджер
--   l / <Right>     — раскрыть каталог или перейти к первому элементу (внутри NvimTree)
--   h / <Left>      — закрыть каталог или перейти к родительскому (внутри NvimTree)
--   l         — открыть файл

-- Отключаем встроенный файловый менеджер
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.pack.add({ "https://github.com/nvim-tree/nvim-tree.lua" })

local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  api.config.mappings.default_on_attach(bufnr)

  local opts = { buffer = bufnr, noremap = true, silent = true, nowait = true }

  local function enter_directory()
    local node = api.tree.get_node_under_cursor()

    if not node or node.type ~= "directory" then
      api.node.open.edit()
      return
    end

    if node.open then
      vim.cmd("normal! j")
    else
      api.node.open.edit()
    end
  end

  vim.keymap.set("n", "l", enter_directory, opts)
  vim.keymap.set("n", "<Right>", enter_directory, opts)
  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts)
  vim.keymap.set("n", "<Left>", api.node.navigate.parent_close, opts)
end

require("nvim-tree").setup({
  on_attach = on_attach,
  renderer = {
    group_empty = true,
  },
  view = {
    width = 50,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
})

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", {
  desc = "Toggle file explorer",
})
