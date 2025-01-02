return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require "blink.cmp".get_lsp_capabilities()
      local lsp = require "lspconfig"
      lsp.lua_ls.setup { capabilities = capabilities }
      lsp.gopls.setup { capabilities = capabilities }
    end,
  },

}
