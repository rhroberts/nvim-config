vim.opt.autoread = true

-- Simple timer-based auto-reload
local timer = vim.uv.new_timer()
if timer then
  timer:start(
    1000,
    2000,
    vim.schedule_wrap(function()
      vim.cmd('silent! checktime')
    end)
  )
end

-- Refresh gitsigns when focus is regained or files change
-- NOTE: Disabled - was causing gutters to blink on cursor movement
-- vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold' }, {
--   callback = function()
--     local gs = package.loaded['gitsigns']
--     if gs then
--       vim.schedule(function()
--         vim.cmd('silent! Gitsigns refresh')
--       end)
--     end
--   end,
-- })
