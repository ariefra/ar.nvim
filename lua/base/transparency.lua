if vim.bo.filetype == 'lazy' then return {} end

local M = {
  "folke/lazy.nvim",
  lazy = true,
}

function M.config()
  M.toggle()
end

function M.toggle()
  local normal_hl = vim.api.nvim_get_hl_by_name("Normal", true)
  if normal_hl.background == nil then
    if vim.g.colors_name then
      vim.cmd("colorscheme " .. vim.g.colors_name)
    end
  else
    local hls = {
      "Normal",
      "NormalFloat",
      "EndOfBuffer",
      "FloatBorder",
      "WinSeparator",
      "ColorColumn",
      "CursorLine",
      "CursorLineNr",
      "LineNr",
      "FoldColumn",
      "Folded",
      "SignColumn",
      "StatusLine",
      "StatusLineNC",
      "TabLineFill",
    }
    for _, hl in ipairs(hls) do
      vim.api.nvim_set_hl(0, hl, { bg = "NONE" })
    end
  end
end

return M