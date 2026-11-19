-- lualine: информативная строка состояния в цветах текущей темы.
vim.pack.add({
  "https://github.com/nvim-lualine/lualine.nvim",
})

local function lsp_clients()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  local names = {}

  for _, client in ipairs(clients) do
    table.insert(names, client.name)
  end

  return table.concat(names, ", ")
end

require("lualine").setup({
  options = {
    theme = "auto",
    globalstatus = true,
    icons_enabled = true,
    component_separators = { left = "│", right = "│" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = { "NvimTree" },
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      "branch",
      {
        "diff",
        symbols = { added = " ", modified = " ", removed = " " },
      },
    },
    lualine_c = {
      {
        "filename",
        symbols = { modified = " ●", readonly = " ", unnamed = "[No Name]" },
      },
      {
        "diagnostics",
        sources = { "nvim_lsp" },
        symbols = { error = " ", warn = " ", info = " ", hint = "󰌵 " },
      },
    },
    lualine_x = {
      { lsp_clients, icon = "" },
      "encoding",
      "filetype",
    },
    lualine_y = { "progress" },
    lualine_z = { "%S", "location" },
  },
})
