-- =========================
--  Grundeinstellungen
-- =========================
vim.opt.langmap = "snrthjkl;hjklsnrt"
vim.opt.cinoptions = "(0,t0"
vim.opt.cinoptions:append(",:0,l1")
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = false

vim.opt.smartindent = true

-- Leader-Key
vim.g.mapleader = ' '

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Gehe zur Definition' })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Gehe zur Deklaration' })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'Gehe zur Implementierung' })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Zeige Referenzen' })
vim.keymap.set('n', '<leader>i', vim.diagnostic.open_float)


vim.keymap.set('n', '<c-s>', ':wincmd s<cr>')
vim.keymap.set('n', '<c-h>', ':wincmd v<cr>')

vim.keymap.set('n', '<leader>h', ':wincmd h<cr>')
vim.keymap.set('n', '<leader>j', ':wincmd j<cr>')
vim.keymap.set('n', '<leader>k', ':wincmd k<cr>')
vim.keymap.set('n', '<leader>l', ':wincmd l<cr>')

vim.keymap.set('n', '<leader>c', ':close<cr>')

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<cr>')


-- OS-Check
local is_windows = (vim.fn.has("win32") == 1)


-- Build-Shortcuts (deine Mappings)
if is_windows then
    vim.cmd([[
    command! Build execute 'make' | copen
    ]])

    vim.o.makeprg = 'build.bat'
    vim.o.errorformat = '%f(%l): %m'

    --vim.keymap.set('n', '<leader>b', ':terminal build.bat', { desc = 'Build (Windows Terminal)' })
    vim.keymap.set('n', '<leader>b', ':Build<cr>', { desc = 'Build (Windows Terminal)' })
    vim.keymap.set('n', '<leader>m', ':!build.bat<cr>', { desc = 'Build (Windows Silent)' })
else
    vim.cmd([[
    command! Build execute 'make' | copen
    ]])

    vim.o.makeprg = 'sh build.sh'
    vim.o.errorformat = '%A%f:%l:%c: %m,%C%.%#,%Z'

    vim.keymap.set('n', '<leader>b', ':Build<cr>', { desc = 'Build (Unix Terminal)' })
    vim.keymap.set('n', '<leader>m', ':!sh build.sh<cr>', { desc = 'Build (Unix Silent)' })
end

-- Lazy Nvim [Plugin Manager]
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        'nvim-lua/plenary.nvim',
        'ThePrimeagen/harpoon',

        { 'nvim-tree/nvim-web-devicons', opts = {} },

        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',

        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
        {
            'mason-org/mason.nvim',
            opts = {}
        },
        "ellisonleao/gruvbox.nvim",
        "nvim-tree/nvim-tree.lua"
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})

require("mason").setup()

vim.lsp.config("csharp_ls", {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
vim.lsp.enable("csharp_ls")

vim.lsp.config("clangd", {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
vim.lsp.enable("clangd")

local cmp = require("cmp")

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})

require("nvim-tree").setup()

-- vim.cmd("colorscheme wildcharm")
vim.cmd("colorscheme 369_")

vim.diagnostic.enable(false)


-- harpoon
-- harpoon
vim.keymap.set('n', '<leader>g', function() require("harpoon.ui").toggle_quick_menu() end)
vim.keymap.set('n', '<leader>a', function() require("harpoon.mark").add_file() end)
vim.keymap.set('n', '<leader>1', function() require("harpoon.ui").nav_file(1) end)
vim.keymap.set('n', '<leader>2', function() require("harpoon.ui").nav_file(2) end)
vim.keymap.set('n', '<leader>3', function() require("harpoon.ui").nav_file(3) end)
vim.keymap.set('n', '<leader>4', function() require("harpoon.ui").nav_file(4) end)


