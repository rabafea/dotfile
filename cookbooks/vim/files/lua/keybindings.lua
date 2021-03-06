local setmap = vim.api.nvim_set_keymap

setmap('i', 'jj', '<ESC>', {silent = true})
setmap('n', ';', ':', {noremap = true})
setmap('n', ':', ';', {noremap = true})
setmap('n', 'Y', 'y$', {noremap = true})
setmap('n', '<Tab>', '$', {noremap = true})
setmap('n', '<S-Tab>', '0', {noremap = true})
setmap('n', 'ZZ', '<Nop>', {noremap = true})
setmap('n', 'ZQ', '<Nop>', {noremap = true})
setmap('n', 'Q', '<Nop>', {noremap = true})
setmap('n', 's', '<Nop>', {noremap = true})
setmap('', '<C-j>', '<Plug>(edgemotion-j)', {})
setmap('', '<C-k>', '<Plug>(edgemotion-k)', {})
setmap('n', '<ESC><ESC>', ':nohlsearch<CR>', {noremap = true, silent = true})
setmap('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"',
       {noremap = true, expr = true})
setmap('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"',
       {noremap = true, expr = true})
