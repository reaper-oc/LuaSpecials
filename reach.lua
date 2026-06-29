local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
-- increase item's range
for _, tool in pairs(character:GetChildren()) do
    if tool:IsA("Tool") and tool:FindFirstChild("Handle") then
        tool.Handle.Size = Vector3.new(10, 10, 10) -- fat ass hitbox
        tool.GripPos = Vector3.new(0, 0, -10) -- extend reach
    end
end

local aura = Instance.new("Part")
aura.Size = Vector3.new(30, 30, 30)
aura.CFrame = character.HumanoidRootPart.CFrame
aura.Anchored = true
aura.CanCollide = false
aura.Transparency = 0.5
aura.Parent = workspace
aura.Name = "ReachAura"

game:GetService("RunService").Heartbeat:Connect(function()
    aura.CFrame = character.HumanoidRootPart.CFrame
end)

print("Started reach")
