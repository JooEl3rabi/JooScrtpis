-- [[ DragonHell Panel V4.2 - GodMode Wallhack Edition ]] --
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera

local wallhackEnabled = false
local flying = false
local currentSpeed = 16

-- محركات الطيران
local bg = Instance.new("BodyGyro")
local bv = Instance.new("BodyVelocity")
bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)

-- 1. الواجهة
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DragonHellV4_2"
screenGui.Parent = game:GetService("CoreGui")
screenGui.ResetOnSpawn = false

-- [[ شعار البداية الاحترافي ]] --
local watermark = Instance.new("TextLabel")
watermark.Size = UDim2.new(0, 800, 0, 100); watermark.Position = UDim2.new(0.5, -400, 0.45, 0)
watermark.BackgroundTransparency = 1; watermark.TextColor3 = Color3.fromRGB(255, 255, 255)
watermark.Text = "DragonHell Panel Activated!"; watermark.Font = Enum.Font.GothamBlack; watermark.TextSize = 45
watermark.TextTransparency = 1; watermark.Parent = screenGui
local wmStroke = Instance.new("UIStroke", watermark)
wmStroke.Color = Color3.fromRGB(0, 255, 255); wmStroke.Thickness = 3; wmStroke.Transparency = 1

task.spawn(function()
    TweenService:Create(watermark, TweenInfo.new(1), {TextTransparency = 0}):Play()
    TweenService:Create(wmStroke, TweenInfo.new(1), {Transparency = 0}):Play()
    task.wait(2.5)
    TweenService:Create(watermark, TweenInfo.new(0.8), {TextTransparency = 1}):Play()
    TweenService:Create(wmStroke, TweenInfo.new(0.8), {Transparency = 1}):Play()
end)

-- [[ اللوحة الرئيسية ]] --
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 240, 0, 300); mainFrame.Position = UDim2.new(0.5, -120, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10); mainFrame.Active = true; mainFrame.Draggable = true
mainFrame.Parent = screenGui; Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 20)
local mainStroke = Instance.new("UIStroke", mainFrame); mainStroke.Color = Color3.fromRGB(180, 0, 255); mainStroke.Thickness = 3

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 60); title.Text = "DRAGONHELL"; title.TextColor3 = Color3.fromRGB(0, 255, 255)
title.Font = Enum.Font.GothamBlack; title.TextSize = 24; title.BackgroundTransparency = 1; title.Parent = mainFrame

-- [[ دالة الـ God Mode المطورة ]] --
local function applyGodMode()
    local char = player.Character
    if char and char:FindFirstChild("Humanoid") then
        -- تعطيل قدرة اللعبة على قتل الشخصية عبر الـ States
        char.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
        -- جعل الصحة وهمية بحيث لا تتأثر باللمس (في بعض الألعاب)
        char.Humanoid.MaxHealth = math.huge
        char.Humanoid.Health = math.huge
        
        -- إزالة أي اهتمام بالتلامس من الأجزاء (TouchInterest)
        for _, v in pairs(char:GetDescendants()) do
            if v:IsA("TouchTransmitter") or v:IsA("TouchInterest") then
                v:Destroy()
            end
        end
    end
end

-- نظام الأزرار
local function createButton(text, pos, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.85, 0, 0, 50); btn.Position = pos; btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    btn.Text = text; btn.TextColor3 = Color3.fromRGB(255, 255, 255); btn.Font = Enum.Font.GothamBold; btn.TextSize = 18; btn.Parent = mainFrame
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 12)
    local s = Instance.new("UIStroke", btn); s.Color = color; s.Thickness = 2
    return btn, s
end

local wallBtn, wallStroke = createButton("WALLHACK: OFF", UDim2.new(0.075, 0, 0.22, 0), Color3.fromRGB(255, 0, 50))
local flyBtn, flyStroke = createButton("FLY: OFF", UDim2.new(0.075, 0, 0.42, 0), Color3.fromRGB(0, 150, 255))

wallBtn.MouseButton1Click:Connect(function()
    wallhackEnabled = not wallhackEnabled
    wallBtn.Text = wallhackEnabled and "WALLHACK: ON" or "WALLHACK: OFF"
    wallStroke.Color = wallhackEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 50)
    
    if wallhackEnabled then
        applyGodMode() -- تشغيل وضع الخلود مع الوال هاك
    end
end)

-- سلايدر السرعة
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1, 0, 0, 30); speedLabel.Position = UDim2.new(0, 0, 0.65, 0)
speedLabel.Text = "SPEED: 16"; speedLabel.TextColor3 = Color3.fromRGB(255, 255, 255); speedLabel.Font = Enum.Font.GothamBlack; speedLabel.TextSize = 20; speedLabel.BackgroundTransparency = 1; speedLabel.Parent = mainFrame
local track = Instance.new("Frame")
track.Size = UDim2.new(0.8, 0, 0, 10); track.Position = UDim2.new(0.1, 0, 0.85, 0); track.BackgroundColor3 = Color3.fromRGB(40, 40, 40); track.Parent = mainFrame
local knob = Instance.new("TextButton")
knob.Size = UDim2.new(0, 26, 0, 26); knob.Position = UDim2.new(0, 0, 0.5, -13); knob.BackgroundColor3 = Color3.fromRGB(0, 255, 255); knob.Text = ""; knob.Parent = track
Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

local dragging = false
knob.MouseButton1Down:Connect(function() dragging = true end)
UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local percent = math.clamp((input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
        knob.Position = UDim2.new(percent, -11, 0.5, -11)
        currentSpeed = math.floor(16 + (percent * 484))
        speedLabel.Text = "SPEED: " .. currentSpeed
    end
end)

-- Main Logic Loop
RunService.Stepped:Connect(function()
    local char = player.Character
    if char then
        if wallhackEnabled then
            for _, p in pairs(char:GetDescendants()) do 
                if p:IsA("BasePart") then p.CanCollide = false end 
            end
        end
        if flying and char:FindFirstChild("HumanoidRootPart") then
            local dir = Vector3.new(0,0,0)
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + camera.CFrame.RightVector end
            bv.Parent = char.HumanoidRootPart; bg.Parent = char.HumanoidRootPart
            bv.Velocity = dir * currentSpeed; bg.CFrame = camera.CFrame
        else
            bv.Parent = nil; bg.Parent = nil
        end
        if char:FindFirstChild("Humanoid") then char.Humanoid.WalkSpeed = currentSpeed end
    end
end)
