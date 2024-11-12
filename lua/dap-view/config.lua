---@class ConfigModule
local M = {}

---@class WinbarConfig
---@field sections SectionType[]
---@field default_section SectionType

--- @alias SectionType '"breakpoints"' | '"exceptions"' | '"watches"'

---@class Config
---@field winbar WinbarConfig
M.config = {
    winbar = {
        sections = { "breakpoints", "exceptions", "watches" },
        default_section = "breakpoints",
    },
}

return M
