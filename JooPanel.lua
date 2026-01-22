-- [[ Joo Panel V2 - Professional Edition ]] --
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera

local noclipEnabled = false
local flying = false
local currentSpeed = 16 -- دي القيمة اللي هيستخدمها المشي والطيران مع بعض

-- 1. الواجهة
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "JooPanelV2"
screenGui.Parent = game:GetService("CoreGui")
screenGui.ResetOnSpawn = false

-- [[ العلامة المائية ]] --
local watermark = Instance.new("TextLabel")
watermark.Size = UDim2.new(0, 500, 0, 100)
watermark.Position = UDim2.new(0.5, -250, 0.4, 0)
watermark.BackgroundTransparency = 1
watermark.TextColor3 = Color3.fromRGB(0, 255, 255)
watermark.Text = "Joo panel activated!"
watermark.Font = Enum.Font.GothamBlack
watermark.TextSize = 40
watermark.TextTransparency = 1
watermark.Parent = screenGui

task.spawn(function()
    TweenService:Create(watermark, TweenInfo.new(0.6), {TextTransparency = 0}):Play()
    task.wait(1.5)
    TweenService:Create(watermark, TweenInfo.new(0.6), {TextTransparency = 1}):Play()
end)

-- [[ اللوحة الرئيسية المعدلة ]] --
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 240, 0, 280) -- صغرنا الحجم الكلي
mainFrame.Position = UDim2.new(0.5, -120, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.BackgroundTransparency = 1
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner", mainFrame)
mainCorner.CornerRadius = UDim.new(0, 20)

local mainStroke = Instance.new("UIStroke", mainFrame)
mainStroke.Color = Color3.fromRGB(0, 255, 255)
mainStroke.Thickness = 3

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.Text = "JOO PANEL"
title.TextColor3 = Color3.fromRGB(0, 255, 255)
title.Font = Enum.Font.GothamBlack
title.TextSize = 24 -- خط كبير وواضح
title.BackgroundTransparency = 1
title.Parent = mainFrame

task.delay(2, function()
    TweenService:Create(mainFrame, TweenInfo.new(0.5), {BackgroundTransparency = 0.1}):Play()
end)

-- دالة الأزرار المطورة
local function createButton(text, pos, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.85, 0, 0, 50) -- زر أكبر
    btn.Position = pos
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18 -- خط أوضح
    btn.Parent = mainFrame
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 12)
    local s = Instance.new("UIStroke", btn)
    s.Color = color; s.Thickness = 2
    return btn, s
end

local noclipBtn, noclipStroke = createButton("NOCLIP: OFF", UDim2.new(0.075, 0, 0.22, 0), Color3.fromRGB(255, 0, 50))
local flyBtn, flyStroke = createButton("FLY: OFF", UDim2.new(0.075, 0, 0.42, 0), Color3.fromRGB(0, 150, 255))

-- [[ قسم السلايدر المعدل ]] --
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1, 0, 0, 30)
speedLabel.Position = UDim2.new(0, 0, 0.65, 0) -- قريبة من السلايدر
speedLabel.Text = "SPEED: 16"
speedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
speedLabel.Font = Enum.Font.GothamBlack
speedLabel.TextSize = 20
speedLabel.BackgroundTransparency = 1
speedLabel.Parent = mainFrame

local track = Instance.new("Frame")
track.Size = UDim2.new(0.8, 0, 0, 10)
track.Position = UDim2.new(0.1, 0, 0.82, 0)
track.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
track.Parent = mainFrame
Instance.new("UICorner", track)

local knob = Instance.new("TextButton")
knob.Size = UDim2.new(0, 26, 0, 26)
knob.Position = UDim2.new(0, 0, 0.5, -13)
knob.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
knob.Text = ""
knob.Parent = track
Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

-- [[ منطق البرمجة الموحد ]] --

noclipBtn.MouseButton1Click:Connect(function()
    noclipEnabled = not noclipEnabled
    noclipBtn.Text = noclipEnabled and "NOCLIP: ON" or "NOCLIP: OFF"
    noclipStroke.Color = noclipEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 50)
end)

local bg = Instance.new("BodyGyro"); local bv = Instance.new("BodyVelocity")
bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9); bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)

flyBtn.MouseButton1Click:Connect(function()
    flying = not flying
    flyBtn.Text = flying and "FLY: ON" or "FLY: OFF"
    flyStroke.Color = flying and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(0, 150, 255)
    if flying and player.Character then
        local root = player.Character:FindFirstChild("HumanoidRootPart")
        if root then
            bg.Parent = root; bv.Parent = root
            player.Character.Humanoid:PlatformStand(true)
        end
    else
        bg.Parent = nil; bv.Parent = nil
        if player.Character then player.Character.Humanoid:PlatformStand(false) end
    end
end)

-- سلايدر السرعة (بيغير الـ Speed للحالتين)
local dragging = false
knob.MouseButton1Down:Connect(function() dragging = true end)
UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local percent = math.clamp((input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
        knob.Position = UDim2.new(percent, -13, 0.5, -13)
        currentSpeed = math.floor(16 + (percent * 484))
        speedLabel.Text = "SPEED: " .. currentSpeed
    end
end)

-- الحلقة المركزية (التحديث اللحظي)
RunService.Stepped:Connect(function()
    local char = player.Character
    if char then
        -- نو كليب
        if noclipEnabled then
            for _, p in pairs(char:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = false end end
        end
        -- طيران (بيستخدم السرعة من السلايدر فوراً)
        if flying and char:FindFirstChild("HumanoidRootPart") then
            local dir = Vector3.new(0,0,0)
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + camera.CFrame.RightVector end
            bv.Velocity = dir * currentSpeed -- هنا السرعة بتتحدث لحظياً
            bg.CFrame = camera.CFrame
        end
        -- مشي عادي
        if char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = currentSpeed
        end
    end
end)
