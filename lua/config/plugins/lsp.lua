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
      -- local lsp = require "lspconfig"
      local capabilities = require "blink.cmp".get_lsp_capabilities()
      vim.lsp.config["lua_ls"].capabilities = capabilities
      vim.lsp.config["gopls"].capabilities = capabilities
      vim.lsp.config["pylsp"].capabilities = capabilities
      vim.lsp.config["clangd"].capabilities = capabilities
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("gopls")
      vim.lsp.enable("pylsp")
      vim.lsp.enable("clangd")
      -- lsp.lua_ls.setup { capabilities = capabilities }
      -- lsp.gopls.setup { capabilities = capabilities }
    end,
  },

}
