return {
  {
    "preservim/vim-pencil",
    ft = { "markdown", "text", "txt" }, -- Cargar solo en estos tipos de archivo
    config = function()
      -- Configuración básica de Pencil
      vim.g.pencil_higher_contrast_ui = 1
      vim.g.pencil_neutral_headings = 1
      vim.g.pencil_neutral_code_bg = 1
      vim.g.pencil_gutter_color = 1
      vim.g.pencil_spell_undercurl = 1
      vim.g.pencil_terminal_italics = 1
      
      -- Autocomandos para activar Pencil automáticamente
      local pencil_group = vim.api.nvim_create_augroup("pencil", { clear = true })
      
      vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
        pattern = {"*.md", "*.markdown", "*.txt", "*.text"},
        callback = function()
          vim.cmd("PencilSoft")  -- o "PencilHard" si prefieres hard wrap
        end,
        group = pencil_group,
      })
    end,
  }
}
