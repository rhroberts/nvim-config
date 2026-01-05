return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      -- Install parsers
      local parsers = {
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
        'sql',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'xml',
        'yaml',
        'zig',
      }
      require('nvim-treesitter').install(parsers)

      -- Enable treesitter highlighting and indentation (built into Neovim)
      vim.treesitter.language.register('bash', 'sh')
    end,
  },
}
