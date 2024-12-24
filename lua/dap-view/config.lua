---@class ConfigModule
local M = {}

---@class WinbarConfig
---@field sections SectionType[]
---@field default_section SectionType

---@class WindowsConfig
---@field height integer

--- @alias SectionType '"breakpoints"' | '"exceptions"' | '"watches"'

---@class Config
---@field winbar WinbarConfig
---@field windows WindowsConfig
M.config = {
    winbar = {
        sections = { "breakpoints", "exceptions", "watches" },
        default_section = "breakpoints",
    },
    windows = {
        height = 15,
    },
}

return M
