local winbar = require("dap-view.winbar")
local globals = require("dap-view.globals")
local state = require("dap-view.state")

local M = {}

local api = vim.api

M.show = function()
    winbar.update_winbar("exceptions")

    if state.bufnr then
        -- Clear previous content
        api.nvim_buf_set_lines(state.bufnr, 0, -1, true, {})

        if state.exceptions_options then
            local content = vim.iter(state.exceptions_options)
                :map(function(opt)
                    local icon = opt.enabled and "" or ""
                    return "  " .. icon .. "  " .. opt.exception_filter.label
                end)
                :totable()

            api.nvim_buf_set_lines(state.bufnr, 0, -1, false, content)

            for i, opt in ipairs(state.exceptions_options) do
                api.nvim_buf_set_extmark(
                    state.bufnr,
                    globals.NAMESPACE,
                    i - 1,
                    0,
                    { end_col = 4, hl_group = opt.enabled and "DiagnosticOk" or "DiagnosticError" }
                )
            end
        end
    end
end

return M
