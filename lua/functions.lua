function _G.smart_quit()
  local bufnr = vim.api.nvim_get_current_buf()
  local modified = vim.api.nvim_buf_get_option(bufnr, 'modified')

  if modified then
    vim.ui.select({ 'save', 'save quit', 'quit' }, {
      prompt = 'You have unsaved changes.',
      format_item = function(item)
        return "I'd like to " .. item
      end,
    }, function(choice)
      if choice == 'save' then
        vim.cmd 'update'
      elseif choice == 'save quit' then
        vim.cmd 'wq'
      elseif choice == 'quit' then
        vim.cmd 'q!'
      else
        vim.cmd 'update'
      end
    end)
  else
    vim.cmd 'q!'
  end
end
