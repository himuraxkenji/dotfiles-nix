return {
  "zbirenbaum/copilot.lua",
  optional = true,
  opts = function()
    require("copilot.api").status = require("copilot.status")
    require("copilot.api").filetypes = {
      filetypes = {
        yaml = true,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
      },
    }
    require("copilot.api").panel = {
      auto_refresh = false,
      keymap = {
        accept = "<CR>",
        jump_prev = "[[",
        jump_next = "]]",
        refresh = "gr",
        open = "<M-CR>",
      },
    }
    require("copilot.api").suggestion = {
      auto_trigger = true,
      keymap = {
        accept = "<C-CR>",
        prev = "<M-[>",
        next = "<M-]>",
        dismiss = "<C-]>",
      },
    }
  end,
}
-- rn {
--
--   "zbirenbaum/copilot.lua",
--   opts = {
--     panel = {
--       auto_refresh = false,
--       keymap = {
--         accept = "<CR>",
--         jump_prev = "[[",
--         jump_next = "]]",
--         refresh = "gr",
--         open = "<M-CR>",
--       },
--     },
--     suggestion = {
-- auto_trigger = true,
-- keymap = {
--   accept = "<C-CR>",
--   prev = "<M-[>",
--   next = "<M-]>",
--   dismiss = "<C-]>",
-- },
--     },
--   },
-- }
