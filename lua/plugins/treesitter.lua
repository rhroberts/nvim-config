return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    main = 'nvim-treesitter',
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'cmake',
        'cpp',
        'css',
        'devicetree',
        'diff',
        'dockerfile',
        'gitcommit',
        'gitignore',
        'graphql',
        'html',
        'javascript',
        'json',
        'lua',
        'luadoc',
        'make',
        'markdown',
        'markdown_inline',
        'python',
        'query',
        'regex',
        'ruby',
        'rust',
        'scss',
        'svelte',
        'sql',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'xml',
        'yaml',
        'zig',
      },
    },
    config = function(_, opts)
      require('nvim-treesitter').setup(opts)
      vim.treesitter.language.register('bash', 'sh')

      -- Enable treesitter highlighting for any filetype that has a parser,
      -- covering languages not handled by Neovim's built-in ftplugins.
      vim.api.nvim_create_autocmd('FileType', {
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },
}
