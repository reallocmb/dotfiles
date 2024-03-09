hi clear Normal
set bg&
hi clear

if exists("syntax_on")
    syntax reset
endif

hi Normal guifg=#9080b0

hi Constant guifg=#9080b0 gui=none

hi Statement guifg=#686DFF gui=none
hi @keyword.repeat.c guifg=#55aa00

hi Type guifg=#aa5500 gui=NONE
hi @lsp.type.type.c guifg=#999900

hi PreProc guifg=#ee80b0 gui=NONE

hi Identifier guifg=#9080b0 gui=NONE

hi Special guifg=#9080b0 gui=NONE

hi LineNr guifg=#9080b0
hi CursorLineNr guifg=#9080b0

hi Pmenu guifg=#9080b0 guibg=#161616
hi PmenuSel guifg=#9080b0 gui=BOLD

hi NonText guifg=#9080b0

hi MatchParen guifg=#9080b0 guibg=NONE
