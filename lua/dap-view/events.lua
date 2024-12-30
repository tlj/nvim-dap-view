local dap = require("dap")
local state = require("dap-view.state")
local breakpoints = require("dap-view.breakpoints.view")
local actions = require("dap-view.actions")
local exceptions = require("dap-view.exceptions")
local term = require("dap-view.term.init")

local SUBSCRIPTION_ID = "dap-view"

dap.listeners.before.initialize[SUBSCRIPTION_ID] = function()
    term.term_buf_win_init()
end

dap.listeners.after.setBreakpoints[SUBSCRIPTION_ID] = function()
    if state.current_section == "breakpoints" then
        breakpoints.show()
    end
end

dap.listeners.after.launch[SUBSCRIPTION_ID] = function()
    exceptions.update_exception_breakpoints_filters()
end

dap.listeners.after.initialize[SUBSCRIPTION_ID] = function(session, _)
    state.exceptions_options = vim.iter(session.capabilities.exceptionBreakpointFilters)
        :map(function(filter)
            return { enabled = filter.default, exception_filter = filter }
        end)
        :totable()
end

dap.listeners.before.event_terminated[SUBSCRIPTION_ID] = function()
    actions.close()
end

dap.listeners.before.event_exited[SUBSCRIPTION_ID] = function()
    actions.close()
end
