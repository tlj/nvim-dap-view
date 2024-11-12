local M = {}

M.listen_breakpoints = function()
    -- TODO a better approach could be to hijack the "toggle breakpoint" command
    -- and use some autocmds (eg, BufLeave/BufEnter for our buffer)
    require("dap").listeners.after.setBreakpoints["dap-view"] = function()
        require("dap-view.breakpoints").show()
    end
end

return M
