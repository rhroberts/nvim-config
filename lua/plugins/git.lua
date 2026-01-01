return {
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        signs = {
          add = { text = '┃' },
          change = { text = '┃' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
          untracked = { text = '┆' },
        },
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
        watch_gitdir = {
          interval = 700,
          follow_files = true,
        },
        auto_attach = true,
        attach_to_untracked = true,
        current_line_blame = false,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol',
          delay = 700,
          ignore_whitespace = false,
        },
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,
        max_file_length = 40000,
        preview_config = {
          border = 'single',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1,
        },
        on_attach = function(bufnr)
          local gitsigns = require('gitsigns')

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then
              vim.cmd.normal({ ']c', bang = true })
            else
              gitsigns.nav_hunk('next')
            end
          end, { desc = 'Jump to next [c]hange' })

          map('n', '[c', function()
            if vim.wo.diff then
              vim.cmd.normal({ '[c', bang = true })
            else
              gitsigns.nav_hunk('prev')
            end
          end, { desc = 'Jump to previous [c]hange' })

          -- Actions
          map('n', '<leader>ghs', gitsigns.stage_hunk, { desc = '[g]it [h]unk [s]tage' })
          map('n', '<leader>ghr', gitsigns.reset_hunk, { desc = '[g]it [h]unk [r]eset' })

          map('v', '<leader>ghs', function()
            gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
          end, { desc = '[g]it [h]unk [s]tage' })

          map('v', '<leader>ghr', function()
            gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
          end, { desc = '[g]it [h]unk [r]eset' })

          map('n', '<leader>ghS', gitsigns.stage_buffer, { desc = '[g]it [h]unk [S]tage buffer' })
          map('n', '<leader>ghR', gitsigns.reset_buffer, { desc = '[g]it [h]unk [R]eset buffer' })
          map('n', '<leader>ghp', gitsigns.preview_hunk, { desc = '[g]it [h]unk [p]review' })
          map('n', '<leader>ghi', gitsigns.preview_hunk_inline, { desc = '[g]it [h]unk preview [i]nline' })

          map('n', '<leader>ghb', function()
            gitsigns.blame_line({ full = true })
          end, { desc = '[g]it [h]unk [b]lame line' })

          map('n', '<leader>ghd', gitsigns.diffthis, { desc = '[g]it [h]unk [d]iff against index' })

          map('n', '<leader>ghq', gitsigns.setqflist, { desc = '[g]it [h]unk [q]uickfix list' })

          -- Toggles
          map('n', '<leader>gb', gitsigns.toggle_current_line_blame, { desc = '[g]it [b]lame toggle' })
          map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = '[T]oggle [w]ord diff' })

          -- Text object
          map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { desc = 'GitSigns select hunk' })
        end,
      })
    end,
  },
  {
    'sindrets/diffview.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles' },
    opts = {},
    keys = {
      { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = '[g]it [d]iff view' },
      { '<leader>gl', '<cmd>DiffviewFileHistory<cr>', desc = '[g]it [l]og/history' },
      { '<leader>gc', '<cmd>DiffviewClose<cr>', desc = '[g]it diff [c]lose' },
    },
  },
}
