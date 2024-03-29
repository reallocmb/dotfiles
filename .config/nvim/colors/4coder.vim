" Name:         desert
" Description:  Light background colorscheme.
" Author:       Original author Hans Fugal <hans@fugal.net>
" Maintainer:   Original maintainer Hans Fugal <hans@fugal.net>
" Website:      https://github.com/vim/colorschemes
" License:      Same as Vim
" Last Updated: Fri 02 Sep 2022 09:39:21 MSK

" Generated by Colortemplate v2.2.0

set background=dark

hi clear
let g:colors_name = '4coder'

let s:t_Co = &t_Co

if (has('termguicolors') && &termguicolors) || has('gui_running')
  let g:terminal_ansi_colors = ['#7f7f8c', '#cd5c5c', '#9acd32', '#bdb76b', '#75a0ff', '#eeee00', '#cd853f', '#666666', '#8a7f7f', '#ff0000', '#89fb98', '#f0e68c', '#6dceeb', '#ffde9b', '#ffa0a0', '#c2bfa5']
endif

hi @type guifg=#d08f20 
hi @lsp.type.enum guifg=#d08f20 
hi @type.definition guifg=#d08f20 
hi @lsp.type.type guifg=#d08f20 
hi @lsp.type.class guifg=#d08f20 
hi @keyword guifg=#d08f20 
hi @lsp.type.type guifg=#d08f20 
hi @storageclass guifg=#d08f20 
hi @keyword.return guifg=#d08f20 
hi @repeat guifg=#d08f20 
hi @conditional guifg=#d08f20 
hi @variable guifg=#90b080
hi @preproc guifg=#90b080
hi @parameter guifg=#90b080
hi @function guifg=#90b080
hi @lsp.type.function guifg=#90b080
hi @lsp.type.parameter guifg=#90b080
hi @lsp.type.variable guifg=#90b080
hi @lsp.type.property guifg=#90b080

hi @punctuation.bracket guifg=#90b080
hi @punctuation.delimiter guifg=#90b080
hi @include guifg=#747474
hi @define guifg=#90b080
hi @field guifg=#90b080
hi @operator guifg=#90b080
hi @property guifg=#90b080
hi @comment guifg=#2090F0
hi @string guifg=#50ff30
hi @string.escape guifg=darkred
hi @number guifg=#50ff30
hi @constant.builtin guifg=#db24cb
hi @constant guifg=#90b080

