local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(
    function()
        use 'wbthomason/packer.nvim'

        use 'vim-syntastic/syntastic'
        use 'vim-scripts/indentpython.vim'
        use 'mattn/emmet-vim'
        use 'alvan/vim-closetag'

        use 'tpope/vim-surround'
        use 'tpope/vim-fugitive'

        use 'akinsho/toggleterm.nvim'
        use "ellisonleao/gruvbox.nvim"
        use "terrortylor/nvim-comment"
        use 'norcalli/nvim-colorizer.lua'
        use 'windwp/nvim-autopairs'

        use 'lewis6991/gitsigns.nvim'

        -- cmp / lsp / snippets
        use 'neovim/nvim-lspconfig'
        use 'williamboman/nvim-lsp-installer'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-nvim-lua'
        use 'hrsh7th/nvim-cmp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use 'L3MON4D3/LuaSnip'
        use 'saadparwaiz1/cmp_luasnip'
        use "rafamadriz/friendly-snippets"

        -- improve startup
        use "lewis6991/impatient.nvim"

        -- Lualine
        use {
          'nvim-lualine/lualine.nvim',
          requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }

        -- NvimTree
        use {
            'kyazdani42/nvim-tree.lua',
            requires = {
              'kyazdani42/nvim-web-devicons', -- optional, for file icon
            },
        }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
