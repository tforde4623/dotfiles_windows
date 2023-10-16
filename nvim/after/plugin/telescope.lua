local builtin = require('telescope.builtin')

-- keymaps
vim.keymap.set('n', '<leader>gf', builtin.find_files, {}) -- "Project Files"
vim.keymap.set('n', '<leader>gg', builtin.git_files, {}) -- "Git files"
vim.keymap.set('n', '<leader>ga', builtin.live_grep, {}) -- "Grep All"
vim.keymap.set('n', '<leader>gc', builtin.grep_string, {}) -- "Grep Current"
vim.keymap.set('n', '<leader>gs', function() -- "Grep String"
    builtin.grep_string({search=vim.fn.input("Grep > ")});
end)
