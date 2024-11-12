local plugin = require("dap-view")

describe("setup", function()
    it("works with default", function()
        assert(plugin.open() == "Hello!", "my first function with param = Hello!")
    end)

    it("works with custom var", function()
        plugin.setup()
        assert(plugin.open() == "custom", "my first function with param = custom")
    end)
end)
