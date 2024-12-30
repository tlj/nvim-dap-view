local M = {}

M.expect_session = function()
    local session = require("dap").session()

    if not session then
        vim.notify("No active session")
    end

    return session and true or false
end

return M
