local dap = require("dap")
local state = require("dap-view.state")
local breakpoints = require("dap-view.breakpoints.buf_content")
local actions = require("dap-view.actions")
local exceptions = require("dap-view.exceptions")
local globals = require("dap-view.globals")

dap.listeners.after.setBreakpoints[globals.SUBSCRIPTION_ID] = function()
    breakpoints.show()
end

dap.listeners.after.launch[globals.SUBSCRIPTION_ID] = function()
    exceptions.update_exception_breakpoints_filters()
end

dap.listeners.after.initialize[globals.SUBSCRIPTION_ID] = function(session, _)
    state.exceptions_options = vim.iter(session.capabilities.exceptionBreakpointFilters)
        :map(function(filter)
            return { enabled = filter.default, exception_filter = filter }
        end)
        :totable()
end

dap.listeners.before.event_terminated[globals.SUBSCRIPTION_ID] = function()
    actions.close()
end

dap.listeners.before.event_exited[globals.SUBSCRIPTION_ID] = function()
    actions.close()
end
