---@class ExceptionsOption
---@field exception_filter dap.ExceptionBreakpointsFilter
---@field enabled boolean

---@class State
---@field bufnr? integer
---@field winnr? integer
---@field term_bufnr? integer
---@field term_winnr? integer
---@field current_session_id? integer
---@field current_section? SectionType
---@field exceptions_options? ExceptionsOption[]
---@field watched_expressions string[]
---@field expression_results string[]
---@field updated_evaluations boolean[]
local M = {
    current_session_id = nil,
    bufnr = nil,
    winnr = nil,
    term_bufnr = nil,
    term_winnr = nil,
    current_section = nil,
    exceptions_options = nil,
    watched_expressions = {},
    expression_results = {},
    updated_evaluations = {},
}

return M
