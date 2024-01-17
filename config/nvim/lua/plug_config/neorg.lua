local scandir = require "plenary.scandir"

local function getDirName(path)
    local components = {}
    for component in path:gmatch("([^/]+)") do
        table.insert(components, component)
    end

    return components[#components]
end

local workspace_dirs = scandir.scan_dir(vim.g.neorg_root, {add_dirs=true, depth = 1, only_dirs=true})
local workspace_table = {}

for key, value in pairs(workspace_dirs) do
    workspace_table[getDirName(value)] = value 
end


require('neorg').setup {
    load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
                workspaces = workspace_table,
            },
        },
    },
}
