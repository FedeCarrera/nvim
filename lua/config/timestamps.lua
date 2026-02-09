-- ~/.config/nvim/lua/config/timestamps.lua
local M = {}
local function capitalize(str)
	return str:sub(1,1):upper() .. str:sub(2):lower()
end

-- Timestamps simples para diario
M.setup = function()
    vim.keymap.set('n', '<leader>time', function()
        local timestamp = '--- ' .. os.date('%Y-%m-%d %H:%M') .. ' ---'
        vim.api.nvim_put({timestamp, ''}, 'l', true, true)
        vim.api.nvim_feedkeys('j', 'n', false)
    end, { desc = 'Insertar timestamp de diario' })
    

    vim.keymap.set('n', '<leader>hoy', function()
        local timestamp = '# ' .. os.date('%d/%m/%Y - ') .. capitalize(os.date('%A'))  
        vim.api.nvim_put({timestamp, ''}, 'l', true, true)
        vim.api.nvim_feedkeys('j', 'n', false)
    end, { desc = 'Insertar timestamp de diario' })

    vim.keymap.set('n', '<leader>ayer', function()
        local yesterday = os.time() - 24 * 60 * 60  -- Restar 24 horas
        local timestamp = '# ' .. os.date('%d/%m/%Y - ', yesterday) .. capitalize(os.date('%A', yesterday))  
        vim.api.nvim_put({timestamp, ''}, 'l', true, true)
        vim.api.nvim_feedkeys('j', 'n', false)
    end, { desc = 'Insertar timestamp del día anterior' })


    vim.keymap.set('n', '<leader>now', function()
        local time = '**' .. os.date('%H:%M') .. '** - '
        vim.api.nvim_put({time}, 'c', false, true)
        vim.api.nvim_feedkeys('A', 'n', false)
    end, { desc = 'Hora actual + modo inserción' })

    vim.keymap.set('n', '<leader>nd', function()
        local lines = {
            '',
            '--- ' .. os.date('%Y-%m-%d %H:%M') .. ' ---',
            ''
        }
        vim.api.nvim_put(lines, 'l', true, true)
        vim.api.nvim_feedkeys('A', 'n', false)
    end, { desc = 'Nueva entrada de diario' })
end

return M
