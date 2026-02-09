-- ══════════════════════════════════════════════════════════════
-- MÓDULO: CORRECTOR ORTOGRÁFICO
-- Archivo: ~/.config/nvim/lua/spell.lua
-- ══════════════════════════════════════════════════════════════

local M = {}

-- ══════════════════════════════════════════════════════════════
-- CONFIGURACIÓN BÁSICA
-- ══════════════════════════════════════════════════════════════

function M.setup()
    -- Configuración del corrector
    vim.opt.spelllang = 'es,en_us'
    vim.opt.spell = false
    vim.opt.spellsuggest = 'best,10'
    vim.opt.spellfile = vim.fn.stdpath('config') .. '/spell/custom.utf-8.add'

    -- Configurar atajos
    M.setup_keymaps()
    
    -- Configurar colores
    M.setup_colors()
 end

-- ══════════════════════════════════════════════════════════════
-- FUNCIONES
-- ══════════════════════════════════════════════════════════════

-- Toggle del corrector ortográfico
function M.toggle_spell()
    vim.wo.spell = not vim.wo.spell
    if vim.wo.spell then
        print("✓ Corrector: ACTIVADO (" .. vim.o.spelllang .. ")")
    else
        print("✗ Corrector: DESACTIVADO")
    end
end

-- Cambiar idioma del corrector
function M.cambiar_idioma()
    local idiomas = vim.o.spelllang
    
    if idiomas == 'es,en_us' then
        vim.opt.spelllang = 'es'
        print("Idioma: Español únicamente")
    elseif idiomas == 'es' then
        vim.opt.spelllang = 'en_us'
        print("Idioma: English only")
    else
        vim.opt.spelllang = 'es,en_us'
        print("Idioma: Español + English")
    end
end

-- ══════════════════════════════════════════════════════════════
-- ATAJOS DE TECLADO
-- ══════════════════════════════════════════════════════════════

function M.setup_keymaps()
    local keymap = vim.keymap.set
    
    -- Toggle corrector (F7)
    keymap('n', '<F7>', M.toggle_spell, { noremap = true, desc = 'Toggle corrector' })
    
    -- Cambiar idioma (F8)
    keymap('n', '<F8>', M.cambiar_idioma, { noremap = true, desc = 'Cambiar idioma' })
    
    -- Navegación entre errores (Alt + j/k)
    keymap('n', '<M-j>', ']s', { noremap = true, silent = true, desc = 'Siguiente error' })
    keymap('n', '<M-k>', '[s', { noremap = true, silent = true, desc = 'Error anterior' })
    
    -- Navegación alternativa (Ctrl + flechas)
    keymap('n', '<C-Down>', ']s', { noremap = true, silent = true, desc = 'Siguiente error' })
    keymap('n', '<C-Up>', '[s', { noremap = true, silent = true, desc = 'Error anterior' })
    
    -- Acciones de corrección
    keymap('n', '<leader>s', 'z=', { noremap = true, desc = 'Ver sugerencias' })
    keymap('n', '<leader>sa', 'zg', { noremap = true, desc = 'Añadir palabra' })
    keymap('n', '<leader>sw', 'zw', { noremap = true, desc = 'Marcar incorrecta' })
    keymap('n', '<leader>su', 'zug', { noremap = true, desc = 'Deshacer añadir' })
end

-- ══════════════════════════════════════════════════════════════
-- COLORES (Dracula)
-- ══════════════════════════════════════════════════════════════

function M.setup_colors()
    vim.cmd([[
        highlight SpellBad   gui=bold guibg=#44475A guifg=#FF5555 cterm=bold ctermbg=239 ctermfg=203
        highlight SpellCap   gui=bold guibg=#44475A guifg=#FFB86C cterm=bold ctermbg=239 ctermfg=215
        highlight SpellRare  gui=bold guibg=#44475A guifg=#BD93F9 cterm=bold ctermbg=239 ctermfg=141
        highlight SpellLocal gui=bold guibg=#44475A guifg=#8BE9FD cterm=bold ctermbg=239 ctermfg=117
    ]])
end

return M

