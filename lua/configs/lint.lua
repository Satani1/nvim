local lint = require("lint")

lint.linters_by_ft = {
    go = { "golangcilint" },
    dockerfile = { "hadolint" },
    lua = { "selene" },
    markdown = { "markdownlint-cli2" },
    yaml = { "yamllint" },
}

lint.linters.luacheck.args = {
    unpack(lint.linters.luacheck.args),
    "--globals",
    "love",
    "vim",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    callback = function()
        lint.try_lint()
    end,
})