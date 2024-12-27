local M = {}

M.config = require("dap-view.config").config

---@param config Config?
M.setup = function(config)
    M.config = vim.tbl_deep_extend("force", M.config, config or {})

    local default_section = M.config.winbar.default_section
    local sections = M.config.winbar.sections

    assert(
        vim.tbl_contains(sections, default_section),
        "Default section ("
            .. default_section
            .. ") not listed as one of the sections "
            .. vim.inspect(sections)
    )
end

return M
