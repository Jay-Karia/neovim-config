return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'gbprod/none-ls-shellcheck.nvim', -- shellcheck
    'nvimtools/none-ls-extras.nvim', -- eslint_d
  },
  config = function()
    local null_ls = require('null-ls')
    null_ls.setup({
      sources = {
        -------------------        LUA       ------------------------
        null_ls.builtins.formatting.stylua,

        -------------------        BASH       ------------------------
        null_ls.builtins.formatting.shfmt,
        require('none-ls-shellcheck.diagnostics'),
        require('none-ls-shellcheck.code_actions'),

        -------------------        TS | JS       ------------------------

        require('none-ls.diagnostics.eslint'),
        require('none-ls.code_actions.eslint'),
        require('none-ls.formatting.beautysh'),
        require('none-ls.formatting.eslint'),
        require('none-ls.formatting.jq'),

        -------------------        CSS       ------------------------
        null_ls.builtins.diagnostics.stylelint, -- CSS

        -----------------        XML       ------------------------
        null_ls.builtins.formatting.tidy.with({
          filetypes = { 'xml' },
        }),
        null_ls.builtins.diagnostics.tidy.with({
          filetypes = { 'xml' },
        }),

        -------------------        PRETTIER FORMATTER       ------------------------
        null_ls.builtins.formatting.prettierd.with({
          filetypes = {
            'javascript',
            'javascriptreact',
            'typescript',
            'typescriptreact',
            'vue',
            'css',
            'scss',
            'less',
            'html',
            'json',
            'jsonc',
            'yaml',
            'markdown',
            'markdown.mdx',
            'graphql',
            'handlebars',
          },
          extra_filetypes = { 'toml', 'svelte' },
        }),
        ----------------                              ----------------
      },
    })

    vim.keymap.set('n', '<leader>mp', vim.lsp.buf.format, {})
  end,
}
