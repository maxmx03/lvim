lvim.plugins = {
  {
    'phaazon/hop.nvim',
    event = 'BufRead',
    config = function()
      local h = require 'hop'

      h.setup()

      local opts = { noremap = true, silent = true }

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
    end,
  },
  {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    opts = {
      load = {
        ['core.defaults'] = {}, -- Loads default behaviour
        ['core.norg.concealer'] = {}, -- Adds pretty icons to your documents
        ['core.norg.dirman'] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = '~/notes',
            },
          },
        },
      },
    },
    dependencies = { { 'nvim-lua/plenary.nvim' } },
  },
  {
    'maxmx03/solarized.nvim',
    config = function()
      local solarized = require 'solarized'

      solarized:setup {
        config = {
          theme = 'vscode',
        },
      }
    end,
  },
}
