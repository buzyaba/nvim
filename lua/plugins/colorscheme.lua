return {
    'catppuccin/nvim',
    priority = 1000,
    init = function()
        vim.cmd.colorscheme 'catppuccin-mocha'
        vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#BAC2DE' })
        vim.api.nvim_set_hl(0, 'LineNr', { fg = '#F9E2AF' })
        vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#BAC2DE' })
    end,
}
