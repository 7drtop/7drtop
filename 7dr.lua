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
Section:NewButton("Click Steal", "يلمس جميع DeliveryHitbox", function()
    if isRunning then return end
    isRunning = true
    cancelFlag = false
    print("[Arbix Hub]: بدأ التفعيل")

    for i = 1, 20 do
        if cancelFlag then break end
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") and obj.Name == "DeliveryHitbox" then
                pcall(function()
                    firetouchinterest(hrp, obj, 0)
                    task.wait(0.1)
                    firetouchinterest(hrp, obj, 1)
                end)
            end
        end
    end

    if cancelFlag then
        print("[Arbix Hub]: تم الإيقاف")
    else
        print("[Arbix Hub]: تم التنفيذ بنجاح")
    end
    isRunning = false
end)

-- زر الإيقاف / التحديث
Section:NewButton("Refresh", "يوقف العملية", function()
    cancelFlag = true
    print("[Arbix Hub]: تم إرسال أمر الإيقاف")
end)
