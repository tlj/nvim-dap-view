local globals = require("dap-view.globals")

local api = vim.api

---@param name string
---@param link string
local hl_create = function(name, link)
    api.nvim_set_hl(globals.NAMESPACE, "NvimDapView" .. name, { link = link })
end

hl_create("MissingData", "DapBreakpoint")
hl_create("WatchText", "Comment")
hl_create("WatchTextChanged", "DiagnosticVirtualTextWarn")
hl_create("ExceptionFilterEnabled", "DiagnosticOk")
hl_create("ExceptionFilterDisabled", "DiagnosticError")
hl_create("BreakpointFileName", "qfFileName")
hl_create("BreakpointLineNumber", "qfLineNr")
hl_create("BreakpointSeparator", "Comment")

api.nvim_set_hl_ns(globals.NAMESPACE)
