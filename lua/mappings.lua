require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- toggle nvim-tree (overrides default <leader>e which only focuses)
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

-- global search (ripgrep via telescope)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep (global search)" })
