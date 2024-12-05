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
        require("dap-view.breakpoints.actions")._jump_to_breakpoint()
    end, { buffer = state.bufnr })
end

return M
