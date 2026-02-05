-- [[ DragonHell Panel V3.3.1 - Mobile Master Fix ]] --
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera

local noclipEnabled = false
local flying = false
local currentSpeed = 16

-- [[ Language System (TEXT ONLY) ]] --
local currentLang = "EN"
local TEXT = {
    EN = {
        TITLE = "DRAGON.HELL",
        WALL_ON = "WALLHACK: ON",
        WALL_OFF = "WALLHACK: OFF",
        FLY_ON = "FLY: ON",
        FLY_OFF = "FLY: OFF",
        SPEED = "SPEED: "
    },
    AR = {
        TITLE = "يوسف العربي",
        WALL_ON = "اختراق الجدران: مفعّل",
        WALL_OFF = "اختراق الجدران: متوقف",
        FLY_ON = "الطيران: مفعّل",
        FLY_OFF = "الطيران: متوقف",
        SPEED = "السرعة: "
    }
}

-- 1. الواجهة
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DragonHellGui"
screenGui.Parent = game:GetService("CoreGui")
screenGui.ResetOnSpawn = false

-- [[ العلامة المائية ]] --
local watermark = Instance.new("TextLabel")
watermark.Size = UDim2.new(0, 800, 0, 100)
watermark.Position = UDim2.new(0.5, -400, 0.45, 0)
watermark.BackgroundTransparency = 1
watermark.TextColor3 = Color3.fromRGB(255, 255, 255)
watermark.Text = "DragonHell Panel Activated!"
watermark.Font = Enum.Font.GothamBlack
watermark.TextSize = 42
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
title.Text = TEXT.EN.TITLE
title.TextColor3 = Color3.fromRGB(0, 255, 255)
title.Font = Enum.Font.GothamBlack
title.TextSize = 24
title.BackgroundTransparency = 1
title.TextTransparency = 1
title.Parent = mainFrame

-- [[ زر تبديل اللغة ]] --
local langBtn = Instance.new("TextButton")
langBtn.Size = UDim2.new(0, 30, 0, 30)
langBtn.Position = UDim2.new(1, -35, 0, 5)
langBtn.BackgroundTransparency = 1
langBtn.Text = "🇬🇧" 
langBtn.TextSize = 20
langBtn.TextTransparency = 1
langBtn.Parent = mainFrame

-- [[ أنيميشن الدخول ]] --
task.spawn(function()
    TweenService:Create(watermark, TweenInfo.new(0.8), {TextTransparency = 0}):Play()
    TweenService:Create(wmStroke, TweenInfo.new(0.8), {Transparency = 0.5}):Play()
    task.wait(2.5)
    TweenService:Create(watermark, TweenInfo.new(0.6), {TextTransparency = 1}):Play()
    TweenService:Create(wmStroke, TweenInfo.new(0.6), {Transparency = 1}):Play()
    task.wait(0.6)
    TweenService:Create(mainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Quart),
        {BackgroundTransparency = 0.1, Position = UDim2.new(0.5, -120, 0.3, 0)}):Play()
    TweenService:Create(mainStroke, TweenInfo.new(0.6), {Transparency = 0}):Play()
    TweenService:Create(title, TweenInfo.new(0.6), {TextTransparency = 0}):Play()
    TweenService:Create(langBtn, TweenInfo.new(0.6), {TextTransparency = 0}):Play()
end)

local function fixCollision()
    local char = player.Character
    if char then
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = true end
        end
    end
end

local function createButton(text, pos, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.85, 0, 0, 50)
    btn.Position = pos
    btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.TextTransparency = 1
    btn.BackgroundTransparency = 1
    btn.Parent = mainFrame

    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 12)

    local s = Instance.new("UIStroke", btn)
    s.Color = color
    s.Thickness = 2
    s.Transparency = 1

    task.delay(3.8, function()
        TweenService:Create(btn, TweenInfo.new(0.5),
            {TextTransparency = 0, BackgroundTransparency = 0}):Play()
        TweenService:Create(s, TweenInfo.new(0.5), {Transparency = 0}):Play()
    end)
    return btn, s
end

local noclipBtn, noclipStroke =
    createButton(TEXT.EN.WALL_OFF, UDim2.new(0.075, 0, 0.22, 0), Color3.fromRGB(0, 150, 255))
local flyBtn, flyStroke =
    createButton(TEXT.EN.FLY_OFF, UDim2.new(0.075, 0, 0.42, 0), Color3.fromRGB(0, 150, 255))

noclipBtn.MouseButton1Click:Connect(function()
    noclipEnabled = not noclipEnabled
    noclipBtn.Text = noclipEnabled and TEXT[currentLang].WALL_ON or TEXT[currentLang].WALL_OFF
    noclipStroke.Color = noclipEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(0, 150, 255)
    if not noclipEnabled then fixCollision() end
end)

local bg = Instance.new("BodyGyro")
local bv = Instance.new("BodyVelocity")
bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)

