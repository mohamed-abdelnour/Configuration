local M = {}

local conf = require("telescope.config").values
local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local pickers = require("telescope.pickers")
local sorters = require("telescope.sorters")

local split_whitespace = require("modules/functions").str.split_whitespace

local generator = function(arg)
    local command = arg.opts[arg.key] or arg.default
    arg.opts[arg.key] = command
    return function(prompt)
        return vim.tbl_flatten({ command, prompt and split_whitespace(prompt) })
    end
end

M.ivy = function()
    return require("telescope/themes").get_ivy({
        layout_config = {
            height = 20,
        },
    })
end

M.fd = function(opts)
    opts = opts or {}
    opts.cwd = opts.cwd and vim.fn.expand(opts.cwd)
    opts.entry_maker = opts.entry_maker or make_entry.gen_from_file(opts)

    local command = generator({
        key = "find_command",
        opts = opts,
        default = { "fd" },
    })

    pickers.new(opts, {
        prompt_title = "fd",
        finder = finders.new_job(command, opts.entry_maker, opts.max_results, opts.cwd),
        previewer = conf.file_previewer(opts),
        sorter = sorters.highlighter_only(opts),
    }):find()
end

M.rg = function(opts)
    opts = opts or {}
    opts.cwd = opts.cwd and vim.fn.expand(opts.cwd)
    opts.entry_maker = opts.entry_maker or make_entry.gen_from_vimgrep(opts)

    local command = generator({
        key = "vimgrep_arguments",
        opts = opts,
        default = { "rg", "--smart-case", "--vimgrep" },
    })

    pickers.new(opts, {
        prompt_title = "rg",
        finder = finders.new_job(command, opts.entry_maker, opts.max_results, opts.cwd),
        previewer = conf.grep_previewer(opts),
        sorter = sorters.highlighter_only(opts),
    }):find()
end

return M
