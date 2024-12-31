return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')
    dashboard.section.header.val = {
      [[ _____  _   _  __     __]],
      [[| ____|| \ | | \ \   / /]],
      [[|  _|  |  \| |  \ \ / / ]],
      [[| |___ | |\  |   \ V /  ]],
      [[|_____||_| \_|    \_/   ]],
    }
    dashboard.section.buttons.val = {
      dashboard.button('e', '📄  New file', ':ene <BAR> startinsert<CR>'),
      dashboard.button('f', '🔍  Find file', ':Telescope find_files<CR>'),
      dashboard.button('r', '📂  Recent', ':Telescope oldfiles<CR>'),
      dashboard.button('q', '❌  Quit', ':qa<CR>'),
    }
    dashboard.section.footer.val = '🚀 Ready to Code!'
    alpha.setup(dashboard.opts)
  end,
}
