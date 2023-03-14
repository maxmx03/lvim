local gl = require('galaxyline')

local utils = {}

function utils.is_buffer_empty()
  -- Check whether the current buffer is empty
  return vim.fn.empty(vim.fn.expand('%:t')) == 1
end

function utils.has_width_gt(cols)
  -- Check if the windows width is greater than a given number of columns
  return vim.fn.winwidth(0) / 2 > cols
end

local gls = gl.section
gl.short_line_list = { 'defx', 'packager', 'vista', 'NvimTree' }

local colors = {
  bg = '#1f1e1b',
  fg = '#DCC68D',
  section_bg = '#22211E',
  blue = '#677FA3',
  green = '#7B8F5A',
  purple = '#7B77A0',
  orange = '#E58538',
  red1 = '#de6464',
  red2 = '#D885A3',
  yellow = '#FFCF62',
  gray1 = '#5c6370',
  gray2 = '#2c323d',
  gray3 = '#3e4452',
  darkgrey = '#5c6370',
  grey = '#848586',
  middlegrey = '#E58538'
}

-- Local helper functions
local buffer_not_empty = function() return not utils.is_buffer_empty() end

local checkwidth = function()
  return utils.has_width_gt(40) and buffer_not_empty()
end

local mode_color = function()
  local mode_colors = {
    [110] = colors.blue,
    [105] = colors.green,
    [99] = colors.yellow,
    [116] = colors.blue,
    [118] = colors.purple,
    [22] = colors.yellow,
    [86] = colors.purple,
    [82] = colors.orange,
    [115] = colors.red1,
    [83] = colors.red1
  }

  mode_color = mode_colors[vim.fn.mode():byte()]
  if mode_color ~= nil then
    return mode_color
  else
    return colors.purple
  end
end

local function file_readonly()
  if vim.bo.filetype == 'help' then return '' end
  if vim.bo.readonly == true then return '  ' end
  return ''
end

local function get_current_file_name()
  local file = vim.fn.expand('%:t')
  if vim.fn.empty(file) == 1 then return '' end
  if string.len(file_readonly()) ~= 0 then return file .. file_readonly() end
  if vim.bo.modifiable then
    if vim.bo.modified then return file .. '  ' end
  end
  return file .. ' '
end

-- Left side
gls.left[1] = {
  ViMode = {
    provider = function()
      local aliases = {
        [110] = 'NORMAL',
        [105] = 'INSERT',
        [99] = 'COMMAND',
        [116] = 'TERMINAL',
        [118] = 'VISUAL',
        [22] = 'V-BLOCK',
        [86] = 'V-LINE',
        [82] = 'REPLACE',
        [115] = 'SELECT',
        [83] = 'S-LINE'
      }
      vim.api.nvim_command('hi GalaxyViMode guibg=' .. mode_color())
      alias = aliases[vim.fn.mode():byte()]
      if alias ~= nil then
        return '  ' .. alias .. ' '
      else
        return '  ' .. vim.fn.mode():byte() .. ' '
      end
    end,
    highlight = { colors.bg, colors.bg, 'bold' }
  }
}
gls.left[2] = {
  FileIcon = {
    provider = { function() return '  ' end, 'FileIcon' },
    condition = buffer_not_empty,
    highlight = {
      require('galaxyline.provider_fileinfo').get_file_icon,
      colors.section_bg
    }
  }
}
gls.left[3] = {
  FileName = {
    provider = get_current_file_name,
    condition = buffer_not_empty,
    highlight = { colors.fg, colors.section_bg },
    separator = "",
    separator_highlight = { colors.section_bg, colors.bg }
  }
}
gls.left[9] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = { colors.red1, colors.bg }
  }
}
gls.left[10] = {
  Space = {
    provider = function() return ' ' end,
    highlight = { colors.section_bg, colors.bg }
  }
}
gls.left[11] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = { colors.orange, colors.bg }
  }
}
gls.left[12] = {
  Space = {
    provider = function() return ' ' end,
    highlight = { colors.section_bg, colors.bg }
  }
}
gls.left[13] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = { colors.blue, colors.section_bg },
    separator = ' ',
    separator_highlight = { colors.section_bg, colors.bg }
  }
}

-- Right side
gls.right[1] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = checkwidth,
    icon = '+',
    highlight = { colors.green, colors.bg }
  }
}
gls.right[2] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = checkwidth,
    icon = '~',
    highlight = { colors.orange, colors.bg }
  }
}
gls.right[3] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = checkwidth,
    icon = '-',
    highlight = { colors.red1, colors.bg }
  }
}
gls.right[4] = {
  Space = {
    provider = function() return ' ' end,
    highlight = { colors.section_bg, colors.bg }
  }
}
gls.right[5] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = buffer_not_empty and
        require('galaxyline.provider_vcs').check_git_workspace,
    highlight = { colors.middlegrey, colors.bg }
  }
}
gls.right[6] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = buffer_not_empty,
    highlight = { colors.middlegrey, colors.bg }
  }
}
gls.right[7] = {
  PerCent = {
    provider = 'LinePercent',
    separator = '',
    separator_highlight = { colors.yellow, colors.bg },
    highlight = { colors.gray2, colors.yellow }
  }
}

-- Short status line
gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    highlight = { colors.fg, colors.section_bg },
    separator = ' ',
    separator_highlight = { colors.section_bg, colors.bg }
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider = 'BufferIcon',
    highlight = { colors.yellow, colors.section_bg },
    separator = '',
    separator_highlight = { colors.section_bg, colors.bg }
  }
}

-- Force manual load so that nvim boots with a status line
gl.load_galaxyline()
