-- تحميل Kavo UI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- إنشاء الواجهة
local Window = Library.CreateLib("Steal GUI", "Midnight")
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Controls")

-- المتغيرات
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

-- الزر
Section:NewButton("سرقة", "يسرق مباشرة ويرجعك", function()
    local original = hrp.CFrame
    hrp.CFrame = hrp.CFrame + Vector3.new(0, 50, 0)
    task.wait(0.2)

    for _, obj in ipairs(workspace:GetDescendants()) do
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
end)
