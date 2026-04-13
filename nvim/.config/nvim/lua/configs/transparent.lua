-- ==============================
-- configs/transparent.lua
-- ==============================

local function set_active_tab_bg()
  local bg = "#3c3836" -- Adjust these colours for tab bg
  local fg = "#ebdbb2"
  local groups = { "TbBufOn", "TbBufOnClose", "TbBufOnModified" }
  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = bg, fg = fg, bold = true })
  end
end

-- apply on every event that might reset highlights
vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme", "BufEnter", "UIEnter" }, {
  callback = function()
    vim.defer_fn(set_active_tab_bg, 50)
  end,
})

return {}
