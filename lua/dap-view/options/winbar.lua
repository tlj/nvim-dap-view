local state = require("dap-view.state")
local setup = require("dap-view.setup")

local M = {}

local winbar_info = {
    breakpoints = {
        desc = "Breakpoints [B]",
        keymap = "B",
        action = function()
            require("dap-view.breakpoints.view").show()
        end,
    },
    exceptions = {
        desc = "Exceptions [E]",
        keymap = "E",
        action = function()
            require("dap-view.exceptions.view").show()
        end,
    },
    watches = {
        desc = "Watches [W]",
        keymap = "W",
        action = function()
            print("foo")
        end,
    },
}

local set_winbar_action_keymaps = function()
    if state.bufnr then
        for _, value in pairs(winbar_info) do
            vim.keymap.set("n", value.keymap, function()
                value.action()
            end, { buffer = state.bufnr })
        end
    end
end

---@param selected_section SectionType
local set_winbar_opt = function(selected_section)
    if state.winnr then
        local winbar = setup.config.winbar.sections
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

        local value = table.concat(winbar_title, "")

        vim.wo[state.winnr][0].winbar = value
    end
end

---@param selected_section? SectionType
M.set_winbar = function(selected_section)
    set_winbar_action_keymaps()
    winbar_info[selected_section].action()
end

---@param section_name SectionType
M.update_winbar = function(section_name)
    state.current_section = section_name
    set_winbar_opt(state.current_section)
end

return M
