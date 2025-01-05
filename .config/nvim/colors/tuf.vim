hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "tuf"

"normal
hi Normal guifg=#ccbbaa guibg=#0a0a0f
hi @lsp guifg=#ccbbaa gui=NONE

"type
hi @type.builtin guifg=#7777cc gui=BOLD
hi @lsp.typemod.class.fileScope.c guifg=#7777cc gui=BOLD
hi @lsp.typemod.type guifg=#7777cc gui=BOLD

"keyword
hi Statement guifg=#7722cc gui=BOLD

"include
hi @keyword.import guifg=#ccbbaa gui=NONE

"parameter
hi @lsp.typemod.parameter guifg=#88cc88 gui=NONE

"variable
hi @lsp.typemod.variable guifg=#cc8888 gui=NONE

"comment
hi @comment.c guifg=#778899 gui=NONE

"number
hi @number.c guifg=#cc2277 gui=NONE

"string
hi @string.c guifg=#cc7722 gui=NONE
