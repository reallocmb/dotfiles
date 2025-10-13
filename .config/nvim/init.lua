-- =========================
--  Grundeinstellungen
-- =========================
vim.opt.langmap = "snrthjkl;hjklsnrt"
vim.opt.cinoptions = "(0,t0"
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- Leader-Key
vim.g.mapleader = ' '

-- OS-Check
local is_windows = (vim.fn.has("win32") == 1)

-- Build-Shortcuts (deine Mappings)
if is_windows then
    vim.keymap.set('n', '<leader>b', ':terminal build.bat & pause<cr>', { desc = 'Build (Windows Terminal)' })
    vim.keymap.set('n', '<leader>m', ':!build.bat<cr>', { desc = 'Build (Windows Silent)' })
else
    vim.keymap.set('n', '<leader>b', ':terminal sh build.sh; read<cr>', { desc = 'Build (Unix Terminal)' })
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
        "ellisonleao/gruvbox.nvim"
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

vim.cmd("colorscheme gruvbox")
vim.cmd("colorscheme wildcharm")
