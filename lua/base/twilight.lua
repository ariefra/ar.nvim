return {
  {
    'https://github.com/folke/twilight.nvim.git',
    cmd = 'Twilight',
    config = function()
      require('twilight').setup {}
    end,
  },
}
