vim.cmd.colorscheme("4coder")
vim.cmd.colorscheme("test")
-- vim.cmd('set background=dark')
-- vim.cmd.colorscheme("rose-pine")

-- configure Treesitter
require('nvim-treesitter.configs').setup {
    highlight = { enable = true },
    auto_install = true,
}

-- configure telescope
local telescope = require('telescope.builtin')local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fs', telescope.help_tags, {})

-- debugging
local dap = require("dap")
dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "-i", "dap" }
}

dap.configurations.c = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
  },
}

require("neodev").setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
})

-- vim.keymap.set('n', '<C-o>', function() require('dap').step_over() end)
-- vim.keymap.set('n', '<C-s>', function() require('dap').step_into() end)
-- vim.keymap.set('n', '<leader>u', function() require('dap').continue() end)
-- vim.keymap.set('n', '<leader>U', function() require('dap').terminate() end)
-- vim.keymap.set('n', '<leader>b', function() require('dap').toggle_breakpoint() end)


local dapui = require("dapui")
dapui.setup()
dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

-- configure harpoon

local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set('n', '<leader>B', function() harpoon:list():append() end)
vim.keymap.set('n', '<leader>M', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set('n', '<C-b>', function() harpoon:list():prev() end)
vim.keymap.set('n', '<C-m>', function() harpoon:list():next() end)

-- local harpoon_mark = require('harpoon.mark')
-- local harpoon_ui = require('harpoon.ui')
-- vim.keymap.set('n', '<leader>m', harpoon_mark.add_file, {})
-- vim.keymap.set('n', '<leader>b', harpoon_ui.toggle_quick_menu, {})
-- 
-- vim.keymap.set('n', '<C-b>', harpoon_ui.nav_prev, {})
-- vim.keymap.set('n', '<C-m>', harpoon_ui.nav_next, {})

-- configure lsp
require('lspconfig').clangd.setup{}
require('lspconfig').tsserver.setup{}

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<space>gk', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', 'ga', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'g,', vim.diagnostic.goto_prev)
        vim.keymap.set('n', 'g.', vim.diagnostic.goto_next)
        vim.keymap.set('n', 'ge', vim.diagnostic.setloclist)
        vim.keymap.set('n', 'gE', vim.diagnostic.open_float)
  end,
})

vim.diagnostic.disable()

local diagnostics = false

function toggle_diagnostics()
    if diagnostics then
        vim.diagnostic.disable()
        diagnostics = false
    else
        vim.diagnostic.enable()
        diagnostics = true
    end
end

vim.keymap.set('n', '<leader>fd', toggle_diagnostics, {});

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'java_language_server', 'tsserver', 'pyright' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
    completion = {
        autocomplete = false,
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
        ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
        -- C-b (back) C-f (forward) for snippet placeholder navigation.
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            luasnip.expand_or_jump()
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            luasnip.jump(-1)
        end, { 'i', 's' }),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}

-- latex

-- This is necessary for VimTeX to load properly. The "indent" is optional.
-- Note that most plugin managers will do this automatically.
vim.cmd('filetype plugin indent on')

-- This enables Vim's and neovim's syntax-related features. Without this, some
-- VimTeX features will not work (see ":help vimtex-requirements" for more info).
vim.cmd('syntax enable')

-- Viewer options: One may configure the viewer either by specifying a built-in
-- viewer method:
vim.g.vimtex_view_method = 'zathura'

-- Or with a generic interface:
vim.g.vimtex_view_general_viewer = 'okular'
vim.g.vimtex_view_general_options = '--unique file:@pdf#src:@line@tex'

-- VimTeX uses latexmk as the default compiler backend. If you use it, which is
-- strongly recommended, you probably don't need to configure anything. If you
-- want another compiler backend, you can change it as follows. The list of
-- supported backends and further explanation is provided in the documentation,
-- see ":help vimtex-compiler".
vim.g.vimtex_compiler_method = 'pdflatex'

-- Most VimTeX mappings rely on localleader and this can be changed with the
-- following line. The default is usually fine and is the symbol "\".
vim.g.maplocalleader = ","

-- statusline
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'palenight',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
