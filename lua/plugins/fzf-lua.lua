return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
   dependencies = { "nvim-mini/mini.icons" },
  ---@module "fzf-lua"
  ---@type fzf-lua.Config|{}
  ---@diagnostics disable: missing-fields
  opts = {},
  keys = {
	  {
		  "<leader>ff",
		  function() require('fzf-lua').files() end,
		  desc = "Find Files in current working directory"
	  }
  }
  ---@diagnostics enable: missing-fields
}
