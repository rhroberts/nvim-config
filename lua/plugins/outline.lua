return {
  'hedyhli/outline.nvim',
  lazy = true,
  cmd = { 'Outline', 'OutlineOpen' },
  keys = {
    { '<leader>o', '<cmd>OutlineOpen<CR>', desc = 'Focus outline' },
    { '<leader>O', '<cmd>Outline<CR>', desc = 'Toggle outline' },
  },
  opts = {
    outline_window = {
      width = 40,
      relative_width = false,
      winhl = 'Normal:NeoTreeNormal',
    },
  },
}
