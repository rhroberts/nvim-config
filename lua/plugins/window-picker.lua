return {
  's1n7ax/nvim-window-picker',
  name = 'window-picker',
  version = '2.*',
  keys = {
    {
      '<leader>wp',
      function()
        local win = require('window-picker').pick_window()
        if win then
          vim.api.nvim_set_current_win(win)
        end
      end,
      desc = '[w]indow [p]ick',
    },
  },
  opts = {
    hint = 'floating-big-letter',
    filter_rules = {
      bo = {
        filetype = { 'NvimTree', 'neo-tree', 'notify', 'snacks_notif', 'Outline' },
      },
    },
  },
}
