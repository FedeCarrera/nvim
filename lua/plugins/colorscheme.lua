return {
  "binhtran432k/dracula.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "dracula"
    vim.api.nvim_set_hl(0, 'Search', { fg = '#282A36', bg = '#8BE9FD' })
    vim.api.nvim_set_hl(0, 'IncSearch', { fg = '#282A36', bg = '#8BE9FD' })
  end,
}
