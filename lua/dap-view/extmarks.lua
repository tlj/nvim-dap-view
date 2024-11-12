local M = {}

local api = vim.api

---@param src_bufnr integer
---@param src_row integer
---@param target_bufnr integer
---@param target_row integer
---@param col_offset integer
M.copy_extmarks = function(src_bufnr, src_row, target_bufnr, target_row, col_offset)
    local extmarks = api.nvim_buf_get_extmarks(
        src_bufnr,
        -1,
        { src_row, 0 },
        { src_row + 1, 0 },
        -- TODO perhaps it would be better to also filter by "highlight = true"
        { details = true }
    )

    for _, extmark in ipairs(extmarks) do
        local namespace = extmark[1]
        local col = extmark[3]
        local opts = extmark[4]

        if opts and opts.end_col then
            opts.end_col = opts.end_col + col_offset
        end

        if opts then
            api.nvim_buf_set_extmark(
                target_bufnr,
                opts.ns_id or M.namespace,
                target_row,
                col + col_offset,
                {
                    id = namespace,
                    end_col = opts.end_col,
                    priority = opts.priority,
                    hl_group = opts.hl_group,
                    right_gravity = opts.right_gravity,
                    hl_eol = opts.hl_eol,
                    virt_text = opts.virt_text,
                    virt_text_pos = opts.virt_text_pos,
                    virt_text_win_col = opts.virt_text_win_col,
                    hl_mode = opts.hl_mode,
                    line_hl_group = opts.line_hl_group,
                    spell = opts.spell,
                    url = opts.url,
                }
            )
        end
    end
end

return M
