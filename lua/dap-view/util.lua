local M = {}

---@param buf_name string
M.get_buf = function(buf_name)
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        local buf = vim.api.nvim_win_get_buf(win)
        local name = vim.api.nvim_buf_get_name(buf)
        if name == buf_name then
            return buf
        end
    end

    -- Return nil if no windows is found with the given buffer name
    return nil
end

return M
