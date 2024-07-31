local orion = {}

local function section(tab, section)
    local ret = {}
    local sectionui = tab:AddSection({
        Name = section.Name
    })
    for i, v in ipairs(section.Toggles) do
        local tog = sectionui:AddToggle({
            Name = v.Name,
            Default = v.Default,
            Callback = v.Callback
        })
        if v.KeyBind then
            local key = sectionui:AddKeybind({
                Name = v.Name .. " key",
                Default = v.Key,
                Callback = function()
                    tog:Set(not tog.Value)
                end
            })
        end
        local cret = {
            get = function()
                return tog.Value
            end,
            set = function(val)
                tog:Set(val)
            end
        }
        ret[v.Name] = cret
    end
    for i, v in ipairs(section.Sliders) do
        local sli = sectionui:AddSlider(v)
        local cret = {
            get = function()
                return sli.Value
            end,
            set = function(val)
                sli:Set(val)
            end
        }
        ret[v.Name] = cret
    end
    for i, v in ipairs(section.Buttons) do
        local sli = sectionui:AddButton(v)
    end
    if section.Footnote then
        sectionui:AddParagraph("Footnote:", section.Footnote)
    end
    return ret
end

local function tab(win, tab)
    local ret = {}
    local tabui = window:MakeTab({
        Name = tab.Name
    })
    for i, v in ipairs(tab.Sections) do
        ret[v.Name] = section(tabui, v)
    end
    return ret
end

function orion.load(lib, config)
    local window = lib:MakeWindow({
        Name = config.Name
    })
    local ret = {}
    for i, v in ipairs(config.Tabs) do
        ret[v.Name] = tab(window, v)
    end
    return ret
end

return orion