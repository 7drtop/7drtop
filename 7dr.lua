local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
wait(1)
local gui = game:GetService("CoreGui"):FindFirstChild("KavoUI")
if gui then
    local main = gui:FindFirstChild("Main")
    if main then
        main.Size = UDim2.new(60, 60, 50, 50) -- غيّر الحجم حسب رغبتك
    end
end
