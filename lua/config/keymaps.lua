vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end
    if client.supports_method("textDocument/rename") then
      vim.keymap.set("n", "grn", vim.lsp.buf.rename)
    end
    if client.supports_method("textDocument/definition") then
      vim.keymap.set("n", "gd", vim.lsp.buf.definition)
    end
    if client.supports_method("textDocument/references") then
      vim.keymap.set("n", "grr", vim.lsp.buf.references)
    end
    if client.supports_method("textDocument/implementation") then
      vim.keymap.set("n", "gri", vim.lsp.buf.implementation)
    end
    if client.supports_method("textDocument/codeAction") then
      vim.keymap.set("n", "ga", vim.lsp.buf.code_action)
    end

    if client.supports_method("textDocument/formatting") then
      vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
    end
  end,
})

vim.keymap.set("n", "<leader>sh", require "telescope.builtin".help_tags)
vim.keymap.set("n", "<leader>sf", require "telescope.builtin".find_files)
vim.keymap.set("n", "<leader>sn", function()
  require "telescope.builtin".find_files {
    cwd = vim.fn.stdpath "config"
  }
end)
vim.keymap.set("n", "<leader>sg", require "config.plugins.telescope.multigrep".live_multigrep)


vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

-- tabs
vim.keymap.set("n", "<M-n>", "<cmd>tabnext<CR>")
vim.keymap.set("n", "<M-p>", "<cmd>tabprev<CR>")
vim.keymap.set("n", "<M-q>", "<cmd>quit<CR>")


-- disable some keybindings for training
vim.keymap.set("n", "<C-b>", "<Nop>")
vim.keymap.set("n", "<C-f>", "<Nop>")


-- diagnostics
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setqflist)
vim.keymap.set("n", "<leader>dk", vim.diagnostic.open_float)
