vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set wrap")
vim.opt.lsp.display_inlay_hints = true
vim.g.mapleader = " "
vim.cmd("set number relativenumber")
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { silent = true })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { silent = true })
vim.keymap.set("t", "<A-Return>", "<C-\\><C-n>", { silent = true })


vim.keymap.set("i", "<A-Return>", "<Esc>", { silent = true })

vim.keymap.set({ "n" }, "<leader>x", ":bd<CR>", { silent = true })
vim.keymap.set({ "n" }, "<leader>ls", ":Telescope session-lens<CR>", { silent = true })
vim.keymap.set("v", "y", '"+y', { silent = true })
vim.api.nvim_set_keymap("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<S-Tab>", ":bprev<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "i" }, "<C-h>", "<C-w>h", {})
vim.keymap.set({ "n", "i" }, "<C-j>", "<C-w>j", {})
vim.keymap.set({ "n", "i" }, "<C-k>", "<C-w>k", {})
vim.keymap.set({ "n", "i" }, "<C-l>", "<C-w>l", {})

vim.api.nvim_set_keymap("i", "(", "()<Left>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "{", "{}<Left>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "[", "[]<Left>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", '"', '""<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "'", "''<Left>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "`", "``<Left>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>sh", ":split<Return><C-w>w", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>sv", ":vsplit<Return><C-w>w", { silent = true })

vim.api.nvim_set_keymap("n", "<leader>ch", ":GeminiChat<Return>", { silent = true })
