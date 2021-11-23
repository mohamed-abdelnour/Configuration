local neoformat = {}

-- StyLua
vim.g.neoformat_enabled_lua = { "stylua" }

-- latexindent
-- TODO: Remove when `latexindent` is bumped to V3.9.3
vim.g.neoformat_tex_latexindent = {
    exe = "latexindent",
    args = { "-c", "~/.cache/latexindent" },
    stdin = 1,
}

-- shfmt
vim.g.shfmt_opt = "-ci -sr"

return neoformat
