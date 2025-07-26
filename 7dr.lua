local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("7dr team", "Midnight")

-- الانتظار عشان عناصر الواجهة تظهر
wait(1)

-- الوصول للنافذة وتغيير حجمها
local CoreGui = game:GetService("CoreGui")
local Gui = CoreGui:FindFirstChild("7dr") -- اسم النافذة
if Gui then
    local mainFrame = Gui:FindFirstChild("Main")
    if mainFrame then
        mainFrame.Size = UDim2.new(0, 150, 0, 100) -- غيّر الحجم هنا (العرض, الطول)
    end
end
