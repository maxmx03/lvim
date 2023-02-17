lvim.plugins = {
  {
    'maxmx03/solarized.nvim',
    config = function()
      local s = require 'solarized'

      s.setup {
        theme = 'neovim',
        transparent = true,
      }

      local c = s.colors

      lvim.builtin.bufferline.options = {
        mode = 'tabs',
        separator_style = 'slant',
        always_show_bufferline = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true,
      }

      lvim.builtin.bufferline.highlights = {
        separator = {
          fg = c.bg_alt,
          bg = c.bg,
        },
        separator_selected = {
          fg = c.bg_alt,
        },
        background = {
          fg = c.fg_invert,
          bg = c.bg,
        },
        buffer_selected = {
          fg = c.bg_invert,
          bold = true,
        },
        fill = {
          bg = c.bg_alt,
        },
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
}
