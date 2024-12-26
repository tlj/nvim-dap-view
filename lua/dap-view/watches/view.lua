local state = require("dap-view.state")
local winbar = require("dap-view.options.winbar")

local M = {}

local api = vim.api

M.show = function()
    winbar.update_winbar("watches")

    if state.bufnr then
        -- Clear previous content
        api.nvim_buf_set_lines(state.bufnr, 0, -1, true, {})

        api.nvim_buf_set_lines(
            state.bufnr,
            0,
            #state.watched_expressions + 1,
            false,
            state.watched_expressions
        )
    end
end

return M
