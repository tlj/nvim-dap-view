local state = require("dap-view.state")

local M = {}

M.set_options = function()
    vim.wo[state.winnr][0].scrolloff = 0
    vim.wo[state.winnr][0].wrap = false
    vim.wo[state.winnr][0].number = false
    vim.wo[state.winnr][0].relativenumber = false
    vim.wo[state.winnr][0].winfixheight = true
    vim.wo[state.winnr][0].cursorlineopt = "line"
    vim.wo[state.winnr][0].cursorline = true
    vim.wo[state.winnr][0].statuscolumn = ""
    vim.wo[state.winnr][0].foldcolumn = "0"

    vim.bo[state.bufnr].buftype = "nofile"
    vim.bo[state.bufnr].swapfile = false
end

return M
