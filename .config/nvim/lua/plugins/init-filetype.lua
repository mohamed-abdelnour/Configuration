local filetype = {}

vim.g.did_load_filetypes = 1

require("filetype").setup({ overrides = { shebang = { dash = "sh" } } })

return filetype
