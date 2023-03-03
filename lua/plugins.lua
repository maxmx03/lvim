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
    'NTBBloodbath/doom-one.nvim',
    config = function()
      vim.g.doom_one_plugin_neorg = true
      vim.g.doom_one_plugin_barbar = false
      vim.g.doom_one_plugin_telescope = true
      vim.g.doom_one_plugin_neogit = true
      vim.g.doom_one_plugin_nvim_tree = true
      vim.g.doom_one_plugin_dashboard = true
      vim.g.doom_one_plugin_startify = false
      vim.g.doom_one_plugin_whichkey = true
      vim.g.doom_one_plugin_indent_blankline = true
      vim.g.doom_one_plugin_vim_illuminate = true
      vim.g.doom_one_plugin_lspsaga = true
    end,
  },
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      local dashboard = require 'dashboard'
      local colors = {
        header = '#586268',
        center = '#51afef',
        shortcut = '#a9a1e1',
        footer = '#586268',
      }

      dashboard.setup {
        theme = 'doom',
        config = {
          header = {
            '                                                                              ',
            '=================     ===============     ===============   ========  ========',
            '\\\\ . . . . . . .\\\\   //. . . . . . .\\\\   //. . . . . . .\\\\  \\\\. . .\\\\// . . //',
            '||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||',
            '|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||',
            '||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||',
            '|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||',
            "||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||",
            '|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||',
            "||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||",
            "||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||",
            "||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||",
            "||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||",
            "||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||",
            "||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   ||",
            "||   .=='    _-'          `-__\\._-'         `-_./__-'         `' |. /|  |   ||",
            "||.=='    _-'                                                     `' |  /==.||",
            "=='    _-'                        N E O V I M                         \\/   `==",
            "\\   _-'                                                                `-_   /",
            " `''                                                                      ``'  ",
            '                                                                               ',
            '                                                                               ',
            '                                                                               ',
          },
          center = {
            {
              icon = lvim.icons.ui.FindFile .. ' ',
              desc = 'Find File           ',
              key = 'f',
              action = 'Telescope find_files',
            },
            {
              icon = lvim.icons.ui.NewFile .. ' ',
              desc = 'New File',
              key = 'n',
              action = 'ene!',
            },
            {
              icon = lvim.icons.ui.Project .. ' ',
              desc = 'Projects',
              key = 'p',
              action = 'Telescope projects',
            },
            {
              icon = lvim.icons.ui.History .. ' ',
              desc = 'Recent files',
              key = 'r',
              action = 'Telescope oldfiles',
            },
            {
              icon = lvim.icons.ui.FindText .. ' ',
              desc = 'Recent Text',
              key = 't',
              action = 'Telescope live_grep',
            },
          },
          footer = { '', 'Doom Nvim loaded' },
        },
      }

      vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = colors.header })
      vim.api.nvim_set_hl(0, 'DashboardDesc', { fg = colors.center })
      vim.api.nvim_set_hl(0, 'DashboardIcon', { fg = colors.center })
      vim.api.nvim_set_hl(0, 'DashboardKey', { fg = colors.shortcut })
      vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = colors.footer })
      vim.api.nvim_set_hl(0, 'NvimTreeFolderIcon', { fg = '#51afef' })
    end,
  },
}
