require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "ts_ls", "gopls" }

local jdtls_dir = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local jdtls_launcher = vim.fn.glob(jdtls_dir .. "/org.eclipse.equinox.launcher_*.jar")
if jdtls_launcher == nil or jdtls_launcher == "" then
  jdtls_launcher = vim.fn.glob(jdtls_dir .. "/plugins/org.eclipse.equinox.launcher_*.jar")
end

if jdtls_launcher ~= nil and jdtls_launcher ~= "" then
  vim.lsp.config("jdtls", {
    cmd = {
      "java",
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dosgi.checkConfiguration=true",
      "-jar",
      jdtls_launcher,
      "-configuration",
      jdtls_dir,
      "-data",
      vim.fn.stdpath("cache") .. "/nvim/jdtls/workspace",
    },
  })
  table.insert(servers, "jdtls")
else
  vim.schedule(function()
    vim.notify("jdtls launcher jar not found under " .. jdtls_dir, vim.log.levels.WARN)
  end)
end

vim.lsp.config("gopls",{
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
      completeUnimported = true,
      usePlaceholders = true,
    },
  },
})
vim.lsp.enable(servers)
-- read :h vim.lsp.config for changing options of lsp servers 
