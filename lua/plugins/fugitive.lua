return { 
	"tpope/vim-fugitive",
	cmd ={"G", "Git"},
	keys = {
		{"<leader>ga", ":Git fetch --all -p<cr>", desc = "Git fetch"},
		{"<leader>gc", ":Git pull<cr>", desc = "Git pull"},
	},		
}
