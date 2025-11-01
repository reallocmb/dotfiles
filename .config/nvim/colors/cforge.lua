-- cforge.lua – ein schlichtes, klares Colorscheme für C und verwandte Sprachen
vim.cmd("highlight clear")
vim.o.background = "dark"
vim.g.colors_name = "cforge"

local c = {
  bg      = "#0f1115",
  fg      = "#aaaaaa",
  comment = "#ffffff",
  red     = "#882266",
  green   = "#00ff00",
  yellow  = "#ffffff",
  blue    = "#ffffff",
  magenta = "#ffffff",
  cyan    = "#ffffff",
  orange  = "#ffffff",
  violett = "#a277ff",
  violett2 = "#9c27b0",
  gold = "#b8860b",
}

-- Standardgruppen
vim.api.nvim_set_hl(0, "Normal",       { fg = c.fg, bg = c.bg })
vim.api.nvim_set_hl(0, "String",       { fg = c.red })
vim.api.nvim_set_hl(0, "Number",       { fg = c.cyan })
vim.api.nvim_set_hl(0, "Keyword",      { fg = c.magenta, bold = true })
vim.api.nvim_set_hl(0, "Function",     { fg = c.fg, bold = false })
vim.api.nvim_set_hl(0, "Type",         { fg = c.violett, bold = true })
vim.api.nvim_set_hl(0, "Constant",     { fg = c.cyan })
vim.api.nvim_set_hl(0, "Identifier",   { fg = c.fg })
vim.api.nvim_set_hl(0, "Operator",     { fg = c.cyan })
vim.api.nvim_set_hl(0, "Error",        { fg = c.red, bg = c.bg, bold = true })
vim.api.nvim_set_hl(0, "Todo",         { fg = c.yellow, bg = c.bg, bold = true })
vim.api.nvim_set_hl(0, "Statement",    { fg = c.violett, bg = c.bg, bold = true })
vim.api.nvim_set_hl(0, "Constant",{ fg = c.violett2, bg = c.bg, bold = false })
vim.api.nvim_set_hl(0, "Comment",{ fg = c.gold, bg = c.bg, bold = false })


-- Treesitter-Gruppen (für moderne Syntax)
vim.api.nvim_set_hl(0, "@type",              { link = "Type" })
vim.api.nvim_set_hl(0, "@function",          { link = "Function" })
vim.api.nvim_set_hl(0, "@keyword",           { link = "Keyword" })
vim.api.nvim_set_hl(0, "@variable",          { fg = c.fg })
vim.api.nvim_set_hl(0, "@constant",          { link = "Constant" })
vim.api.nvim_set_hl(0, "@string",            { link = "String" })
vim.api.nvim_set_hl(0, "@number",            { link = "Number" })
vim.api.nvim_set_hl(0, "@operator",          { link = "Operator" })
vim.api.nvim_set_hl(0, "@comment",           { link = "Comment" })
vim.api.nvim_set_hl(0, "@preproc",           { fg = c.red, bold = true })
vim.api.nvim_set_hl(0, "@macro",             { fg = c.yellow, bold = true })

-- Cursor, LineNr, StatusLine etc.
vim.api.nvim_set_hl(0, "CursorLine",  { bg = "#2c2e30" })
vim.api.nvim_set_hl(0, "CursorLineNr",{ fg = c.yellow, bold = true })
vim.api.nvim_set_hl(0, "LineNr",      { fg = "#555555" })
vim.api.nvim_set_hl(0, "StatusLine",  { fg = c.fg, bg = "#2c2e30" })
vim.api.nvim_set_hl(0, "Visual",      { bg = "#3c4042" })

