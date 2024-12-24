---@class ExceptionsOption
---@field exception_filter dap.ExceptionBreakpointsFilter
---@field enabled boolean

---@class State
---@field bufnr? integer
---@field winnr? integer
---@field term_bufnr? integer
---@field term_winnr? integer
---@field current_section? SectionType
---@field exceptions_options? ExceptionsOption[]
local M = {
    bufnr = nil,
    winnr = nil,
    term_bufnr = nil,
    term_winnr = nil,
    current_section = nil,
    exceptions_options = nil,
}

return M
