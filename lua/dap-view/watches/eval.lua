local M = {}

---@param expr string
---@param callback fun(result: string): nil
M.eval_expr = function(expr, callback)
    local session = assert(require("dap").session(), "has active session")

    coroutine.wrap(function()
        local frame_id = session.current_frame and session.current_frame.id

        ---@type dap.ErrorResponse,dap.EvaluateResponse
        local err, result = session:request(
            "evaluate",
            { expression = expr, context = "watch", frameId = frame_id }
        )

        if err then
            vim.notify(err.message)
        end

        local expr_result = result.result

        -- TODO handle structured variables (variablesReference > 0)

        callback(expr_result)
    end)()
end

return M
