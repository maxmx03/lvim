local treesitter = require 'nvim-treesitter.configs'

treesitter.setup {
  auto_install = true,
  ensure_installed = { 'markdown', 'norg', 'regex', 'vim' },
   highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
