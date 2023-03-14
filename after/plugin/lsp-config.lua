local lsp = require 'lspconfig'

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
  }
})

local on_attach = function(_, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', '<C-f>', vim.lsp.buf.format, bufopts)

  vim.api.nvim_create_autocmd({ 'TextChanged', 'InsertLeave' }, {
    buffer = bufnr,
    command = 'update',
  })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, server in ipairs(ide.servers) do
  if server == 'lua_ls' then
    lsp[server].setup {
      settings = {
        lua = {
          completion = {
            callSnippet = "Replace"

          }
        }
      },
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150
      },
      capabilities = capabilities
    }
  else
    lsp[server].setup {
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150
      },
      capabilities = capabilities
    }
  end
end
