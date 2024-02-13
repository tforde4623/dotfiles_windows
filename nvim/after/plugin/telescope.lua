local opts = { noremap = true, silent = true }
local builtin = require('telescope.builtin')

-- You don't need to set any of these options.
-- IMPORTANT!: this is only a showcase of how you can set default options!
require("telescope").setup {
  extensions = {
    file_browser = {
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"

-- keymaps
vim.keymap.set('n', '<leader>gf', builtin.find_files, opts) -- "Project Files"
vim.keymap.set('n', '<leader>gg', builtin.git_files, opts) -- "Git files"
vim.keymap.set('n', '<leader>ga', builtin.live_grep, opts) -- "Grep All"
vim.keymap.set('n', '<leader>gc', builtin.grep_string, opts) -- "Grep Current"
vim.keymap.set('n', '<leader>gb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>gh', builtin.help_tags, opts)
vim.keymap.set('n', '<leader>gw', builtin.lsp_dynamic_workspace_symbols, opts)

vim.keymap.set('n', '<leader>gs', function() -- "Grep String"
    builtin.grep_string({search=vim.fn.input("Grep > ")});
end)

-- open file_browser with the path of the current buffer
vim.api.nvim_set_keymap(
  "n",
  "<space>gv",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)