flyBtn.MouseButton1Click:Connect(function()
    flying = not flying
    flyBtn.Text = flying and TEXT[currentLang].FLY_ON or TEXT[currentLang].FLY_OFF
    flyStroke.Color = flying and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(0, 150, 255)
    if flying and player.Character then
        local root = player.Character:FindFirstChild("HumanoidRootPart")
        if root then
            bg.Parent = root
            bv.Parent = root
            player.Character.Humanoid:PlatformStand(true)
        end
    else
        bg.Parent = nil
        bv.Parent = nil
        if player.Character then
            player.Character.Humanoid:PlatformStand(false)
            fixCollision()
        end
    end
end)

local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1, 0, 0, 30)
speedLabel.Position = UDim2.new(0, 0, 0.65, 0)
speedLabel.Text = TEXT.EN.SPEED .. currentSpeed
speedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
speedLabel.Font = Enum.Font.GothamBlack
speedLabel.TextSize = 22 -- تكبير بسيط لكلمة السرعة
speedLabel.BackgroundTransparency = 1
speedLabel.TextTransparency = 1
speedLabel.Parent = mainFrame

local track = Instance.new("Frame")
track.Size = UDim2.new(0.8, 0, 0, 10)
track.Position = UDim2.new(0.1, 0, 0.85, 0)
track.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
track.BackgroundTransparency = 1
track.Parent = mainFrame

local knob = Instance.new("TextButton")
knob.Size = UDim2.new(0, 26, 0, 26)
knob.Position = UDim2.new(0, 0, 0.5, -13)
knob.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
knob.Text = ""
knob.BackgroundTransparency = 1
knob.Parent = track
Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

task.delay(3.8, function()
    TweenService:Create(speedLabel, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
    TweenService:Create(track, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()
    TweenService:Create(knob, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()
end)

-- [[ إصلاح السلايدر ]] --
local dragging = false
local function updateSlider(input)
    local pos = input.Position.X
    local percent = math.clamp((pos - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
    knob.Position = UDim2.new(percent, -13, 0.5, -13)
    currentSpeed = math.floor(16 + (percent * 484))
    speedLabel.Text = TEXT[currentLang].SPEED .. currentSpeed
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = currentSpeed
    end
end

knob.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then dragging = true end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then dragging = false end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and
        (input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch) then
        updateSlider(input)
    end
end)

-- [[ التحكم في الحركة ]] --
RunService.RenderStepped:Connect(function()
    local char = player.Character
    if char then
        local humanoid = char:FindFirstChild("Humanoid")
        local root = char:FindFirstChild("HumanoidRootPart")

        if humanoid then humanoid.WalkSpeed = currentSpeed end

        if noclipEnabled then
            for _, p in pairs(char:GetDescendants()) do
                if p:IsA("BasePart") then p.CanCollide = false end
            end
        end

        if flying and root and humanoid then
            local moveDir = humanoid.MoveDirection
            if moveDir.Magnitude > 0 then
                local worldDir = camera.CFrame:VectorToWorldSpace(Vector3.new(
                    (UserInputService:IsKeyDown(Enum.KeyCode.D) and 1 or 0)
                    - (UserInputService:IsKeyDown(Enum.KeyCode.A) and 1 or 0),
                    0,
                    (UserInputService:IsKeyDown(Enum.KeyCode.S) and 1 or 0)
                    - (UserInputService:IsKeyDown(Enum.KeyCode.W) and 1 or 0)
                ))
                if moveDir.Magnitude > 0 and worldDir.Magnitude == 0 then
                    bv.Velocity = camera.CFrame.LookVector * (moveDir.Magnitude * currentSpeed)
                else
                    bv.Velocity = worldDir * currentSpeed
                end
            else
                bv.Velocity = Vector3.new(0, 0.1, 0)
            end
            bg.CFrame = camera.CFrame
        end
    end
end)

-- [[ تفعيل تبديل اللغة مع الخط الفخم ]] --
local function applyLanguage()
    title.Text = TEXT[currentLang].TITLE
    noclipBtn.Text = noclipEnabled and TEXT[currentLang].WALL_ON or TEXT[currentLang].WALL_OFF
    flyBtn.Text = flying and TEXT[currentLang].FLY_ON or TEXT[currentLang].FLY_OFF
    speedLabel.Text = TEXT[currentLang].SPEED .. currentSpeed
    
    if currentLang == "AR" then
        title.TextSize = 32
        title.Font = Enum.Font.Antique -- خط فخم جداً للعربي
        noclipStroke.Thickness = 1
        flyStroke.Thickness = 1
    else
        title.TextSize = 24
        title.Font = Enum.Font.GothamBlack
        noclipStroke.Thickness = 2
        flyStroke.Thickness = 2
    end
end

langBtn.MouseButton1Click:Connect(function()
    if currentLang == "EN" then
        currentLang = "AR"
        langBtn.Text = "🇪🇬"
    else
        currentLang = "EN"
        langBtn.Text = "🇬🇧"
    end
    applyLanguage()
end)
