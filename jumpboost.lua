local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

humanoid.JumpPower = 50

game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Space then
        humanoid.PlatformStand = true
    end
end)
game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Space then
        humanoid.PlatformStand = false
    end
end)
print("JumpPower set to 50")
