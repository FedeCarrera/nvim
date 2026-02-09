-- Configurar leader antes de cargar plugins
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.lazy")
require('config.config')
-- Usar el clipboard del sistema por defecto
vim.opt.clipboard = "unnamedplus"

