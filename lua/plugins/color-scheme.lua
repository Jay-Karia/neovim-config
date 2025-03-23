return {
  {
    'catppuccin/nvim',
    lazy = false,
    name = 'catppuccin',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('catppuccin-mocha')
    end,
  },
  {
    'Mofiqul/dracula.nvim',
    config = function()
     -- vim.cmd.colorscheme('dracula')
    end
  },
}
