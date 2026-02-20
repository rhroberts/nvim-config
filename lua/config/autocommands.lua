-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Equalize splits while preserving fixed-width sidebars
local sidebar_filetypes = { ['neo-tree'] = 40, ['Outline'] = 40 }

local function equalize_splits()
  local wins = vim.api.nvim_tabpage_list_wins(0)
  local sidebars = {}
  local editors = {}

  for _, win in ipairs(wins) do
    if vim.api.nvim_win_is_valid(win) then
      local cfg = vim.api.nvim_win_get_config(win)
      if not cfg.relative or cfg.relative == '' then
        local buf = vim.api.nvim_win_get_buf(win)
        local ft = vim.bo[buf].filetype
        if sidebar_filetypes[ft] then
          table.insert(sidebars, { win = win, width = sidebar_filetypes[ft] })
        else
          table.insert(editors, win)
        end
      end
    end
  end

  if #sidebars == 0 then
    vim.cmd('wincmd =')
    return
  end

  -- Set sidebar widths
  local sidebar_total = 0
  for _, s in ipairs(sidebars) do
    vim.api.nvim_win_set_width(s.win, s.width)
    sidebar_total = sidebar_total + s.width
  end

  -- Equalize editor windows in the remaining space
  if #editors > 1 then
    local seps = #sidebars + #editors - 1
    local available = vim.o.columns - sidebar_total - seps
    local per_editor = math.floor(available / #editors)
    for i = 1, #editors - 1 do
      vim.api.nvim_win_set_width(editors[i], per_editor)
    end
  end
end

-- Equalize splits when terminal window is resized
vim.api.nvim_create_autocmd('VimResized', {
  desc = 'Equalize splits when window is resized',
  group = vim.api.nvim_create_augroup('equalize-splits', { clear = true }),
  callback = equalize_splits,
})

-- User commands for format control
vim.api.nvim_create_user_command('FormatDisable', function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = 'Disable autoformat-on-save',
  bang = true,
})

vim.api.nvim_create_user_command('FormatEnable', function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = 'Re-enable autoformat-on-save',
})

vim.api.nvim_create_user_command('IDE', function(args)
  vim.cmd('Neotree show')
  vim.cmd('OutlineOpen')
  vim.cmd('wincmd h') -- Move from outline to editor
  if not args.bang then
    vim.cmd('vsplit')
  end
  equalize_splits()
end, {
  desc = 'Open IDE layout: Neo-tree + Outline (+ vertical split)',
  bang = true,
})

vim.keymap.set('n', '<leader>i', '<cmd>IDE<CR>', { desc = '[i]DE layout with split' })
vim.keymap.set('n', '<leader>I', '<cmd>IDE!<CR>', { desc = '[I]DE layout without split' })
