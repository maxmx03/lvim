lvim.leader = 'space'
lvim.keys.normal_mode['<C-s>'] = ':w<cr>'
lvim.builtin.which_key.mappings['q'] = { '<cmd>lua smart_quit()<CR>', 'Quit' }
lvim.builtin.which_key.mappings['lg'] = { '<cmd>Lspsaga goto_definition<CR>', 'Go to definition' }
lvim.builtin.which_key.mappings['lp'] = { '<cmd>Lspsaga peek_definition<CR>', 'Peek definition' }
lvim.builtin.which_key.mappings['la'] = { '<cmd>Lspsaga code_action<CR>', 'Code action' }
lvim.builtin.which_key.mappings['lF'] = { '<cmd>Lspsaga lsp_finder<CR>', 'Finder' }
lvim.builtin.which_key.mappings['lh'] = { '<cmd>Lspsaga hover_doc<CR>', 'Hover Doc' }
