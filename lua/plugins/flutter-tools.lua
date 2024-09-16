return {
  "akinsho/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },
  config = function()
    require("flutter-tools").setup({})

    vim.api.nvim_set_keymap("n", "<leader>fr", ":FlutterRestart<CR>", {})
    vim.api.nvim_set_keymap("n", "<leader>fq", ":FlutterQuit<CR>", {})
    vim.api.nvim_set_keymap("n", "<leader>fd", ":FlutterDevices<CR>", {})
  end,
}
