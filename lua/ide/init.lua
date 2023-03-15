local Ide = {}

function Ide:new(t)
  setmetatable(t, self)
  self.__index = self

  return t
end

_G.ide = Ide:new({
  colorscheme = "caelum",
  plugins = {},
  maps = {},
  servers = {},
  formattings = {},
  completions = {},
  code_actions = {},
  hovers = {}
})
