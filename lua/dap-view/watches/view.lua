local state = require("dap-view.state")
local winbar = require("dap-view.options.winbar")
local globals = require("dap-view.globals")
local views = require("dap-view.views")

local M = {}

local api = vim.api

M.show = function()
    winbar.update_winbar("watches")

    if state.bufnr then
        -- Clear previous content
        api.nvim_buf_set_lines(state.bufnr, 0, -1, true, {})
        api.nvim_buf_clear_namespace(state.bufnr, globals.NAMESPACE, 0, -1)

        if views.cleanup_view(#state.watched_expressions == 0, "No Expressions") then
            return
        end

        api.nvim_buf_set_lines(
            state.bufnr,
            0,
            #state.watched_expressions + 1,
            false,
            state.watched_expressions
        )

        for i = 0, #state.watched_expressions - 1 do
            api.nvim_buf_set_extmark(state.bufnr, globals.NAMESPACE, i, 0, {
                virt_lines = {
                    { { state.expression_results[i + 1] or "Executing...", "Comment" } },
                },
            })
        end
    end
end

return M
