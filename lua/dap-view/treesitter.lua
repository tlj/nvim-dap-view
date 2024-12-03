local M = {}

local api = vim.api

---@param src_bufnr integer
---@param src_row integer
---@param target_bufnr integer
---@param target_row integer
---@param col_offset integer
M.copy_highlights = function(src_bufnr, src_row, target_bufnr, target_row, col_offset)
    local ts_highlighter = vim.treesitter.highlighter.active[src_bufnr]
    if ts_highlighter then
        ts_highlighter.tree:for_each_tree(function(tstree, ltree)
            if not tstree then
                return
            end
            local root = tstree:root()
            local start_row, _, end_row, _ = root:range()

            if src_row >= start_row and src_row <= end_row then
                local query = (ts_highlighter:get_query(ltree:lang())):query()
                for id, node, _ in query:iter_captures(root, src_bufnr, src_row, src_row + 1) do
                    local hl_group = query.captures[id]
                    if hl_group then
                        local s_row, s_col, e_row, e_col = node:range()
                        if s_row == src_row then
                            api.nvim_buf_add_highlight(
                                target_bufnr,
                                -1,
                                hl_group,
                                target_row,
                                s_col + col_offset,
                                e_row == src_row and e_col + col_offset or -1
                            )
                        end
                    end
                end
            end
        end)
    end
end

return M
