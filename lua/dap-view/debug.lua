local M = {}

M.debug = function(any)
    vim.inspect(vim.print(any))
end

return M