hi Normal guifg=#90b080 guibg=#242424 gui=NONE cterm=NONE
hi Normal guifg=#90b080 guibg=#333333 gui=NONE cterm=NONE
hi Normal guifg=#90b080 guibg=#0c0c0c gui=NONE cterm=NONE
hi Normal guifg=#90b080 guibg=#181818 gui=NONE cterm=NONE
hi NonText guifg=#6dceeb guibg=#333333 gui=NONE cterm=NONE
hi NonText guifg=#6dceeb guibg=#242424 gui=NONE cterm=NONE
hi NonText guifg=#6dceeb guibg=#0c0c0c gui=NONE cterm=NONE
hi NonText guifg=#6dceeb guibg=#181818 gui=NONE cterm=NONE
hi StatusLine guifg=#333333 guibg=#c2bfa5 gui=NONE cterm=NONE
hi StatusLineNC guifg=#7f7f8c guibg=#c2bfa5 gui=NONE cterm=NONE
hi StatusLineTerm guifg=#333333 guibg=#c2bfa5 gui=NONE cterm=NONE
hi StatusLineTermNC guifg=#ffffff guibg=#c2bfa5 gui=NONE cterm=NONE
hi Pmenu guifg=#ffffff guibg=#666666 gui=NONE cterm=NONE
hi PmenuSel guifg=#333333 guibg=#f0e68c gui=NONE cterm=NONE
hi PmenuSbar guifg=NONE guibg=#333333 gui=NONE cterm=NONE
hi PmenuThumb guifg=NONE guibg=#c2bfa5 gui=NONE cterm=NONE
hi TabLine guifg=#333333 guibg=#c2bfa5 gui=NONE cterm=NONE
hi TabLineFill guifg=NONE guibg=#c2bfa5 gui=NONE cterm=NONE
hi TabLineSel guifg=#333333 guibg=#f0e68c gui=NONE cterm=NONE
hi ToolbarLine guifg=NONE guibg=#666666 gui=NONE cterm=NONE
hi ToolbarButton guifg=#333333 guibg=#ffde9b gui=bold cterm=bold
hi SpecialKey guifg=#9acd32 guibg=NONE gui=NONE cterm=NONE
hi Folded guifg=#eeee00 guibg=#4d4d4d gui=NONE cterm=NONE
hi Visual guifg=#f0e68c guibg=#6b8e24 gui=NONE cterm=NONE
hi VisualNOS guifg=#f0e68c guibg=#6dceeb gui=NONE cterm=NONE
hi LineNr guifg=#747474 guibg=NONE gui=NONE cterm=NONE
hi FoldColumn guifg=#eeee00 guibg=#4d4d4d gui=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=#666666 gui=NONE cterm=NONE
hi CursorColumn guifg=NONE guibg=#666666 gui=NONE cterm=NONE
hi CursorLineNr guifg=#af00af guibg=NONE gui=bold cterm=bold
hi QuickFixLine guifg=#333333 guibg=#f0e68c gui=NONE cterm=NONE
hi Underlined guifg=#75a0ff guibg=NONE gui=underline cterm=underline
hi Error guifg=#ff0000 guibg=#ffffff gui=reverse cterm=reverse
hi ErrorMsg guifg=#ff0000 guibg=#ffffff gui=reverse cterm=reverse
hi ModeMsg guifg=#ffde9b guibg=NONE gui=bold cterm=bold
hi WarningMsg guifg=#cd5c5c guibg=NONE gui=bold cterm=bold
hi MoreMsg guifg=#9acd32 guibg=NONE gui=bold cterm=bold
hi Question guifg=#89fb98 guibg=NONE gui=bold cterm=bold
hi Todo guifg=#ff0000 guibg=#eeee00 gui=NONE cterm=NONE
hi MatchParen guifg=#7f7f8c guibg=#bdb76b gui=NONE cterm=NONE
hi Search guifg=#f0e68c guibg=#7f7f8c gui=NONE cterm=NONE
hi IncSearch guifg=#f0e68c guibg=#cd853f gui=NONE cterm=NONE
hi WildMenu guifg=#333333 guibg=#eeee00 gui=NONE cterm=NONE
hi ColorColumn guifg=#ffffff guibg=#cd5c5c gui=NONE cterm=NONE
hi Cursor guifg=#333333 guibg=#f0e68c gui=NONE cterm=NONE
hi lCursor guifg=#333333 guibg=#ff0000 gui=NONE cterm=NONE
hi debugPC guifg=#666666 guibg=NONE gui=reverse cterm=reverse
hi debugBreakpoint guifg=#ffa0a0 guibg=NONE gui=reverse cterm=reverse
hi SpellBad guifg=#cd5c5c guibg=NONE guisp=#cd5c5c gui=undercurl cterm=underline
hi SpellCap guifg=#75a0ff guibg=NONE guisp=#75a0ff gui=undercurl cterm=underline
hi SpellLocal guifg=#ffde9b guibg=NONE guisp=#ffde9b gui=undercurl cterm=underline
hi SpellRare guifg=#9acd32 guibg=NONE guisp=#9acd32 gui=undercurl cterm=underline
hi Comment guifg=#6dceeb guibg=NONE gui=NONE cterm=NONE
hi Identifier guifg=#89fb98 guibg=NONE gui=NONE cterm=NONE
hi Statement guifg=#f0e68c guibg=NONE gui=bold cterm=bold
hi Constant guifg=#ffa0a0 guibg=NONE gui=NONE cterm=NONE
hi PreProc guifg=#cd5c5c guibg=NONE gui=NONE cterm=NONE
hi Type guifg=#bdb76b guibg=NONE gui=bold cterm=bold
hi Special guifg=#ffde9b guibg=NONE gui=NONE cterm=NONE
hi Directory guifg=#6dceeb guibg=NONE gui=NONE cterm=NONE
hi Conceal guifg=#666666 guibg=NONE gui=NONE cterm=NONE
hi Title guifg=#cd5c5c guibg=NONE gui=bold cterm=bold
hi DiffAdd guifg=#ffffff guibg=#5f875f gui=NONE cterm=NONE
hi DiffChange guifg=#ffffff guibg=#5f87af gui=NONE cterm=NONE
hi DiffText guifg=#000000 guibg=#c6c6c6 gui=NONE cterm=NONE
hi DiffDelete guifg=#ffffff guibg=#af5faf gui=NONE cterm=NONE
