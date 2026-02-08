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
            'nvim-telescope/telescope.nvim',
            'j-hui/fidget.nvim',
            'nvim-lualine/lualine.nvim',
            { 
                'nvim-treesitter/nvim-treesitter',
                branch = "main",
                config = function(_, opts)
                    vim.api.nvim_create_autocmd('User', { pattern = 'TSUpdate',
                        callback = function()
                            local parsers = require('nvim-treesitter.parsers')
                            parsers.cpp = {
                                install_info = {
                                    url  = 'https://github.com/taku25/tree-sitter-unreal-cpp',
                                    revision  = '67198f1b35e052c6dbd587492ad53168d18a19a8',
                                },
                            }
                            parsers.ushader = {
                                install_info = {
                                    url  = 'https://github.com/taku25/tree-sitter-unreal-shader',
                                    revision  = '26f0617475bb5d5accb4d55bd4cc5facbca81bbd',
                                },
                            }
                        end
                    })
                    local langs = { "c", "cpp", "ushader","json"  }
                    require("nvim-treesitter").install(langs)
                    local group = vim.api.nvim_create_augroup('MyTreesitter', { clear = true })
                    vim.api.nvim_create_autocmd('FileType', {
                        group = group,
                        pattern = langs,
                        callback = function(args)
                            vim.treesitter.start(args.buf)
                            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                        end,
                    })
                end
            }
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
