require 'bootstrap'
require 'ide'
require 'config'
require 'plugin_manager'

ide.formattings = {
  'stylua'
}

vim.cmd('colorscheme ' .. ide.colorscheme)
