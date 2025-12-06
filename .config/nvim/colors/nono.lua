-- ~/.config/nvim/colors/my_palette.lua

local colors = {
  bg       = "#CAD2C5", -- Blackberry Cream
  fg       = "#4B2142", -- Ash Grey
  lavender = "#816E94",
  plum     = "#74226C",
  blue     = "#118AB2",
}

vim.cmd("hi clear")

if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "my_palette"

-- Helper
local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Basis
hi("Normal",      { fg = colors.fg, bg = colors.bg })
hi("NormalFloat", { fg = colors.fg, bg = colors.bg })
hi("CursorLine",  { bg = "#3a1934" })
hi("CursorColumn",{ bg = "#3a1934" })
hi("LineNr",      { fg = colors.lavender, bg = colors.bg })
hi("CursorLineNr",{ fg = colors.blue, bold = true })
hi("SignColumn",  { bg = colors.bg })

-- Syntax
hi("Comment",  { fg = colors.lavender, italic = true })
hi("Keyword",  { fg = colors.plum, bold = true })
hi("Statement",{ fg = colors.plum })
hi("Identifier",{ fg = colors.blue })
hi("Function", { fg = colors.blue, bold = true })
hi("Type",     { fg = colors.fg })
hi("Constant", { fg = colors.blue })
hi("String",   { fg = colors.lavender })
hi("Number",   { fg = colors.blue })
hi("Boolean",  { fg = colors.blue })

-- UI
hi("StatusLine",   { fg = colors.fg, bg = "#3a1934" })
hi("StatusLineNC", { fg = colors.lavender, bg = "#34152e" })
hi("VertSplit",    { fg = "#34152e", bg = colors.bg })
hi("Pmenu",        { fg = colors.fg, bg = "#34152e" })
hi("PmenuSel",     { fg = colors.bg, bg = colors.blue, bold = true })
hi("PmenuSbar",    { bg = "#34152e" })
hi("PmenuThumb",   { bg = colors.blue })

hi("Visual",       { bg = "#74226C" })
hi("Search",       { fg = colors.bg, bg = colors.blue, bold = true })
hi("IncSearch",    { fg = colors.bg, bg = colors.plum, bold = true })

hi("Todo",         { fg = colors.blue, bg = colors.bg, bold = true })
hi("Error",        { fg = "#ff6b6b", bold = true })
hi("WarningMsg",   { fg = "#ffb86c", bold = true })

-- Diffs
hi("DiffAdd",      { fg = colors.fg, bg = "#355d3b" })
hi("DiffChange",   { fg = colors.fg, bg = "#3a3f5a" })
hi("DiffDelete",   { fg = colors.fg, bg = "#5a2f3a" })
hi("DiffText",     { fg = colors.fg, bg = colors.plum, bold = true })

