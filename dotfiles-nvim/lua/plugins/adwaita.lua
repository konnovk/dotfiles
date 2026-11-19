-- adwaita: цветовая схема в стиле GNOME Adwaita.
vim.pack.add({
  "https://github.com/Mofiqul/adwaita.nvim",
})

vim.o.background = "dark"
vim.cmd.colorscheme("adwaita")

-- Более контрастная подсветка кода с сохранением палитры GNOME Adwaita.
local highlights = {
  ["@variable"] = { fg = "#99C1F1" },
  ["@variable.parameter"] = { fg = "#FFBE6F" },
  ["@variable.member"] = { fg = "#99C1F1" },
  ["@property"] = { fg = "#99C1F1" },
  ["@type"] = { fg = "#93DDC2" },
  ["@type.builtin"] = { fg = "#93DDC2", bold = true },
  ["@constructor"] = { fg = "#93DDC2" },
  ["@function"] = { fg = "#8FF0A4" },
  ["@function.call"] = { fg = "#8FF0A4" },
  ["@function.method"] = { fg = "#8FF0A4" },
  ["@function.method.call"] = { fg = "#8FF0A4" },
  ["@method"] = { fg = "#8FF0A4" },
  ["@method.call"] = { fg = "#8FF0A4" },
  ["@constant"] = { fg = "#DC8ADD" },
  ["@constant.builtin"] = { fg = "#DC8ADD", bold = true },
}

for group, options in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, options)
end
