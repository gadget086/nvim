require('plugins')
require('slanted-gaps')

vim.opt.number = true
vim.wo.relativenumber = true

require("catppuccin").setup{
	custom_highlights = function(colors)
		return {
			Comment = {fg =colors.flamingo},
			["@constant.builtin"] = { fg = colors.peach, style = {} },
			["@comment"] = { fg = colors.surface2, style = { "italic" }}
		}
	end
}
vim.cmd.colorscheme  "catppuccin-mocha"
local mocha = require("catppuccin.palettes").get_palette "mocha"
vim.api.nvim_set_hl(0, "LineNr", {fg=mocha.yellow})

require('mason').setup()
require('lspconfig').pylsp.setup{
	on_attach = function()
		vim.keymap.set("n","K",vim.lsp.buf.hover,{buffer=0})
	end
}
vim.g.mapleader = ' '
vim.keymap.set("n","<leader>h",":echo 'hello'<CR>")
vim.keymap.set("n","<leader>z",":source %<CR>:echo 'sourced'<CR>")
vim.keymap.set({"n","i","c"},"<leader><leader>","<ESC>")

-- TODO Completion
