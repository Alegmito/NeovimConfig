return {
    "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        dependencies = {
            "windwp/nvim-ts-autotag",
        },
        config = function()
            local treesitter = require("nvim-treesitter.configs")

            treesitter.setup({
                    autotag = {
                    enable = true,
                    },
                    ensure_installed = {
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
                    "glsl"
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

    require 'nvim-treesitter.install'.compilers = { "clang", "cl", "gcc" }
    local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        treesitter_parser_config.templ = {
            install_info = {
                url = "https://github.com/vrischmann/tree-sitter-templ.git",
                files = {"src/parser.c", "src/scanner.c"},
                branch = "master",
            },
        }

    vim.treesitter.language.register("templ", "templ")
        end,
}
