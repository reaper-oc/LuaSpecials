local player = game.Players.LocalPlayer
local camera = game.Workspace.CurrentCamera

local function createESP()
    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= player and v.Character and v.Character:FindFirstChild("Head") then
            local head = v.Character.Head

            local box = Drawing.new("Box")
            box.Thickness = 1
            box.Color = Color3.fromRGB(255, 0, 0) -- red for enemies
            box.Transparency = 0.5
            box.Filled = false

            local tag = Drawing.new("Text")
            tag.Text = v.Name .. " [" .. math.floor((v.Character.Humanoid.Health or 100)) .. "HP]"
            tag.Color = Color3.fromRGB(255, 255, 255)
            tag.Size = 14
            tag.Center = true
            tag.Outline = true
            tag.OutlineColor = Color3.fromRGB(0,0,0)
            
            game:GetService("RunService").RenderStepped:Connect(function()
                local pos, onScreen = camera:WorldToScreenPoint(head.Position)
                if onScreen then
                    box.Visible = true
                    tag.Visible = true
                    box.Position = Vector2.new(pos.X - 50, pos.Y - 50)
                    box.Size = Vector2.new(100, 120)
                    tag.Position = Vector2.new(pos.X, pos.Y - 80)
                else
                    box.Visible = false
                    tag.Visible = false
                end
            end)
        end
    end
end

player.CharacterAdded:Connect(createESP)
createESP()
print("ESP loaded - they can't hide from you now, Alpha 👁️‍🗨️")
