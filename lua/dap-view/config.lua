---@class ConfigModule
local M = {}

---@class WinbarConfig
---@field sections SectionType[]
---@field default_section SectionType
---@field show boolean

---@class WindowsConfig
---@field height integer
---@field width number|integer Width of the window in either characters or percentage (as decimal: 0.75)

--- @alias SectionType '"breakpoints"' | '"exceptions"' | '"watches"' | '"repl"'

---@class Config
---@field winbar WinbarConfig
---@field windows WindowsConfig
M.config = {
    winbar = {
        show = true,
        sections = { "watches", "exceptions", "breakpoints", "repl" },
        default_section = "watches",
    },
    windows = {
        height = 12,
        width = 0.5,
    },
}

return M
