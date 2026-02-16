return {
    {
        'taku25/UnrealDev.nvim',
        -- Define all plugins in the development suite.
        -- You can remove any plugins you don't use.
        enabled = true,  -- Globally disabled by default
        -- cond = function()
        --     -- Enable if repo contains .nvim-enable-plugin file
        --     return vim.fn.findfile(".nvim-unreal", ".;") ~= ""
        -- end,
        dependencies = {
            {
                'taku25/UNL.nvim', -- Core Library
                build = "cargo build --release --manifest-path scanner/Cargo.toml",
                lazy = false,
            },
            'taku25/UEP.nvim', -- Project Explorer
            'taku25/UEA.nvim', -- Asset (Blueprint) Inspector
            'taku25/UBT.nvim', -- Build Tool
            'taku25/UCM.nvim', -- Class Manager
            'taku25/ULG.nvim', -- Log Viewer
            'taku25/USH.nvim', -- Unreal Shell
            'taku25/UNX.nvim', -- Logical View 
            'taku25/UDB.nvim', -- Debug
            {
                'taku25/USX.nvim', -- Syntax highlight
                lazy=false,
            },

            -- UI Plugins (Optional)
            'MunifTanjim/nui.nvim',
            'nvim-telescope/telescope.nvim',
            'j-hui/fidget.nvim',
            'nvim-lualine/lualine.nvim',
            'nvim-treesitter/nvim-treesitter'
            -- ...
        },
        opts = {
            -- Configuration specific to UnrealDev.nvim
            -- (e.g., disable setup for plugins you don't have)
            setup_modules = {
                UBT = true,
                UEP = true,
                ULG = true,
                USH = true,
                UCM = true,
                UEA = true,
                UNX = true,
            },
        },
    },

    -- ---
    -- Individual Plugin Settings (Optional)
    -- ---
    --{ 'taku25/UBT.nvim', opts = { ... } },
    --{ 'taku25/UEP.nvim', opts = { ... } },
    --{ 'taku25/UEA.nvim', opts = { ... } },
    -- ...
}
