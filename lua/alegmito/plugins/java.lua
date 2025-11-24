return {
    "nvim-java/nvim-java",
    dependencies = {
        "neovim/nvim-lspconfig",
    },
    config = function ()
        local pathJdk = os.getenv("JAVA_HOME")
        if (pathJdk == nil) then
            pathJdk = "D:/Programms/jdk-24"
        end
        require('java').setup({
            jdk = {
                auto_install = false,
                path = pathJdk,
            }
        })
        require('lspconfig').jdtls.setup({
            java = {
                configuration = {
                    runtimes = {
                        {
                            name = "JavaSE-24",
                            path = pathJdk,
                            default = true,
                        },
                    },
                },
            }
        })
    end
}
