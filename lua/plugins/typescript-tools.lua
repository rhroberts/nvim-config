return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  keys = {
    { '<leader>yo', '<cmd>TSToolsOrganizeImports<cr>', desc = 'T[y]peScript: [O]rganize imports' },
    { '<leader>yi', '<cmd>TSToolsAddMissingImports<cr>', desc = 'T[y]peScript: Add missing [i]mports' },
    { '<leader>yf', '<cmd>TSToolsFixAll<cr>', desc = 'T[y]peScript: [F]ix all' },
    { '<leader>ys', '<cmd>TSToolsGoToSourceDefinition<cr>', desc = 'T[y]peScript: Go to [s]ource definition' },
    { '<leader>yr', '<cmd>TSToolsRenameFile<cr>', desc = 'T[y]peScript: [R]ename file' },
    { '<leader>yu', '<cmd>TSToolsRemoveUnused<cr>', desc = 'T[y]peScript: Remove [u]nused' },
  },
  opts = {
    settings = {
      -- Spawn additional tsserver instance to calculate diagnostics on it
      separate_diagnostic_server = true,
      -- Determines when the client asks the server about diagnostic information
      publish_diagnostic_on = 'insert_leave',
      -- tsserver file watching strategy
      tsserver_file_preferences = {
        includeInlayParameterNameHints = 'all',
        includeCompletionsForModuleExports = true,
        quotePreference = 'auto',
      },
    },
  },
}
