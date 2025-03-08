local kanagawa = {
  'rebelot/kanagawa.nvim',
  config = function()
    -- See plugin auto dark mode
    -- vim.cmd("colorscheme kanagawa-dragon")
  end,
}

local moonfly = { 
  "bluz71/vim-moonfly-colors", 
  name = "moonfly", 
  lazy = false,
  priority = 1000
}

return moonfly

