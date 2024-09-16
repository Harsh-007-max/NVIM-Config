return {
  {
  "OmniSharp/omnisharp-vim",
  config = function ()
    local g = vim.g
    g.OmniSharp_server_use_net8 = 1
  end
  },
  {"jlcrochet/vim-razor"},
}
