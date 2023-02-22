local formatters = require 'lvim.lsp.null-ls.formatters'

formatters.setup {
  { exe = 'stylua', filetypes = { 'lua' } },
  {
    exe = 'prettier',
    filetypes = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'vue',
      'css',
      'scss',
      'less',
      'html',
      'json',
      'jsonc',
      'yaml',
      'markdown',
      'markdown.mdx',
      'graphql',
      'handlebars',
    },
  },
}
