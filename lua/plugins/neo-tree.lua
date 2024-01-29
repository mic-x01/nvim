return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    source_selector = {
      winbar = true,
      statusline = true,
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
