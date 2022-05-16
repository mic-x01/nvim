local M = {}

function M.setup()
	require("nvim-tree").setup {
		disable_netrw = true,
		hijack_netrw = true,
		view = {
			number = true,
			relativenumber = true,
		},
		renderer = {
    			indent_markers = {
      				enable = false,
      				icons = {
        				corner = "",
        				edge = "",
        				none = "",
      				},
    			},
		},
		filters = {
			custom = { ".git" }
		},
	}
end

return M
