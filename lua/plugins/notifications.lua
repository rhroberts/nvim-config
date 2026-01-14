return {
  {
    'j-hui/fidget.nvim',
    event = 'VeryLazy',
    opts = {
      notification = {
        override_vim_notify = true,
      },
    },
    keys = {
      {
        '<leader>nh',
        '<cmd>Fidget history<cr>',
        desc = '[N]otification [H]istory',
      },
      {
        '<leader>nc',
        '<cmd>Fidget clear<cr>',
        desc = '[N]otification [C]lear',
      },
      {
        '<leader>ns',
        '<cmd>Fidget suppress<cr>',
        desc = '[N]otification [S]uppress',
      },
      {
        '<leader>nl',
        '<cmd>Fidget lsp_suppress<cr>',
        desc = '[N]otification [L]SP suppress',
      },
    },
  },
}
