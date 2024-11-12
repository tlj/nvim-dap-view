local actions = require("dap-view.actions")

local M = {}

M.config = require("dap-view.config").config

---@param config Config?
M.setup = function(config)
    if config then
        assert(
            vim.tbl_contains(config.winbar.sections, config.winbar.default_section),
            "Default section must be a defined section"
        )
    end
    M.config = vim.tbl_deep_extend("force", M.config, config or {})
end

M.open = function()
    actions.open(M.config)
end

M.close = function()
    actions.close()
end

M.toggle = function()
    actions.toggle(M.config)
end

return M
