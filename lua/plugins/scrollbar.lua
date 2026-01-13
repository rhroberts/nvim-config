return {
  {
    'petertriho/nvim-scrollbar',
    event = 'BufReadPost',
    opts = {
      excluded_filetypes = {
        'blink-cmp-menu',
        'blink-cmp-documentation',
        'noice',
        'prompt',
        'TelescopePrompt',
        'neo-tree',
      },
    },
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'kevinhwang91/nvim-hlslens',
    },
  },
  {
    'kevinhwang91/nvim-hlslens',
    event = 'BufReadPost',
    config = function()
      require('scrollbar.handlers.search').setup()
      require('scrollbar.handlers.gitsigns').setup()
    end,
  },
}
