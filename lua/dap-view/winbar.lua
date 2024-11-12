local state = require("dap-view.state")

local M = {}

local winbar_info = {
    breakpoints = {
        desc = "Breakpoints (B)",
        keymap = "B",
        action = function() require("dap-view.breakpoints.init").show() end,
    },
    exceptions = {
        desc = "Exceptions (E)",
        keymap = "E",
    },
    watches = {
        desc = "Watches (W)",
        keymap = "W",
    },
}

local set_winbar_action_keymaps = function()
    if state.bufnr then
        for _, value in pairs(winbar_info) do
            vim.keymap.set(
                "n",
                value.keymap,
                function() value.action() end,
                { buffer = state.bufnr }
            )
        end
    end
end

---@param selected_section SectionType
---@param sections SectionType[]
local set_winbar_opt = function(selected_section, sections)
    if state.winnr then
        local winbar = sections
        local winbar_title = {}

        for _, key in ipairs(winbar) do
            local info = winbar_info[key]

            if info ~= nil then
                local desc = info.desc .. " %*"

                if selected_section == key then
                    desc = "%#TabLineSel# " .. desc
                else
                    desc = "%#TabLine# " .. desc
                end

                table.insert(winbar_title, desc)
            end
        end

        local value = table.concat(winbar_title, " ")

        vim.wo[state.winnr][0].winbar = value
    end
end

---@param selected_section SectionType
---@param sections SectionType[]
M.set_winbar = function(selected_section, sections)
    set_winbar_opt(selected_section, sections)
    set_winbar_action_keymaps()
    winbar_info[selected_section].action()
end

return M
