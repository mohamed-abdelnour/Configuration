local config = require("telescope.config").values
local ivy = require("telescope.themes").get_ivy
local make_entry = require("telescope.make_entry")
local new_job = require("telescope.finders").new_job
local picker = require("telescope.pickers").new
local sorter = require("telescope.sorters").highlighter_only

local Parser = require("lib.parser")

local M = {}

local generator = function(arg)
    local command = arg.opts[arg.key] or arg.default
    arg.opts[arg.key] = command
    return function(prompt)
        return vim.tbl_flatten({ command, prompt and Parser.from(prompt):args() })
    end
end

local tool = function(opts, builder)
    opts = opts or {}
    opts.cwd = opts.cwd and vim.fn.expand(opts.cwd)
    opts.entry_maker = opts.entry_maker or builder.make_entry(opts)

    local command = builder.command
    command.opts = opts
    command = generator(command)

    picker(opts, {
        prompt_title = builder.title,
        finder = new_job(command, opts.entry_maker, opts.max_results, opts.cwd),
        previewer = builder.previewer(opts),
        sorter = sorter(opts),
    }):find()
end

M.fd = function(opts)
    tool(opts, {
        title = "fd",
        command = {
            key = "find_command",
            default = { "fd", "--full-path" },
        },
        make_entry = make_entry.gen_from_file,
        previewer = config.file_previewer,
    })
end

M.ivy = ivy({
    layout_config = {
        height = 20,
    },
})

M.rg = function(opts)
    tool(opts, {
        title = "rg",
        command = {
            key = "vimgrep_arguments",
            default = { "rg", "--smart-case", "--vimgrep" },
        },
        make_entry = make_entry.gen_from_vimgrep,
        previewer = config.grep_previewer,
    })
end

return M
