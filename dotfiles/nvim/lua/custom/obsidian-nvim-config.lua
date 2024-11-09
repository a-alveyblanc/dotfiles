local obsidian = require("obsidian")

obsidian.setup({
   workspaces = {
      {
         name = "research",
         path = "~/vaults/research",
      },
      {
         name = "projects",
         path = "~/vaults/projects",
      },
      {
         name = "todos",
         path = "~/vaults/todos",
      },
   },

   templates = {
      folder = "templates",
      date_format = "%m-%d-%Y",
      time_format = "%H:%M",
   },

   new_notes_location = "notes_subdir",

   picker = { name = "telescope.nvim" },

   completion = {
      nvim_cmp = true,
      min_chars = 2,
   },
})
