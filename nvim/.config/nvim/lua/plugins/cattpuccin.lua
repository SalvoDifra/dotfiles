return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            transparent_background = true,
            custom_highlights = {
                NormalFloat = { bg = "none" },
                TelescopeBorder = { bg = "none" }
            },
            integrations = {
                cmp = true,
                gitsigns = true,
                telescope = {
                    enabled = true,
                },
                treesitter = true,
                notify = false,
            },
        })

        vim.cmd.colorscheme "catppuccin"
    end
}

