local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- إنشاء نافذة
local Window = Library.CreateLib("Delta Hub", "Midnight")

-- تبويب رئيسي
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Options")

local isStealing = false

-- دالة السرقة (تفترض دلتا فيها دالة بهذا الاسم)
local function DeltaSteal()
    -- هنا تحط كود دلتا الحقيقي للسرقة
    print("Delta Steal executed!")
    -- مثال: teleport up then down (تعديل حسب دلتا الحقيقي)
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    if char and char:FindFirstChild("HumanoidRootPart") then
        -- اطلع فوق
        char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + Vector3.new(0, 10, 0)
        wait(0.5)
        -- نزل تحت
        char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame - Vector3.new(0, 10, 0)
    end
end

-- زر السرقة
Section:NewButton("Steal", "Execute steal using Delta hack", function()
    if not isStealing then
        isStealing = true
        DeltaSteal()
        isStealing = false
    end
end)

-- زر الريفرش (إلغاء العملية - مثال)
Section:NewButton("Refresh", "Cancel current steal if stuck", function()
    if isStealing then
        isStealing = false
        print("Steal canceled")
    end
end)
