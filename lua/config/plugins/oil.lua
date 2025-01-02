return {
  {
    "stevearc/oil.nvim",
    -- @module "oil"
    -- @type oil.SetupOpts
    opts = {},
    dependencies = {
      { "echasnovski/mini.icons", opts = {} },
      -- "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require "oil".setup {
        default_file_explorer = false,
      }
    end,
  },
}
