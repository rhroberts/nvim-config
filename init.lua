-- Leader key must be set before plugins load
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Enable Nerd Font support
vim.g.have_nerd_font = true

-- Set Python provider
vim.g.python3_host_prog = '/Users/rusty/.local/bin/pynvim-python'

-- Disable unused providers
vim.g.loaded_perl_provider = 0

-- Load configuration modules
require('config.options')
require('config.keymaps')
require('config.autocommands')
require('config.auto-refresh')
require('config.lazy')
