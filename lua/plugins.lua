local nvim_packer_path = [[/opt/gadget086/]]
vim.opt.runtimepath:append(nvim_packer_path)
vim.opt.packpath = nvim_packer_path

local ensure_packer = function()
  local fn = vim.fn
  local install_path = nvim_packer_path..'pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim' use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- Telescope
  use { "nvim-telescope/telescope.nvim" }
  use { "nvim-lua/plenary.nvim" }
  use { "williamboman/mason.nvim"}
  use { "williamboman/mason-lspconfig.nvim"}
  use { "neovim/nvim-lspconfig" }
  use { "catppuccin/nvim", as = "catppuccin" }
  use { "hrsh7th/nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-path" }
  use { "L3MON4D3/LuaSnip" }
  use { "saadparwaiz1/cmp_luasnip" }
  use { "ethanholz/nvim-lastplace" }
  if packer_bootstrap then
	  require('packer').sync()
  end
end,
config = {
  package_root = nvim_packer_path..'pack/',
  compile_path = nvim_packer_path..'lua/packer_compiled.lua',
}})


