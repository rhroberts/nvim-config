return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'echasnovski/mini.nvim',
  },
  init = function()
    -- refresh when gitsigns updates
    vim.api.nvim_create_autocmd('User', {
      pattern = 'GitSignsUpdate',
      callback = function()
        local events = require('neo-tree.events')
        events.fire_event(events.GIT_EVENT)
      end,
    })
  end,
  keys = {
    { '<leader>l', '<cmd>Neotree focus<CR>', desc = 'Focus neo-tree' },
    { '<leader>L', '<cmd>Neotree toggle<CR>', desc = 'Toggle neo-tree' },
  },
  opts = {
    log_level = 'info',
    close_if_last_window = true,
    window = {
      mappings = {
        ['l'] = 'open',
        ['h'] = 'close_node',
        ['R'] = 'refresh',
        ['I'] = 'toggle_gitignored',
      },
      width = 40,
    },
    filesystem = {
      follow_current_file = {
        enabled = true,
      },
      use_libuv_file_watcher = true,
      scan_mode = 'deep',
      bind_to_cwd = false,
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
    default_component_configs = {
      git_status = {
        symbols = {
          added = '+',
          modified = '~',
          deleted = '-',
          renamed = '➜',
          untracked = '?',
          ignored = '◌',
          unstaged = '●',
          staged = '✓',
          conflict = '!',
        },
      },
    },
    git_status = {
      window = {
        position = 'float',
      },
    },
    sources = { 'filesystem', 'buffers', 'git_status', 'document_symbols' },
    source_selector = {
      winbar = false,
      statusline = false,
      sources = {
        { source = 'filesystem' },
        { source = 'git_status' },
      },
    },
    commands = {
      refresh_git = function()
        require('neo-tree.sources.manager').refresh('filesystem')
      end,
      toggle_gitignored = function(state)
        state.filtered_items.hide_gitignored = not state.filtered_items.hide_gitignored
        require('neo-tree.sources.manager').refresh('filesystem')
      end,
    },
    auto_clean_after_session_restore = true,
  },
}
