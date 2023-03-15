ide.maps = {
  e = { '<cmd>NvimTreeToggle<cr>', 'Open File Tree' },
  q = { '<cmd>quitall<cr>', 'Quit' },
  f = { '<cmd>Telescope find_files<cr>', 'Find Files' },
  l = {
    name = 'Lsp',
    g = { '<cmd>Lspsaga goto_definition<CR>', 'Go to definition' },
    p = { '<cmd>Lspsaga peek_definition<CR>', 'Peek definition' },
    a = { '<cmd>Lspsaga code_action<CR>', 'Code action' },
    f = { '<cmd>Lspsaga lsp_finder<CR>', 'Finder' },
    h = { '<cmd>Lspsaga hover_doc<CR>', 'Hover Doc' },
  },
  n = {
    name = 'Neorg',
    w = { '<cmd>Neorg workspace notes<cr>', 'Open Neorg Workspace' },
    r = { '<cmd>Neorg return<cr>', 'Return Neorg' },
    n = { '<cmd>Neorg toggle-concealer<cr>', 'Toggle Concealer' },
  },
}

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '+', '<C-a>', opts)
vim.keymap.set('n', '-', '<C-x>', opts)
vim.keymap.set('n', 'ss', ':split<cr>', opts)
vim.keymap.set('n', 'sv', ':vsplit<cr>', opts)
vim.keymap.set('n', '<F7>', ':TSPlaygroundToggle<cr>', opts)
vim.keymap.set('n', '<F8>', ':TSHighlightCapturesUnderCursor<cr>', opts)
vim.keymap.set('n', 'f', ':HopWord<cr>', opts)
vim.keymap.set('n', 's', ':HopPattern<cr>', opts)
