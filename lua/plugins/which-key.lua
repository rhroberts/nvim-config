return {
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      icons = {
        mappings = vim.g.have_nerd_font,
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },
      spec = {
        {
          '<leader>c',
          group = '[c]ode',
          icon = { icon = '󰅴', color = 'cyan' },
          mode = { 'n', 'x' },
        },
        {
          '<leader>d',
          group = '[d]ebug',
          icon = { icon = '󰃤', color = 'red' },
        },
        {
          '<leader>r',
          group = '[r]ename',
          icon = { icon = '󰤌', color = 'orange' },
        },
        {
          '<leader>s',
          group = '[s]earch',
          icon = { icon = '󰍉', color = 'green' },
        },
        {
          '<leader>w',
          group = '[w]orkspace',
          icon = { icon = '󰉋', color = 'purple' },
        },
        {
          '<leader>t',
          group = '[t]oggle/Terminal',
          icon = { icon = '󰆍', color = 'red' },
        },
        {
          '<leader>gh',
          group = '[g]it [h]unk',
          icon = { icon = '󰊢', color = 'orange' },
          mode = { 'n', 'v' },
        },
        {
          '<leader>b',
          group = '[b]uffer',
          icon = { icon = '󰓩', color = 'blue' },
        },
        {
          '<leader>x',
          group = 'Trouble [x]',
          icon = { icon = '󰀪', color = 'yellow' },
        },
        { '<leader>g', group = 'Git [g]', icon = { icon = '󰊢', color = 'green' } },
        {
          '<leader>p',
          group = '[p]eek (markdown viewer)',
          icon = { icon = '󰽛', color = 'blue' },
        },
        {
          '<leader>ghs',
          icon = { icon = '󰐕', color = 'green' },
          desc = '[g]it [h]unk [s]tage',
        },
        {
          '<leader>ghr',
          icon = { icon = '󰜉', color = 'red' },
          desc = '[g]it [h]unk [r]eset',
        },
        {
          '<leader>ghS',
          icon = { icon = '󰐕', color = 'green' },
          desc = '[g]it [h]unk [S]tage buffer',
        },
        {
          '<leader>ghR',
          icon = { icon = '󰜉', color = 'red' },
          desc = '[g]it [h]unk [R]eset buffer',
        },
        {
          '<leader>ghp',
          icon = { icon = '󰋊', color = 'blue' },
          desc = '[g]it [h]unk [p]review',
        },
        {
          '<leader>ghi',
          icon = { icon = '󰋊', color = 'cyan' },
          desc = '[g]it [h]unk preview [i]nline',
        },
        {
          '<leader>ghb',
          icon = { icon = '󰕘', color = 'yellow' },
          desc = '[g]it [h]unk [b]lame line',
        },
        {
          '<leader>ghd',
          icon = { icon = '󰦒', color = 'purple' },
          desc = '[g]it [h]unk [d]iff against index',
        },
        {
          '<leader>ghq',
          icon = { icon = '󰁨', color = 'orange' },
          desc = '[g]it [h]unk [q]uickfix list',
        },
        { '<leader><leader>', icon = '󰓩' }, -- see telescope config
        { '<leader>/', icon = { icon = '󰍉', color = 'green' } }, -- see telescope config
        {
          '<leader>e',
          function()
            vim.cmd('Neotree toggle')
            vim.cmd('Outline')
            vim.cmd('wincmd h') -- Go left from outline (to editor window)
          end,
          desc = 'Toggle [E]xplorer and Outline',
        },
        {
          '<leader>v',
          group = '[v]irtual environment',
          icon = { icon = '󰌠', color = 'yellow' },
        },
        {
          '<leader>a',
          group = '[a]rduino',
          icon = { icon = '󱙤', color = 'cyan' },
        },
        {
          '<leader>n',
          group = '[n]otifications',
          icon = { icon = '󰂚', color = 'yellow' },
        },
      },
    },
  },
}
