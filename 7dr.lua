-- إنشاء ScreenGui
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SimpleGUI"
screenGui.Parent = playerGui

-- إنشاء إطار صغير
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 150, 0, 80)
frame.Position = UDim2.new(0, 20, 0, 20)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.Parent = screenGui

-- تزيين الإطار
local uicorner = Instance.new("UICorner")
uicorner.CornerRadius = UDim.new(0, 8)
uicorner.Parent = frame

-- متغير للتحكم بالعملية
local isStealing = false

-- زر السرقة
local stealButton = Instance.new("TextButton")
stealButton.Size = UDim2.new(0, 130, 0, 30)
stealButton.Position = UDim2.new(0, 10, 0, 10)
stealButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
stealButton.Text = "Steal"
stealButton.TextColor3 = Color3.new(1,1,1)
stealButton.Parent = frame

-- زر الريفرش
local refreshButton = Instance.new("TextButton")
refreshButton.Size = UDim2.new(0, 130, 0, 30)
refreshButton.Position = UDim2.new(0, 10, 0, 45)
refreshButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
refreshButton.Text = "Refresh"
refreshButton.TextColor3 = Color3.new(1,1,1)
refreshButton.Parent = frame

-- وظيفة زر السرقة: ينقل اللاعب لفوق مرة وحدة
stealButton.MouseButton1Click:Connect(function()
    if not isStealing then
        isStealing = true
        local char = player.Character or player.CharacterAdded:Wait()
        if char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + Vector3.new(0, 10, 0)
        end
        isStealing = false
    end
end)

-- وظيفة زر الريفرش: يوقف أي عملية جارية (لو في شيء)
refreshButton.MouseButton1Click:Connect(function()
    isStealing = false
end)
