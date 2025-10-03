require("godbolt").setup({
    languages = {
        cpp = { compiler = "g122", options = {} },
        c = { compiler = "cg122", options = {} },
        rust = { compiler = "r1650", options = {} },
        cuda = { compiler = "nvcc130", options = { "-O3 -ptx -arch=sm_86" } },
    },
    auto_cleanup = true,
    highlight = {
        cursor = "Visual",
        static = { "#222222", "#333333", "#444444", "#555555", "#444444", "#333333" },
    },
    quickfix = {
        enable = true,
        auto_open = true
    },
    url = "https://godbolt.org"
})
