return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      size = 13,
      open_mapping = [[<c-\>]],
      start_in_insert = true,
      shade_filetype = {},
      shade_terminal = true,
      shading_factor = 1,
      persist_size = true,
      direction = "horizontal",
    })
  end,
}
