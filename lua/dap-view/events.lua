local dap = require("dap")
local state = require("dap-view.state")
local breakpoints = require("dap-view.breakpoints")
local actions = require("dap-view.actions")

dap.listeners.after.setBreakpoints["dap-view"] = function()
    breakpoints.show()
end

dap.listeners.after.launch["dap-view"] = function()
    if state.exceptions_options == nil then
        return
    end

    local filters = vim.iter(state.exceptions_options)
        :filter(function(x)
            return x.enabled
        end)
        :map(function(x)
            return x.exception_filter.filter
        end)
        :totable()

    dap.set_exception_breakpoints(filters)
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
