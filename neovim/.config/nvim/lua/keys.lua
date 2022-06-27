local map = vim.api.nvim_set_keymap

map('n', '<C-ss>', ':NvimTreeToggle<CR>', { silent = true })
map('n', '<Leader>qq', ':wqa<CR>', { silent = true })

-- telescope
local options = {
  noremap = true,
}


-- iterm: https://stackoverflow.com/questions/33060569/mapping-command-s-to-w-in-vim
map("n", "<C-e>", '<cmd>lua require("telescope.builtin").buffers({ sort_mru = true })<CR>', options)
map("n", "<C-p>", '<cmd>lua require("telescope.builtin").find_files({ hidden=true })<CR>', options)
map("n", "<C-f>", '<cmd>lua require("telescope.builtin").live_grep()<CR>', options)
