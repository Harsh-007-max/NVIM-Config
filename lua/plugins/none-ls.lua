return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.formatting.golines,
        null_ls.builtins.diagnostics.eslint_d,

      },
      on_attach = function(client,bufnr)
        vim.keymap.set("n","<leader>fm",function()
          vim.lsp.buf.format({async=true})
        end,{buffer=bufnr})
      end,
    })
    -- vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {})
  end,
}
