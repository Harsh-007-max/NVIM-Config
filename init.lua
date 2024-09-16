local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}
require("vim-options")
require("lazy").setup("plugins")
-- vim.cmd("colorscheme kanagawa-wave")
-- vim.cmd("colorscheme carbonfox")
-- vim.cmd('colorscheme everblush')
vim.cmd("colorscheme tokyonight")
-- vim.cmd('colorscheme rose-pine')


vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.cshtml",
  command = "set filetype=html.cshtml.razor"
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.razor",
  command = "set filetype=html.cshtml.razor"
})
