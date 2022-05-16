local M = {}

function M.setup() 
  -- Indicate first time installation
	local packer_bootstrap = false

	-- packer.nvim configuration
	local conf = {
		profile = {
			enable = true,
			threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
		},

		display = {
			open_fn = function()
				return require('packer.util').float { border = 'rounded' }
			end,
		},
	}

	-- Check if packer.nvim is installed
	-- Run PackerCompile if there are changes in this file
	local function packer_init()
		local fn = vim.fn
		local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
		if fn.empty(fn.glob(install_path)) > 0 then
			packer_bootstrap = fn.system {
				'git',
				'clone',
				'--depth',
				'1',
				'https://github.com/wbthomason/packer.nvim',
				install_path,
			}
			vim.cmd [[packadd packer.nvim]]
		end
		vim.cmd 'autocmd BufWritePost plugins.lua source <afile> | PackerCompile'
	end

	-- Plugins
	local function plugins(use) 

        -- Plugin Manager
		use { 'wbthomason/packer.nvim' }

		-- Load only when require
		use { 'nvim-lua/plenary.nvim', module = 'plenary' }

		-- Beter icons
		use {
			'kyazdani42/nvim-web-devicons',
			module = 'nvim-web-devicons',
			config = function()
				require('nvim-web-devicons').setup { default = true }
			end,
		}

		-- Theme dracula
		use {
			"dracula/vim",
			as = "dracula",
			config = function()
				vim.cmd "colorscheme dracula"
			end,
		}

		-- WhichKey
		use {
			"folke/which-key.nvim",
			event = "VimEnter",
			config = function()
				require("config.whichkey").setup()
			end,
		}

		-- LuaLine
		use {
			'nvim-lualine/lualine.nvim',
			event = 'VimEnter',
			config = function()
				require("config.lualine").setup()
			end,
			requires = { "nvim-web-devicons" },
		}

        -- Buffer Line
		use {
			"akinsho/nvim-bufferline.lua",
			event = "BufReadPre",
			wants = "nvim-web-devicons",
			config = function()
				require("config.bufferline").setup()
			end,
		}
		
		-- Fuzzy Install
		use { "junegunn/fzf", run = "./install --all" }
		
		-- Fuzzy Lua
		use {
			'ibhagwan/fzf-lua',
			requires = { "kyazdani42/nvim-web-devicons" },
		}	
		
		-- NvimTree Explorer
		use {
			"kyazdani42/nvim-tree.lua",
			requires = {
				"kyazdani42/nvim-web-devicons",
			},
			cmd = { "NvimTreeToggle", "NvimTreeClose" },
			config = function()
				require("config.nvimtree").setup()
			end,
		}		

		-- Auto pairs
		-- use {
		-- 	"windwp/nvim-autopairs",
		-- 	wants = "nvim-treesitter",
		-- 	module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
		-- 	config = function()
		-- 		require("config.autopairs").setup()
		-- 	end,
		-- }
		--
		-- -- Auto tag
		-- use {
		-- 	"windwp/nvim-ts-autotag",
		-- 	wants = "nvim-treesitter",
		-- 	event = "InsertEnter",
		-- 	config = function()
		-- 		require("nvim-ts-autotag").setup { enable = true }
		-- 	end,
		-- }

    -- Markdown
    use {
       "iamcco/markdown-preview.nvim",
       run = function()
          vim.fn["mkdp#util#install"]()
       end,
       ft = "markdown",
       cmd = { "MarkdownPreview" },
    }

		if packer_bootstrap then
			print 'Restart Neovim required after installation!'
			require('packer').sync()
		end
	end

	packer_init()

	local packer = require 'packer'
	packer.init(conf)
	packer.startup(plugins)
end

return M

