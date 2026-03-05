-- this is what you previously passed to ensure_installed
local languages = { 'c', 
                    'lua', 
                    'rust', 
                    'python', 
                    'markdown',
                    'markdown_inline',
                    'make',
                    'asm',
                    'bash',
                    'hyprlang'
                  }
return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        build = ':TSUpdate',
    },
    {
        'MeanderingProgrammer/treesitter-modules.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        opts = {
            ensure_installed = languages,
            fold = { enable = false },
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = { enable = false },
        },
    },
}
