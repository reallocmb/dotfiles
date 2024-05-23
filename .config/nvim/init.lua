
-- vim.cmd.colorscheme("empty")
-- vim.cmd.colorscheme("rose-pine")
vim.cmd.colorscheme("four")

vim.opt.langmap = "snrthjkl;hjklsnrt"

-- options set
vim.opt.cinoptions = "cino=(0t0"

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
--vim.opt.incsearch = true
vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "no"

vim.api.nvim_command('set cursorline')
vim.api.nvim_command('set cursorlineopt=number')

-- remaps
vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>h', ':wincmd h<cr>')
vim.keymap.set('n', '<leader>j', ':wincmd j<cr>')
vim.keymap.set('n', '<leader>k', ':wincmd k<cr>')
vim.keymap.set('n', '<leader>l', ':wincmd l<cr>')

vim.keymap.set('n', '<c-s>', ':wincmd s<cr>')
vim.keymap.set('n', '<c-h>', ':wincmd v<cr>')

vim.keymap.set('n', '<leader>c', ':hid<cr>')

vim.keymap.set('n', 'ä', 'nzzzv');
vim.keymap.set('n', 'ö', 'Nzzzv');

vim.keymap.set('n', '<c-d>', "<c-d>zz");
vim.keymap.set('n', '<c-u>', "<c-u>zz");

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- terminal
vim.keymap.set("n", "<leader>o", ":terminal<cr>")
vim.api.nvim_set_keymap("t", "<ESC>", "<C-\\><C-n>", { noremap = false })

-- build
--vim.keymap.set('n', '<leader>b', ':terminal make ', {})
--vim.keymap.set('n', '<leader>m', ':!make<cr>', {})

vim.keymap.set('n', '<leader>b', ':terminal sh build.sh ', {})
vim.keymap.set('n', '<leader>m', ':!sh build.sh<cr>', {})

-- package manager lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "nvim-treesitter/nvim-treesitter",
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",

    "nvim-lualine/lualine.nvim",

    --Obsidian
    --colorschemes
    "Mofiqul/vscode.nvim",
    "folke/tokyonight.nvim",
    { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
    "rose-pine/neovim",

    "ziglang/zig.vim"
})

-- Plugin: harpoon
local harpoon = require("harpoon")

harpoon:setup()
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-b>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-m>", function() harpoon:list():next() end)

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end)
vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end)
vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end)

-- Plugin: nvim-lspconfig
local lspconfig = require("lspconfig")
vim.diagnostic.disable()

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "<leader>kj", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>kf", vim.lsp.buf.references)

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {
    'clangd',
    'gopls',
    'zls'
}

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
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
      completion = cmp.config.window.bordered(),
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
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
  completion = {
      autocomplete = false
  }
}

-- Plugin: nvim-telescope
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fs', builtin.help_tags, {})

--Plugin: lualine
--require('lualine').setup {
--  options = {
--    icons_enabled = true,
--    theme = 'gruvbox_dark',
--    component_separators = { left = '', right = ''},
--    section_separators = { left = '', right = ''},
--    disabled_filetypes = {
--      statusline = {},
--      winbar = {},
--    },
--    ignore_focus = {},
--    always_divide_middle = true,
--    globalstatus = false,
--    refresh = {
--      statusline = 1000,
--      tabline = 1000,
--      winbar = 1000,
--    }
--  },
--  sections = {
--    lualine_a = {'mode'},
--    -- lualine_b = {'branch', 'diff', 'diagnostics'},
--    lualine_b = {'branch', 'diff'},
--    lualine_c = {'filename'},
--    lualine_x = {'encoding', 'fileformat', 'filetype'},
--    lualine_y = {'progress'},
--    lualine_z = {'location'}
--  },
--  inactive_sections = {
--    lualine_a = {},
--    lualine_b = {},
--    lualine_c = {'filename'},
--    lualine_x = {'location'},
--    lualine_y = {},
--    lualine_z = {}
--  },
--  tabline = {},
--  winbar = {},
--  inactive_winbar = {},
--  extensions = {}
--}
