local winbar = require("dap-view.options.winbar")
local setup = require("dap-view.setup")
local util = require("dap-view.util")
local state = require("dap-view.state")
local settings = require("dap-view.options.settings")
local globals = require("dap-view.globals")

local api = vim.api

local M = {}

M.toggle = function()
    if state.bufnr then
        M.close()
    else
        M.open()
    end
end

M.close = function()
    if state.winnr then
        api.nvim_win_close(state.winnr, true)
        state.winnr = nil
    end
    if state.bufnr then
        api.nvim_buf_delete(state.bufnr, { force = true })
        state.bufnr = nil
    end
end

M.open = function()
    M.close()

    local bufnr = api.nvim_create_buf(false, false)

    assert(bufnr ~= 0, "Failed to create dap-view buffer")

    state.bufnr = bufnr

    local prev_buf = util.get_buf(globals.MAIN_BUF_NAME)
    if prev_buf then
        api.nvim_buf_delete(prev_buf, { force = true })
    end

    api.nvim_buf_set_name(bufnr, globals.MAIN_BUF_NAME)

    local winnr = api.nvim_open_win(bufnr, false, {
        split = "below",
        win = 0,
        height = 15,
    })

    assert(winnr ~= 0, "Failed to create dap-view window")

    state.winnr = winnr

    settings.set_options()
    settings.set_keymaps()

    state.current_section = state.current_section or setup.config.winbar.default_section
    winbar.set_winbar(state.current_section)

    -- Properly handle exiting the window
    api.nvim_create_autocmd({ "BufDelete", "WinClosed" }, {
        buffer = state.bufnr,
        once = true,
        callback = M.close,
    })
end

return M
