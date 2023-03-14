local success, lazy = pcall(require, 'lazy')

if not success then
  return
end

lazy.setup(ide.plugins)
