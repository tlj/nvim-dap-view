local M = {}

local api = vim.api

---@param bufnr? integer
---@param winnr? integer
M.close_buf_win = function(winnr, bufnr)
    if winnr then
        pcall(api.nvim_win_close, winnr, true)
        winnr = nil
    end
    if bufnr then
        pcall(api.nvim_buf_delete, bufnr, { force = true })
        bufnr = nil
    end
end

---@param bufnr integer
---@param callback fun(): nil
M.quit_buf_autocmd = function(bufnr, callback)
    api.nvim_create_autocmd({ "BufDelete", "WinClosed" }, {
        buffer = bufnr,
        once = true,
        callback = callback,
    })
end

return M
