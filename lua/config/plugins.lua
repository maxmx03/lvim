ide.plugins = {
  {
    'maxmx03/caelum',
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  {
    'folke/which-key.nvim',
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'folke/neodev.nvim',
    },
  },
  {
    'nvim-treesitter/nvim-treesitter'
  },
  {
    'windwp/nvim-ts-autotag',
  },
  {
    'windwp/nvim-autopairs',
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
    }
  },
  {
    'jose-elias-alvarez/null-ls.nvim'
  },
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    opts = {
      load = {
        ['core.defaults'] = {},
        ['core.norg.concealer'] = {},
        ['core.norg.dirman'] = {
          config = {
            workspaces = {
              notes = '~/notes',
            },
          },
        },
      },
    },
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'nvim-treesitter/playground',
  },
  {
    'glepnir/lspsaga.nvim',
  },
  {
    'norcalli/nvim-colorizer.lua',
  },
  {
    'phaazon/hop.nvim',
    event = 'BufRead',
  },
  {
    'glepnir/galaxyline.nvim'
  }
}
