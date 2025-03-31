return {
    'mfussenegger/nvim-lint',
    config = function()
        require('lint').linters_by_ft = {
            cmake = { 'cmakelint' },
            python = { 'flake8' },
            json = { 'jsonlint' },
        }
        local lint_group = vim.api.nvim_create_augroup('lint', { clear = true })
        vim.api.nvim_create_autocmd({ 'BufEnter', 'InsertLeave', 'BufWritePost' }, {
            group = lint_group,
            callback = function()
                -- try_lint without arguments runs the linters defined in `linters_by_ft`
                -- for the current filetype
                require('lint').try_lint()
            end,
        })
    end,
}
