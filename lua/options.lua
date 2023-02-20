-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

local function set_background()
  local hour = tonumber(os.date '%H')

  if hour >= 6 and hour < 18 then
    vim.o.background = 'light'
  else
    vim.o.background = 'dark'
  end
end

set_background()
