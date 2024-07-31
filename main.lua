local ui = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local orion = require("GLHub.orion")
local descendant = require("GLHub.descendants")
local replicatedStorage = game.ReplicatedStorage
local config = {
    Name = "GLHub",
    Tabs = {
        Name = "Tab",
        Sections = {{
            Name = "Section",
            Toggles = {{
                Name = "Toggle",
                Default = false,
                KeyBind = true,
                Key = Enum.KeyCode.T
            }},
            Buttons = {{
                Name = "Sigma",
                Callback = function()
                    print("ohio gyatt")
                end
            }},
            Sliders = {{
                Name = "Speed",
                Min = 0,
                Max = 20,
                Default = 16,
                Color = Color3.new(1, 1, 1),
                Increment = 1,
                ValueName = "ws"
            }},
            Dropdowns = {{
                Name = "Cat or dog",
                Default = "cat",
                Options = {"cat", "dog"}
            }},
            Footnote = [[
            Sigma
        ]]
        }}
    }
}
orion.load(ui, config)
