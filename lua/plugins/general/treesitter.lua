local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
	-- A list of parser names, or "all"
	ensure_installed = { "c", "lua", "bash" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	highlight = {
		-- `false` will disable the whole extension
		enable = true,
		disable = {"json"},

		additional_vim_regex_highlighting = false,
	},
	-- indent = {
	-- 	enable = true,
	-- 	disable = { "dart"},
	-- },
	autotag = { enable = true },

}

local parser = require("nvim-treesitter.parsers").get_parser_configs()

parser.dart = {
  install_info = {
    url = "https://github.com/UserNobody14/tree-sitter-dart",
    files = { "src/parser.c", "src/scanner.c" },
    revision = "8aa8ab977647da2d4dcfb8c4726341bee26fbce4", -- The last commit before the snail speed
  },
}

require('ufo').setup({
    provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end
})
