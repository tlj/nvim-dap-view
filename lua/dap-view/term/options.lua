local M = {}

local state = require("dap-view.state")

M.set_options = function()
    local win = vim.wo[state.term_winnr][0]
    win.scrolloff = 0
    win.wrap = false
    win.number = false
    win.relativenumber = false
    win.winfixheight = true
    win.statuscolumn = ""
    win.foldcolumn = "0"
    win.winfixbuf = true
end

return M
