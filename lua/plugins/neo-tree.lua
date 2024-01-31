return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      position = "left",
      width = 40,
      mapping_options = {
        noremap = true,
        nowait = true,
      },
    },
    source_selector = {
      winbar = true,
      statusline = false,
    },
    filesystem = {
      filtered_items = {
        hide_by_name = {
          "node_modules",
          "obj",
          "bin",
        },
        always_show = { -- remains visible even if other settings would normally hide it
          ".gitignored",
        },
      },
    },
  },
}
