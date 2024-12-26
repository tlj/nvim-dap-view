local state = require("dap-view.state")

local M = {}

M.set_options = function()
    local win = vim.wo[state.winnr][0]
    win.scrolloff = 0
    win.wrap = false
    win.number = false
    win.relativenumber = false
    win.winfixheight = true
    win.cursorlineopt = "line"
    win.cursorline = true
    win.statuscolumn = ""
    win.foldcolumn = "0"
    win.winfixbuf = true

    local buf = vim.bo[state.bufnr]
    buf.buftype = "nofile"
    buf.swapfile = false
end

M.set_keymaps = function()
    vim.keymap.set("n", "<CR>", function()
        if state.current_section == "breakpoints" then
            require("dap-view.breakpoints.actions")._jump_to_breakpoint()
        elseif state.current_section == "exceptions" then
            require("dap-view.exceptions.actions")._toggle_exception_filter()
        end
    end, { buffer = state.bufnr })

    vim.keymap.set("n", "i", function()
        if state.current_section == "watches" then
            vim.ui.input({ prompt = "Expression: " }, function(input)
                if input and #input > 0 then
                    table.insert(state.watched_expressions, input)

                    require("dap-view.watches.view").show()
                end
            end)
        end
    end, { buffer = state.bufnr })
end

return M
