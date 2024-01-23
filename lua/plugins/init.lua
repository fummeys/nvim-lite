local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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
	"nvim-lua/plenary.nvim",
	"kevinhwang91/promise-async",
	"nvim-tree/nvim-web-devicons",
	"folke/which-key.nvim",
	"nvim-telescope/telescope.nvim",
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate"
	},
	"nvim-lualine/lualine.nvim",
	"folke/tokyonight.nvim",
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"hrsh7th/nvim-cmp",
	'hrsh7th/cmp-nvim-lsp',
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	'saadparwaiz1/cmp_luasnip',
	"onsails/lspkind.nvim",
	"numToStr/Comment.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",
	{
		'nvimdev/lspsaga.nvim',
		config = function()
			require('lspsaga').setup({})
		end
	},
	"jwalton512/vim-blade",
	"christoomey/vim-tmux-navigator",
	"kdheepak/lazygit.nvim",
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end
	},
	{
		'akinsho/flutter-tools.nvim',
		lazy = false,
		dependencies = {
			'nvim-lua/plenary.nvim',
			'stevearc/dressing.nvim', -- optional for vim.ui.select
		},
		config = true,
	},
	{
		'kevinhwang91/nvim-ufo',
		dependencies = {
			'kevinhwang91/promise-async'
		}
	},
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" }
	}
})
