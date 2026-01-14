return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        -- Install parsers
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

        -- Automatically install missing parsers when entering buffer
        auto_install = true,

        highlight = {
          enable = true,
        },
      })

      -- Enable treesitter highlighting and indentation (built into Neovim)
      vim.treesitter.language.register('bash', 'sh')
    end,
  },
}
