-- [[ DragonHell Panel V3.1 - Premium Edition ]] --
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera

local noclipEnabled = false
local flying = false
local currentSpeed = 16

-- 1. الواجهة
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DragonHellGui"
screenGui.Parent = game:GetService("CoreGui")
screenGui.ResetOnSpawn = false

-- [[ العلامة المائية - DragonHell ]] --
local watermark = Instance.new("TextLabel")
watermark.Size = UDim2.new(0, 600, 0, 100)
watermark.Position = UDim2.new(0.5, -300, 0.45, 0)
watermark.BackgroundTransparency = 1
watermark.TextColor3 = Color3.fromRGB(255, 255, 255)
watermark.Text = "DragonHell activated!" -- الاسم الجديد هنا
watermark.Font = Enum.Font.GothamBlack
watermark.TextSize = 48 -- تكبير الخط للاسم الجديد
watermark.TextTransparency = 1
watermark.Parent = screenGui

local wmStroke = Instance.new("UIStroke", watermark)
wmStroke.Color = Color3.fromRGB(0, 255, 255)
wmStroke.Thickness = 2
wmStroke.Transparency = 1

-- [[ اللوحة الرئيسية ]] --
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 240, 0, 300)
mainFrame.Position = UDim2.new(0.5, -120, 0.35, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.BackgroundTransparency = 1
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner", mainFrame)
mainCorner.CornerRadius = UDim.new(0, 20)

local mainStroke = Instance.new("UIStroke", mainFrame)
mainStroke.Color = Color3.fromRGB(0, 255, 255)
mainStroke.Thickness = 3
mainStroke.Transparency = 1

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 60)
title.Text = "DRAGONHELL" -- العنوان الجديد
title.TextColor3 = Color3.fromRGB(0, 255, 255)
title.Font = Enum.Font.GothamBlack
title.TextSize = 24
title.BackgroundTransparency = 1
title.TextTransparency = 1
title.Parent = mainFrame

-- [[ تسلسل الأنيميشن ]] --
task.spawn(function()
    TweenService:Create(watermark, TweenInfo.new(0.8), {TextTransparency = 0}):Play()
    TweenService:Create(wmStroke, TweenInfo.new(0.8), {Transparency = 0.5}):Play()
    task.wait(2.2)
    TweenService:Create(watermark, TweenInfo.new(0.6), {TextTransparency = 1}):Play()
    TweenService:Create(wmStroke, TweenInfo.new(0.6), {Transparency = 1}):Play()
    task.wait(0.6)
    TweenService:Create(mainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Quart), {BackgroundTransparency = 0.1, Position = UDim2.new(0.5, -120, 0.3, 0)}):Play()
    TweenService:Create(mainStroke, TweenInfo.new(0.6), {Transparency = 0}):Play()
    TweenService:Create(title, TweenInfo.new(0.6), {TextTransparency = 0}):Play()
end)

-- دالة الأزرار الموحدة
local function createButton(text, pos, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.85, 0, 0, 50)
    btn.Position = pos
    btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    btn.Text = text; btn.TextColor3 = Color3.fromRGB(255, 255, 255); btn.Font = Enum.Font.GothamBold; btn.TextSize = 18
    btn.TextTransparency = 1; btn.BackgroundTransparency = 1; btn.Parent = mainFrame
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 12)
    local s = Instance.new("UIStroke", btn)
    s.Color = color; s.Thickness = 2; s.Transparency = 1
    task.delay(3.5, function()
        TweenService:Create(btn, TweenInfo.new(0.5), {TextTransparency = 0, BackgroundTransparency = 0}):Play()
        TweenService:Create(s, TweenInfo.new(0.5), {Transparency = 0}):Play()
    end)
    return btn, s
end

local noclipBtn, noclipStroke = createButton("NOCLIP: OFF", UDim2.new(0.075, 0, 0.22, 0), Color3.fromRGB(255, 0, 50))
local flyBtn, flyStroke = createButton("FLY: OFF", UDim2.new(0.075, 0, 0.42, 0), Color3.fromRGB(0, 150, 255))

-- سلايدر السرعة
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1, 0, 0, 30); speedLabel.Position = UDim2.new(0, 0, 0.65, 0)
speedLabel.Text = "SPEED: 16"; speedLabel.TextColor3 = Color3.fromRGB(255, 255, 255); speedLabel.Font = Enum.Font.GothamBlack; speedLabel.TextSize = 20; speedLabel.BackgroundTransparency = 1; speedLabel.TextTransparency = 1; speedLabel.Parent = mainFrame

local track = Instance.new("Frame")
track.Size = UDim2.new(0.8, 0, 0, 10); track.Position = UDim2.new(0.1, 0, 0.85, 0); track.BackgroundColor3 = Color3.fromRGB(40, 40, 40); track.BackgroundTransparency = 1; track.Parent = mainFrame
Instance.new("UICorner", track)

local knob = Instance.new("TextButton")
knob.Size = UDim2.new(0, 26, 0, 26); knob.Position = UDim2.new(0, 0, 0.5, -13); knob.BackgroundColor3 = Color3.fromRGB(0, 255, 255); knob.Text = ""; knob.BackgroundTransparency = 1; knob.Parent = track
Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

task.delay(3.5, function()
    TweenService:Create(speedLabel, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
    TweenService:Create(track, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()
    TweenService:Create(knob, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()
end)

-- [[ التحكم البرمجي ]] --
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
        if root then bg.Parent = root; bv.Parent = root; player.Character.Humanoid:PlatformStand(true) end
    else
        bg.Parent = nil; bv.Parent = nil
        if player.Character then player.Character.Humanoid:PlatformStand(false) end
    end
end)

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

RunService.Stepped:Connect(function()
    local char = player.Character
    if char then
        if noclipEnabled then for _, p in pairs(char:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = false end end end
        if flying and char:FindFirstChild("HumanoidRootPart") then
            local dir = Vector3.new(0,0,0)
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + camera.CFrame.RightVector end
            bv.Velocity = dir * currentSpeed; bg.CFrame = camera.CFrame
        end
        if char:FindFirstChild("Humanoid") then char.Humanoid.WalkSpeed = currentSpeed end
    end
end)
