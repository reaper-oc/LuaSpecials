
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

game:GetService("RunService").RenderStepped:Connect(function()
    local closestDist = math.huge
    local target = nil

    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= player and v.Character and v.Character:FindFirstChild("Head") then
            local head = v.Character.Head
            local screenPos, onScreen = camera:WorldToScreenPoint(head.Position)
            if onScreen then
                local dist = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
                if dist < closestDist then
                    closestDist = dist
                    target = head
                end
            end
        end
    end

    if target then
        mouse.Move(target.Position) -- flick that shit
    end
end)
print("Aimbot active - go ruin some kids day")
