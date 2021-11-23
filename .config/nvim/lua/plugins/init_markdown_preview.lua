local markdown_preview = {}

vim.api.nvim_set_keymap(
    "n",
    "<leader>m",
    ":MarkdownPreviewToggle<cr>",
    { noremap = true, silent = true }
)

return markdown_preview
