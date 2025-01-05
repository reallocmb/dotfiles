hi clear

if exists("syntax_on")
    syntax reset
endif

let colors_name = "lost"

hi Normal guifg=#8899aa guibg=none gui=NONE
hi Function guifg=#8899aa guibg=NONE gui=NONE

hi Type guifg=#5566aa gui=BOLD
hi @type.builtin.c guifg=#5566aa gui=BOLD

"function arguments
hi @lsp.type.parameter.c guifg=#88aa99 gui=NONE

hi @keyword guifg=#aa6655 gui=NONE

hi @lsp.type.variable.c guifg=#8899aa guibg=NONE gui=NONE

