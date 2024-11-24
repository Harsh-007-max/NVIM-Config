return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "html","lua_ls", "clangd", "jdtls", "jsonls", "pyright", "angularls", "eslint", "tailwindcss", "omnisharp", "gopls", "ts_ls", "ast_grep" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,

    config = function()
      local on_attach =function(client,bufnr)
        local bufopts = {noremap = true, silent = true,buffer=bufnr}
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, bufopts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, bufopts)
        if client.name == "gopls" then
          vim.api.nvim_create_augroup("LSPAutocommands",{clear=true})
          vim.api.nvim_create_autocmd("BufWritePre",{
            group = "LSPAutocommands",
            pattern = "*.go",
            callback = function()
              vim.lsp.buf.format({async = true})
            end,
          })
        end
      end
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      local util = require("lspconfig.util")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
      lspconfig.pyright.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
      lspconfig.jdtls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
      lspconfig.jsonls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
      lspconfig.eslint.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
      lspconfig.angularls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
      -- lspconfig.charp_ls.setup({
      --   capabilities = capabilities,
      --   on_attach = on_attach,
      -- })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
      lspconfig.ast_grep.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
      lspconfig.gopls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
            }
          },
        }
      })
      lspconfig.omnisharp.setup({
        cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
        filetypes = { "cs", "cshtml" },
        root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj"),
        on_attach = on_attach,
      })
    end,
  },
}
