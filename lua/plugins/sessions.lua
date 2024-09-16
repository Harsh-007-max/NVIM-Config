return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      session_lens = {
        buftype_to_ignore = { "terminal" },
        load_on_setup = true,
        theme_conf = { border = true },
        preview = false
      },
    })
  end,
}
