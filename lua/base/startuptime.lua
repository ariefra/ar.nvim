return {
  {
    "https://github.com/dstein64/vim-startuptime.git",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },
}
