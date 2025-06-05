local keybindings = {
	{ mode = 'n', key = '<C-h>',      description = 'Move focus to the left split',      command = '<C-w>h' },
	{ mode = 'n', key = '<C-l>',      description = 'Move focus to the right split',     command = '<C-w>l' },
	{ mode = 'n', key = '<C-j>',      description = 'Move focus to the down split',      command = '<C-w>j' },
	{ mode = 'n', key = '<C-k>',      description = 'Move focus to the up split',        command = '<C-w>k' },
	{ mode = 'n', key = '<Leader>c',  description = 'Close buffer (:q)',                 command = ':q<CR>' },
	{ mode = 'n', key = '<Leader>w',  description = 'Save buffer (:w)',                  command = ':w<CR>' },
	{ mode = 'n', key = '<Leader>p',  description = 'Paste from clipboard',              command = '"+p' },
	{ mode = 'v', key = '<Leader>p',  description = 'Paste from clipboard',              command = '"+p' },
	{ mode = 'n', key = '<Leader>y',  description = 'Copy to clipboard',                 command = '"+y' },
	{ mode = 'v', key = '<Leader>y',  description = 'Copy to clipboard',                 command = '"+y' },
	{ mode = 'n', key = '<Leader>lf', description = 'Format with LSP',                   command = vim.lsp.buf.format },
	{ mode = 'i', key = '<C-h>',      description = 'Left move while in insert mode',    command = '<Left>' },
	{ mode = 'i', key = '<C-l>',      description = 'Right move while in insert mode',   command = '<Right>' },
	{ mode = 'i', key = '<C-j>',      description = 'Down move while in insert mode',    command = '<Down>' },
	{ mode = 'i', key = '<C-k>',      description = 'Up move while in insert mode',      command = '<Up>' },
	{ mode = 'i', key = "<C-'>",      description = 'Move to End while in insert mode',  command = '<End>' },
	{ mode = 'i', key = "<C-g>",      description = 'Move to Home while in insert mode', command = '<Home>' },
}

for _, binding in ipairs(keybindings) do
	vim.keymap.set(binding.mode, binding.key, binding.command, { noremap = true, desc = binding.description })
end

vim.keymap.set('n', '<Leader>e', function()
	local tree_api = require('nvim-tree.api')
	local view = require('nvim-tree.view')
	if view.is_visible() then
		tree_api.tree.close()
	else
		tree_api.tree.open()
	end
end, { noremap = true, silent = true, desc = 'Toggle file explorer' })
