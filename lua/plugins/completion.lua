return {
  {
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
      -- Snippet Engine
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          if vim.fn.has('win32') == 1 or vim.fn.executable('make') == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
      },
      'folke/lazydev.nvim',
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      keymap = {
        -- 'default' for mappings similar to built-in completions
        --   <c-y> to accept the completion
        --   <c-n>/<c-p>: select next/previous item
        --   <c-space>: open menu or docs
        --   <c-e>: hide menu
        --   <tab>/<s-tab>: move in snippet
        preset = 'default',
      },

      appearance = {
        nerd_font_variant = 'mono',
      },

      completion = {
        menu = {
          border = 'rounded',
          winhighlight = 'Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = {
            border = 'rounded',
            winhighlight = 'Normal:Pmenu,FloatBorder:FloatBorder',
          },
        },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        },
      },

      snippets = { preset = 'luasnip' },

      fuzzy = { implementation = 'lua' },

      signature = { enabled = true },
    },
  },
}
