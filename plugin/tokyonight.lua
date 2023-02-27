local tokyonight = require 'tokyonight'

tokyonight.setup {
  on_highlights = function(hl)
    hl['@neorg.links.file'] = { link = '@text.reference' }
  end,
}
