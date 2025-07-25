local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Steal GUI", "Midnight")
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Options")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local isRunning = false
local cancelFlag = false

Section:NewButton("Steal", "Click to steal and fly up then back", function()
    if isRunning then return end
    isRunning = true
    cancelFlag = false

    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    local original = hrp.CFrame

    hrp.CFrame = hrp.CFrame + Vector3.new(0,50,0)
    task.wait(0.2)

    for _, obj in ipairs(workspace:GetDescendants()) do
        if cancelFlag then break end
        if obj:IsA("BasePart") and obj.Name == "DeliveryHitbox" then
            pcall(function()
                firetouchinterest(hrp, obj, 0)
                task.wait(0.05)
                firetouchinterest(hrp, obj, 1)
            end)
        end
    end

    task.wait(0.2)
    hrp.CFrame = original

    isRunning = false
end)

Section:NewButton("Refresh", "Cancel stealing process", function()
    cancelFlag = true
end)
