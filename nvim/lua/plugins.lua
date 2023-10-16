return require('packer').startup(function(use)
    -- packer itself (nvim plugin manager)
    use 'wbthomason/packer.nvim'

    -- telescope (and telescope related)
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- themes
    use 'tjdevries/colorbuddy.nvim'
    use 'svrana/neosolarized.nvim'

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'nvim-treesitter/playground'

    -- harpoon
    use 'theprimeagen/harpoon'

    -- undo-tree
    use 'mbbill/undotree'

    -- git
    use 'tpope/vim-fugitive'

    -- lsp stuff
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }
end)
