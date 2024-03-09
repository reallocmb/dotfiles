vim.opt.langmap = "snrthjkl;hjklsnrt"

vim.opt.cinoptions = "cino=(0t0"

vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.termguicolors = true

vim.opt.scrolloff = 8
-- vim.opt.signcolumn = "no"
vim.opt.updatetime = 50

-- highlight number
vim.api.nvim_command('set cursorline')
vim.api.nvim_command('set cursorlineopt=number')

vim.g.mapleader = ' '

-- my remaps
vim.keymap.set('n', '<leader>h', ':wincmd h<cr>')
vim.keymap.set('n', '<leader>j', ':wincmd j<cr>')
vim.keymap.set('n', '<leader>k', ':wincmd k<cr>')
vim.keymap.set('n', '<leader>l', ':wincmd l<cr>')

vim.keymap.set('n', '<leader>i', ':wincmd s<cr>')
vim.keymap.set('n', '<leader>a', ':wincmd v<cr>')
vim.keymap.set('n', '<leader>c', ':hid<cr>')

--vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', 'ä', 'nzzzv');
vim.keymap.set('n', 'ö', 'Nzzzv');

-- terminal
vim.keymap.set("n", "<leader>o", ":terminal<cr>")
vim.api.nvim_set_keymap("t", "<ESC>", "<C-\\><C-n>", { noremap = false })

-- Plugins width PACKER
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use('wbthomason/packer.nvim')

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('nvim-treesitter/playground')

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use "nvim-lua/plenary.nvim"
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = {{"nvim-lua/plenary.nvim"}}
    }

    use('neovim/nvim-lspconfig')
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-nvim-lsp')
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin

    -- use('mbbill/undotree')

    use("AlessandroYorba/Alduin");
    use('altercation/vim-colors-solarized')
    use('rose-pine/neovim')
    use('ellisonleao/gruvbox.nvim')
    use('tomasr/molokai')
    use('adigitoleo/vim-mellow')
    use('NLKNguyen/papercolor-theme')

    -- latex
    use('lervag/vimtex')
    use('rhysd/vim-clang-format')

    --debugging
    use('mfussenegger/nvim-dap')
    use('folke/neodev.nvim')
    use('rcarriga/nvim-dap-ui')

    -- statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
end)
