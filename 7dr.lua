-- تحميل مكتبة Kavo UI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- إنشاء نافذة
local Window = Library.CreateLib("Arbix Hub", "Midnight")

-- تبويب وأقسام
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Instant Steal")

-- متغيرات
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")
local isRunning = false
local cancelFlag = false

-- زر السرقة
Section:NewButton("Click Steal", "يسرق، يطيرك فوق، ثم يرجعك", function()
    if isRunning then return end
    isRunning = true
    cancelFlag = false
    print("[Arbix Hub]: بدأ التفعيل")

    for i = 1, 20 do
        if cancelFlag then break end
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") and obj.Name == "DeliveryHitbox" then -- غيّر الاسم إذا اللعبة مختلفة
                pcall(function()
                    firetouchinterest(hrp, obj, 0)
                    task.wait(0.1)
                    firetouchinterest(hrp, obj, 1)
                    
                    -- ✨ الطلعة والنزلة
                    local originalPos = hrp.CFrame
                    hrp.CFrame = hrp.CFrame + Vector3.new(0, 50, 0)
                    task.wait(0.3)
                    hrp.CFrame = originalPos
                end)
            end
        end
    end

    print("[Arbix Hub]: تم التنفيذ")
    isRunning = false
end)

-- زر الإيقاف
Section:NewButton("Refresh", "يوقف السرقة", function()
    cancelFlag = true
    print("[Arbix Hub]: تم الإيقاف")
end)
