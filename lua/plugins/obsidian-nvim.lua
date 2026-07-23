return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  dependencies = {
    "ibhagwan/fzf-lua",
  },
  opts = {
    legacy_commands = false,
    workspaces = {
      {
        name = "universe",
        path = "~/Documents/universe",
      },
    },

    picker = {
      name = "fzf-lua",
    },
  },
}

