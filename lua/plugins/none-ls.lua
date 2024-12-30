return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
  },
  config = function()
    local null_ls = require('null-ls')

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd,
        require('none-ls.diagnostics.eslint'),
      },
      vim.api.nvim_create_autocmd('BufWritePre', {
        callback = function()
          local excluded_filetypes = { 'markdown', 'text' }
          if not vim.tbl_contains(excluded_filetypes, vim.bo.filetype) then
            vim.lsp.buf.format({ async = false })
          end
        end,
      }),
    })

    vim.keymap.set('n', '<leader>mp', vim.lsp.buf.format, {})
  end,
}
