local state = require("dap-view.state")

local M = {}

---@param expr string
M.is_expr_valid = function(expr)
    -- Avoid duplicate expressions
    return #expr > 0 and not vim.tbl_contains(state.watched_expressions, expr)
end

---@param expr string
M.add_watch_expr = function(expr)
    return M.is_expr_valid(expr) and table.insert(state.watched_expressions, expr) or false
end

---@param line number
M.remove_watch_expr = function(line)
    table.remove(state.watched_expressions, line)
end

return M
