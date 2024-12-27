local state = require("dap-view.state")

local M = {}

---@param expr string
M.add_watch_expr = function(expr)
    -- Avoid duplicate expressions
    local can_add = #expr > 0 and not vim.tbl_contains(state.watched_expressions, expr)
    if can_add then
        table.insert(state.watched_expressions, expr)
    end
    return can_add
end

---@param line number
M.remove_watch_expr = function(line)
    table.remove(state.watched_expressions, line)
end

return M
