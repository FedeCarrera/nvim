-- Configuraciones de Neovim
vim.opt.scrolloff = 8        -- Mantiene 8 líneas arriba/abajo del cursor
vim.opt.sidescrolloff = 8    -- Lo mismo pero horizontalmente
vim.opt.scroll = 4          -- Número de líneas para scroll con Ctrl+u/d

require('config.timestamps').setup()
require('config.spell').setup()
