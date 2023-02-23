lvim.plugins = {
  {
    'maxmx03/solarized.nvim',
    branch = 'dev',
    config = function()
      local solarized = require 'solarized'

      solarized.setup {
        theme = 'vscode',
        transparent = false,
      }
    end,
  },
  {
    'phaazon/hop.nvim',
    event = 'BufRead',
    config = function()
      local h = require 'hop'

      h.setup()

      local opts = { noremap = true, silent = true }

      vim.keymap.set('n', 's', ':HopPattern<cr>', opts)
      vim.keymap.set('n', 'f', ':HopWord<cr>', opts)
    end,
  },
  {
    'ray-x/lsp_signature.nvim',
    config = function()
      local signature = require 'lsp_signature'

      signature.setup {
        hint_prefix = '🤔️ ',
        floating_window = false,
      }
    end,
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      local colorizer = require 'colorizer'

      colorizer.setup {
        'css',
        'conf',
        'html',
        'javascript',
        'javascriptreact',
        'json',
        'lua',
        'toml',
        'typescript',
        'typescriptreact',
        'scss',
        'svelte',
        'vue',
        'yaml',
        'vim',
      }
    end,
  },
  {
    'glepnir/lspsaga.nvim',
    branch = 'main',
    config = function()
      local saga = require 'lspsaga'

      saga.setup {}
    end,
  },
  {
    'stevearc/dressing.nvim',
  },
  {
    'nvim-treesitter/playground',
    config = function()
      local opts = { noremap = true, silent = true }

      vim.keymap.set('n', '<F7>', ':TSPlaygroundToggle<cr>', opts)
      vim.keymap.set('n', '<F8>', ':TSHighlightCapturesUnderCursor<cr>', opts)
    end,
  },
  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && yarn',
    config = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      local autotag = require 'nvim-ts-autotag'

      autotag.setup()
    end
  },
}
