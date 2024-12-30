local state = require("dap-view.state")
local globals = require("dap-view.globals")

local M = {}

local api = vim.api

---@param cond boolean
---@param message string
M.cleanup_view = function(cond, message)
    if cond then
        vim.wo[state.winnr].cursorline = false

        api.nvim_buf_set_lines(state.bufnr, 0, -1, false, { message })
        api.nvim_buf_set_extmark(
            state.bufnr,
            globals.NAMESPACE,
            0,
            0,
            { end_col = #message, hl_group = "DapBreakpoint" }
        )
    else
        vim.wo[state.winnr].cursorline = true
    end

    return cond
end

return M
