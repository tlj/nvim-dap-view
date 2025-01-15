---@class ConfigModule
local M = {}

---@class WinbarConfig
---@field sections SectionType[]
---@field default_section SectionType
---@field show boolean

---@class WindowsConfig
---@field height integer

--- @alias SectionType '"breakpoints"' | '"exceptions"' | '"watches"'

---@class Config
---@field winbar WinbarConfig
---@field windows WindowsConfig
M.config = {
    winbar = {
        show = true,
        sections = { "watches", "exceptions", "breakpoints" },
        default_section = "watches",
    },
    windows = {
        height = 12,
    },
}

return M
