return {
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'rebelot/kanagawa.nvim',
    -- 'rose-pine/neovim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
        -- vim.cmd.colorscheme 'rose-pine-dawn'
        vim.cmd.colorscheme 'kanagawa-wave'

        -- vim.cmd.hi 'Comment gui=none'
        -- vim.cmd.hi 'Normal guibg=none'
        -- vim.cmd.hi 'NormalFloat guibg=none'
        vim.cmd.hi 'SignColumn guibg=none'
        vim.cmd.hi 'LineNr guibg=none'
        vim.cmd.hi 'DiffAdd guibg=none'
        vim.cmd.hi 'DiffChange guibg=none'
        vim.cmd.hi 'DiffDelete guibg=none'
        vim.cmd.hi 'DiffText guibg=none'
    end,
}
