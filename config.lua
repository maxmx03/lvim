require 'autocmd'
require 'functions'
require 'formatters'
require 'options'
require 'plugins'
require 'keys'

lvim.log.level = 'info'
lvim.format_on_save = {
  enabled = false,
  pattern = '*.*',
  timeout = 1000,
}
lvim.colorscheme = 'solarized'
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = 'dashboard'
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = 'left'
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.treesitter.auto_install = true
lvim.builtin.indentlines.active = false
lvim.builtin.telescope.defaults.file_ignore_patterns = {
  '.git/',
  'target/',
  'docs/',
  'vendor/*',
  '%.lock',
  '__pycache__/*',
  '%.sqlite3',
  '%.ipynb',
  'node_modules/*',
  -- "%.jpg",
  -- "%.jpeg",
  -- "%.png",
  '%.svg',
  '%.otf',
  '%.ttf',
  '%.webp',
  '.dart_tool/',
  '.github/',
  '.gradle/',
  '.idea/',
  '.settings/',
  '.vscode/',
  '__pycache__/',
  'build/',
  'env/',
  'gradle/',
  'node_modules/',
  '%.pdb',
  '%.dll',
  '%.class',
  '%.exe',
  '%.cache',
  '%.ico',
  '%.pdf',
  '%.dylib',
  '%.jar',
  '%.docx',
  '%.met',
  'smalljre_*/*',
  '.vale/',
  '%.burp',
  '%.mp4',
  '%.mkv',
  '%.rar',
  '%.zip',
  '%.7z',
  '%.tar',
  '%.bz2',
  '%.epub',
  '%.flac',
  '%.tar.gz',
}
lvim.lsp.on_attach_callback = function(_, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', '<C-f>', vim.lsp.buf.format, bufopts)

  vim.api.nvim_create_autocmd({ 'InsertLeave', 'TextChanged' }, {
    buffer = bufnr,
    command = 'update',
  })
end
