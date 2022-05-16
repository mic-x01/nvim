local M = {}

function M.setup()
	local whichkey = require "which-key"

	local conf = {
		window = {
			boder = "single", -- none, single, double, shadow
			position = "bottom", -- bottom, top
		},
	}

	local opts = {
		mode = "n", -- Normal mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = false, -- use `nowait` when creating keymaps
	}

	local mappings = {
		["w"] = { "<cmd>update!<CR>", "Save" },
		["q"] = { "<cmd>q!<CR>", "Quit" },

		["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },

		f = {
			name = "Find",
			f = { "<cmd>lua require('utils.finder').find_files()<CR>", "Files" },
			b = { "<cmd>FzfLua buffers<CR>", "Buffers" },
			o = { "<cmd>FzfLua oldfiles<CR>", "Old files" },
			g = { "<cmd>FzfLua live_grep<CR>", "Live grep" },
			c = { "<cmd>FzfLua commands<CR>", "Commands" },
		},

		z = {
			name = "Packer",
			c = { "<cmd>PackerCompile<CR>", "Compile" },
			i = { "<cmd>PackerInstall<CR>", "Install" },
			s = { "<cmd>PackerSync<CR>", "Sync" },
			S = { "<cmd>PackerStatus<CR>", "Status" },
			u = { "<cmd>PackerUpdate<CR>", "Update" },
			p = { "<cmd>PackerProfile<CR>", "Profile" },
		},

	}

	whichkey.setup(conf)
	whichkey.register(mappings, opts)
end

return M

