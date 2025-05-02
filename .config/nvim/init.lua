-- vim.cmd.colorscheme("369")
vim.cmd.colorscheme("369_")

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
vim.opt.undofile = true

vim.opt.hlsearch = true
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

vim.keymap.set({'n', 'v' }, 'L', 'T');

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

--vim.keymap.set('n', '<leader>b', ':terminal sh build.sh ', {})
--vim.keymap.set('n', '<leader>m', ':!sh build.sh<cr>', {})

vim.keymap.set('n', '<leader>b', ':terminal build.bat ', {})
vim.keymap.set('n', '<leader>m', ':!build.bat<cr>', {})

-- package manager lazy.nvim
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

require("lazy").setup({
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

    "szw/vim-maximizer",
})

-- Plugin: nvim-lspconfig
require'lspconfig'.clangd.setup{}
vim.diagnostic.disable()

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "<leader>de", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>da", vim.lsp.buf.references)


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


-- Plugin: nvim-telescope
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fs', builtin.help_tags, {})




vim.keymap.set('n', '<leader>s', ":MaximizerToggle<cr>");






vim.hl = vim.highlight
