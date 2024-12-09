local dap = require("dap")
local state = require("dap-view.state")
local breakpoints = require("dap-view.breakpoints.buf_content")
local actions = require("dap-view.actions")
local exceptions = require("dap-view.exceptions")

dap.listeners.after.setBreakpoints["dap-view"] = function()
    breakpoints.show()
end

dap.listeners.after.launch["dap-view"] = function()
    exceptions.update_exception_breakpoints_filters()
end

dap.listeners.after.initialize["dap-view"] = function(session, _)
    state.exceptions_options = vim.iter(session.capabilities.exceptionBreakpointFilters)
        :map(function(filter)
            return { enabled = filter.default, exception_filter = filter }
        end)
        :totable()
end

dap.listeners.before.event_terminated.dapui_config = function()
    actions.close()
end

dap.listeners.before.event_exited.dapui_config = function()
    actions.close()
end
