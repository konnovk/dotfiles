-- Базовые настройки (опции)
vim.opt.number = true         -- Номера строк
vim.opt.signcolumn = "auto:2" -- Отдельные колонки для диагностики LSP и Git
vim.opt.expandtab = true      -- Пробелы вместо табов
vim.opt.shiftwidth = 2        -- Ширина отступа
vim.opt.tabstop = 2           -- Ширина таба
vim.opt.termguicolors = true  -- True color
vim.opt.clipboard = "unnamedplus" -- Общий буфер обмена с системой
vim.opt.cmdheight = 0             -- Скрыть пустую командную строку под статусбаром
vim.opt.showcmdloc = "statusline" -- Показывать префиксы команд в статусбаре

-- Отображение пробелов и табов, аналогично VS Code
vim.opt.list = true
vim.opt.listchars = {
  tab = "→ ",
  space = "·",
  trail = "·",
  nbsp = "␣",
}

-- Устанавливаем лидер-клавишу (пробел)
vim.g.mapleader = " "
