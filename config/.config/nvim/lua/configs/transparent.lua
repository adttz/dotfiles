-- ==============================
-- configs/transparent.lua
-- Force transparency for all themes
-- ==============================

local M = {}

function M.enable()
  -- groups to clear backgrounds for
  local groups = {
    "Normal", "NormalNC", "NormalFloat",
    "SignColumn", "VertSplit", "StatusLine", "StatusLineNC",
    "LineNr", "EndOfBuffer", "CursorLineNr", "WinSeparator",
  }

  -- clear bg for each
  for _, group in ipairs(groups) do
    vim.cmd("highlight " .. group .. " guibg=none ctermbg=none")
  end
end

-- apply once on startup
M.enable()

-- re-apply after every colorscheme load
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    M.enable()
  end,
})

return M
