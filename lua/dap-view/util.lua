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

---@param bufnr integer
M.get_relative_path = function(bufnr)
    local filepath = vim.api.nvim_buf_get_name(bufnr)

    local relative_path = filepath:gsub(vim.fn.getcwd() .. "/", "")

    if relative_path == filepath then
        return filepath
    end

    return relative_path
end

return M
