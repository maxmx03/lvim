local masonconfig = require 'mason-lspconfig'

masonconfig.setup {
  automatic_installation = true,
}

local mason = require 'mason'

mason.setup {}
