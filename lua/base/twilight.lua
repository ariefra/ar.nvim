return {
  {
    'https://github.com/folke/twilight.nvim.git',
    event = 'VeryLazy',
    keys = {
      { '<leader>vt', '<cmd>Twilight<cr>', desc = 'Twilight' },
    },
    opts = {},
    config = function()
      require('twilight').setup {}
    end,
  },
}
