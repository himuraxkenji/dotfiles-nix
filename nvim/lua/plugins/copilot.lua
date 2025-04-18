return {

  "zbirenbaum/copilot.lua",
  opts = {
    panel = {
      auto_refresh = false,
      keymap = {
        accept = "<CR>",
        jump_prev = "[[",
        jump_next = "]]",
        refresh = "gr",
        open = "<M-CR>",
      },
    },
    suggestion = {
      auto_trigger = true,
      keymap = {
        accept = "<C-CR>",
        prev = "<M-[>",
        next = "<M-]>",
        dismiss = "<C-]>",
      },
    },
  },
}
