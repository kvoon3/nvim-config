vim = vim or {}

require('config.lazy')
require('options')
require('keymaps')

if vim.g.vscode then
    -- VSCode extension
else
    -- ordinary Neovim
end

