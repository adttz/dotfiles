require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
  map("i", "jk", "<ESC>")

-- VSCode-style indentation with Tab/Shift-Tab
-- map("n", "<Tab>", ">>", { desc = "Indent line" })
-- map("n", "<S-Tab>", "<<", { desc = "Outdent line" })
map("v", "<Tab>", ">gv", { desc = "Indent selection and stay visual" })
map("v", "<S-Tab>", "<gv", { desc = "Outdent selection and stay visual" })

-- vim-tmux-navigator mappings for seamless navigation
-- These work both within Neovim splits and between Neovim and tmux panes
--- for nvchad users, this is in the ~/.config/nvim/lua/mappings.lua file

local unmap = vim.keymap.del

--- This fixes an issue with the vim-tmux-navigator + nvchad in which the base nvchad
--- mapping were conflicting with vim-tmux-navigator ones.
unmap("n", "<c-h>")
unmap("n", "<c-j>")
unmap("n", "<c-k>")
unmap("n", "<c-l>")
map("n", "<c-h>", "<cmd>:TmuxNavigateLeft<cr>")
map("n", "<c-j>", "<cmd>:TmuxNavigateDown<cr>")
map("n", "<c-k>", "<cmd>:TmuxNavigateUp<cr>")
map("n", "<c-l>", "<cmd>:TmuxNavigateRight<cr>")
map("n", "<c-\\>", "<cmd>:TmuxNavigatePrevious<cr>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
