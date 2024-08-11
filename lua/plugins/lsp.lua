return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "folke/neodev.nvim",
  },
  config = function()
    local on_attach = function(_, bufnr)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover,{buffer = bufnr})
    end
    require("neodev").setup()
    require("lspconfig").lua_ls.setup({
      on_attach = on_attach,
      settings = {
        Lua={
          telemetry = { enable = false},
          workspace = { checkThirdParty = false},
          }
      }
    })
 -- python config init  
    require'lspconfig'.pylsp.setup{
      on_attach = on_attach,
      settings = {
      pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391'},
          maxLineLength = 100
        }
      }
    }
  }
}
-- Typscript 
    require'lspconfig'.tsserver.setup{}
  end
}
