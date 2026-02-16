return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    config = function()
        local treesitter = require("nvim-treesitter")
        treesitter.setup({
            autotag = {
                enable = true,
            },
            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
            auto_install = true,

            indent = {
                enable = true
            },

            highlight = {
                -- `false` will disable the whole extension
                enable = true,
                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = { "markdown" },
            },
        })

        require ("nvim-treesitter.install").compilers = { "clang", "cl", "gcc" }


        vim.api.nvim_create_autocmd('User', { pattern = 'TSUpdate', callback = function()
            local parsers = require('nvim-treesitter.parsers')
            parsers.templ = {
                install_info = {
                    url = "https://github.com/vrischmann/tree-sitter-templ.git",
                    files = {"src/parser.c", "src/scanner.c"},
                    branch = "master",
                },
            }

            parsers.cpp = {
                install_info = {
                    url  = 'https://github.com/taku25/tree-sitter-unreal-cpp',
                    revision  = '7bbb85f1fcc6e109c90cea2167e88a5a472910d3',
                },
            }
            parsers.ushader = {
                install_info = {
                    url  = 'https://github.com/taku25/tree-sitter-unreal-shader',
                     -- Check if need to update to the latest revision
                     revision  = '26f0617475bb5d5accb4d55bd4cc5facbca81bbd',
                },
            }
            -- vim.treesitter.language.register('ucpp', { 'cpp' })
        end
        })

        local langs = {
            "json",
            "javascript",
            "typescript",
            "tsx",
            "yaml",
            "html",
            "css",
            "markdown",
            "markdown_inline",
            "bash",
            "lua",
            "vim",
            "dockerfile",
            "gitignore",
            "c",
            "cpp",
            "rust",
            "cmake",
            "glsl",
        }

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
    end,

}
