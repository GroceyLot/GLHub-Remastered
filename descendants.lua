local descendant = {}

local connections = {}

local one = workspace.DescendantAdded:Connect(function(descendant)
    for i,v in pairs(connections) do
        local match = true
        if v[2] then match = descendant.Name == v[2] end
        if match and descendant.Parent == v[1] then pcall(v[3], descendant) end
    end
end)

function descendant.added(parent, child, callback)
    connections[#connections+1] = {parent, child, callback}
    local index = #connections
    local connection = {
        Connected = true,
        Disconnect = function(self)
            table.remove(connections, index)
            self.Connected = false
        end
    }
    return connection
end

function descendant.dis()
    one:Disconnect()
end

return descendant
