-- Tab Settings
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Leader
vim.g.mapleader = " "

-- Windows nagivation
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", {})
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", {})
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", {})
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", {})

-- Windows resize with arrows
vim.keymap.set('n', '<C-Up>',    ':resize -2<CR>',          { silent = true })
vim.keymap.set('n', '<C-Down>',  ':resize +2<CR>',          { silent = true })
vim.keymap.set('n', '<C-Left>',  ':vertical resize -2<CR>', { silent = true })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { silent = true })

-- Basic settings
vim.opt.number = true                              -- Line numbers
vim.opt.relativenumber = true                      -- Relative line numbers
vim.opt.cursorline = true                          -- Highlight current line
vim.opt.wrap = false                               -- Don't wrap lines
vim.opt.scrolloff = 10                             -- Keep 10 lines above/below cursor 
vim.opt.sidescrolloff = 8                          -- Keep 8 columns left/right of cursor
vim.opt.clipboard:append("unnamedplus")            -- Use system clipboard

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.highlight.on_yank()
  end,
})

--------------------------------
-- Filetype Specific Settings --
--------------------------------

-- lua, python
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "lua", "python" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

-- c, cpp
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "c", "cpp" },
  callback = function()
    vim.opt_local.tabstop = 8
    vim.opt_local.softtabstop = 8
    vim.opt_local.shiftwidth = 8
    vim.opt_local.expandtab = false

    vim.opt_local.cindent = true
    vim.opt_local.cinoptions = ":0,t0,(0,w1,m1"

    vim.opt_local.colorcolumn = "81"
  end,
})

-- js, ts, json, html, css
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "javascript", "typescript", "json", "html", "css" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})
