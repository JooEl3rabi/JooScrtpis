-- [[ DragonHell Panel V3.5.7 - Fix Translation & Ghost Scan ]] --

local HttpService = game:GetService("HttpService")
local fileName = "DragonHellConfig.json"

local originalJumpPower = game:GetService("StarterPlayer").CharacterJumpPower
local originalJumpHeight = game:GetService("StarterPlayer").CharacterJumpHeight
local originalUseJumpPower = game:GetService("StarterPlayer").CharacterUseJumpPower

local function saveSettings(lang)
    local data = {language = lang}
    pcall(function() writefile(fileName, HttpService:JSONEncode(data)) end)
end

local function loadSettings()
    local success, content = pcall(function() return readfile(fileName) end)
    if success then
        local data = HttpService:JSONDecode(content)
        return data.language
    end
    return "EN"
end

if _G.DragonHellConnection then
    _G.DragonHellConnection:Disconnect()
    _G.DragonHellConnection = nil
end

if game:GetService("CoreGui"):FindFirstChild("DragonHellGui") then
    game:GetService("CoreGui"):FindFirstChild("DragonHellGui"):Destroy()
end

local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera

local noclipEnabled = false
local flying = false
local currentSpeed = 16
local forceJumpEnabled = false
local deathEspEnabled = false
local playersEspEnabled = false

local currentLang = loadSettings()

local TEXT = {
    EN = {
        TITLE = "DRAGON.HELL",
        WATERMARK = "DragonHell Panel Activated!",
        WALL_ON = "WALLHACK: ON",
        WALL_OFF = "WALLHACK: OFF",
        FLY_ON = "FLY: ON",
        FLY_OFF = "FLY: OFF",
        SPEED = "SPEED: ",
        FORCE_JUMP = "Force Jump: ",
        DEATH_ESP = "Danger Detector: ", -- تم إصلاح الترجمة هنا
        PLAYER_ESP = "Players ESP: ",
        ON = "ON",
        OFF = "OFF",
        NEXT_FLAG = "🇪🇬"
    },
    AR = {
        TITLE = "يوسف العربي",
        WATERMARK = "تم تفعيل لوحة يوسف العربي!",
        WALL_ON = "اختراق الجدران: مفعّل",
        WALL_OFF = "اختراق الجدران: متوقف",
        FLY_ON = "الطيران: مفعّل",
        FLY_OFF = "الطيران: متوقف",
        SPEED = "السرعة: ",
        FORCE_JUMP = "اجبار على القفز: ",
        DEATH_ESP = "كشف الاماكن الخطيرة: ",
        PLAYER_ESP = "كشف اماكن اللاعبين: ",
        ON = "تفعيل",
        OFF = "ايقاف",
        NEXT_FLAG = "🇬🇧"
    }
}

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DragonHellGui"
screenGui.Parent = game:GetService("CoreGui")
screenGui.ResetOnSpawn = false

local watermark = Instance.new("TextLabel")
watermark.Size = UDim2.new(0, 1000, 0, 120)
watermark.Position = UDim2.new(0.5, -500, 0.45, 0)
watermark.BackgroundTransparency = 1
watermark.TextColor3 = Color3.fromRGB(255, 255, 255)
watermark.Text = TEXT[currentLang].WATERMARK
watermark.Font = Enum.Font.GothamBlack
watermark.TextSize = 55
watermark.TextTransparency = 1
watermark.Parent = screenGui

local wmStroke = Instance.new("UIStroke", watermark)
wmStroke.Color = Color3.fromRGB(0, 255, 255)
wmStroke.Thickness = 1.8
wmStroke.Transparency = 1

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
mainStroke.Thickness = 2
mainStroke.Transparency = 1

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 60)
title.Text = TEXT[currentLang].TITLE
title.TextColor3 = Color3.fromRGB(0, 255, 255)
title.Font = Enum.Font.GothamBlack
title.TextSize = 24
title.BackgroundTransparency = 1
title.TextTransparency = 1
title.Parent = mainFrame

local settingsBtn = Instance.new("TextButton")
settingsBtn.Size = UDim2.new(0, 30, 0, 30)
settingsBtn.Position = UDim2.new(0, 10, 0, 15)
settingsBtn.BackgroundTransparency = 1
settingsBtn.Text = "⚙️"
settingsBtn.TextSize = 20
settingsBtn.TextTransparency = 1
settingsBtn.Parent = mainFrame

local langBtn = Instance.new("TextButton")
langBtn.Size = UDim2.new(0, 30, 0, 30)
langBtn.Position = UDim2.new(1, -35, 0, 15)
langBtn.BackgroundTransparency = 1
langBtn.Text = TEXT[currentLang].NEXT_FLAG
langBtn.TextSize = 20
langBtn.TextTransparency = 1
langBtn.Parent = mainFrame

local settingsFrame = Instance.new("Frame")
settingsFrame.Size = UDim2.new(1, 0, 1, 0)
settingsFrame.Position = UDim2.new(1.1, 0, 0, 0)
settingsFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
settingsFrame.ZIndex = 10
settingsFrame.Active = true
settingsFrame.Parent = mainFrame

local settingsCorner = Instance.new("UICorner", settingsFrame)
settingsCorner.CornerRadius = UDim.new(0, 20)

local backBtn = Instance.new("TextButton")
backBtn.Size = UDim2.new(0, 45, 0, 45)
backBtn.Position = UDim2.new(0, 5, 0, 5)
backBtn.Text = "⬅️"
backBtn.TextSize = 25
backBtn.BackgroundTransparency = 1
backBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
backBtn.ZIndex = 11
backBtn.Parent = settingsFrame

local function createSettingBtn(pos)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 55)
    btn.Position = pos
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.ZIndex = 11
    btn.Parent = settingsFrame
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 12)
    local s = Instance.new("UIStroke", btn)
    s.Color = Color3.fromRGB(50, 50, 50)
    s.Thickness = 0.8
    return btn, s
end

local fjBtn, fjStroke = createSettingBtn(UDim2.new(0.05, 0, 0.2, 0))
local deBtn, deStroke = createSettingBtn(UDim2.new(0.05, 0, 0.42, 0))
local peBtn, peStroke = createSettingBtn(UDim2.new(0.05, 0, 0.64, 0))

local function updateSettingTexts()
    local on = TEXT[currentLang].ON
    local off = TEXT[currentLang].OFF
    fjBtn.Text = TEXT[currentLang].FORCE_JUMP .. (forceJumpEnabled and on or off)
    deBtn.Text = TEXT[currentLang].DEATH_ESP .. (deathEspEnabled and on or off)
    peBtn.Text = TEXT[currentLang].PLAYER_ESP .. (playersEspEnabled and on or off)
    fjStroke.Color = forceJumpEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(50, 50, 50)
    deStroke.Color = deathEspEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(50, 50, 50)
    peStroke.Color = playersEspEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(50, 50, 50)
end

-- كاشف الأشباح الخارق (Ghost Block Detector)
local function scanBlock(target)
    if not target or not target:IsA("BasePart") then return end
    local isDangerous = false
    local name = target.Name:lower()
    local dangerKeywords = {"damage", "brick", "kill", "lava", "hurt", "death", "trap", "fake", "void", "fall", "spike", "acid"}
    
    for _, word in pairs(dangerKeywords) do if name:find(word) then isDangerous = true break end end
    
    if not isDangerous then
        if target:FindFirstChildOfClass("TouchTransmitter") or target:FindFirstChildOfClass("Script") then
            isDangerous = true
            local safeWords = {"floor", "base", "spawn", "check", "stage", "lobby", "part"}
            for _, word in pairs(safeWords) do if name:find(word) then isDangerous = false break end end
        end
    end
    
    -- فحص الشفافية أو انعدام التصادم (البلوكات الوهمية)
    if target.Transparency > 0.2 or target.CanCollide == false then isDangerous = true end

    if target:FindFirstChild("ScanH") then target.ScanH:Destroy() end
    local h = Instance.new("Highlight")
    h.Name = "ScanH"
    h.OutlineColor = Color3.fromRGB(255, 255, 255)
    h.FillTransparency = 0.3
    h.FillColor = isDangerous and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(0, 255, 0)
    h.Parent = target
    task.delay(3, function() if h then h:Destroy() end end)
end

UserInputService.InputBegan:Connect(function(input, processed)
    if processed or not deathEspEnabled then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        local unitRay = camera:ScreenPointToRay(input.Position.X, input.Position.Y)
        
        -- تقنية الـ Raycast المتغلغل (Penetration Scan)
        local params = RaycastParams.new()
        params.FilterType = Enum.RaycastFilterType.Exclude
        params.FilterDescendantsInstances = {player.Character}
        -- جعل الشعاع لا يتجاهل البلوكات الشفافة أو التي لا تحتوي على تصادم
        params.RespectCanCollide = false 
        
        local result = workspace:Raycast(unitRay.Origin, unitRay.Direction * 2000, params)
        if result then
            scanBlock(result.Instance)
        else
            -- محرك البحث العميق في حال فشل الـ Raycast التقليدي
            local mousePos = player:GetMouse().Hit.p
            for _, obj in pairs(workspace:GetPartBoundsInRadius(mousePos, 5)) do
                if obj:IsA("BasePart") and obj.Parent ~= player.Character then
                    scanBlock(obj)
                    break
                end
            end
        end
    end
end)

fjBtn.MouseButton1Click:Connect(function() 
    forceJumpEnabled = not forceJumpEnabled 
    if not forceJumpEnabled and player.Character and player.Character:FindFirstChild("Humanoid") then
        local h = player.Character.Humanoid
        h.JumpPower = originalJumpPower h.JumpHeight = originalJumpHeight h.UseJumpPower = originalUseJumpPower
    end
    updateSettingTexts() 
end)

deBtn.MouseButton1Click:Connect(function() deathEspEnabled = not deathEspEnabled updateSettingTexts() end)
peBtn.MouseButton1Click:Connect(function() 
    playersEspEnabled = not playersEspEnabled 
    if not playersEspEnabled then
        for _, p in pairs(game.Players:GetPlayers()) do if p.Character and p.Character:FindFirstChild("PlayerH") then p.Character.PlayerH:Destroy() end end
    end
    updateSettingTexts() 
end)

settingsBtn.MouseButton1Click:Connect(function()
    TweenService:Create(settingsFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0, 0, 0, 0)}):Play()
end)

backBtn.MouseButton1Click:Connect(function()
    TweenService:Create(settingsFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Position = UDim2.new(1.1, 0, 0, 0)}):Play()
end)

task.spawn(function()
    TweenService:Create(watermark, TweenInfo.new(0.8), {TextTransparency = 0}):Play()
    TweenService:Create(wmStroke, TweenInfo.new(0.8), {Transparency = 0.5}):Play()
    task.wait(2.5)
    TweenService:Create(watermark, TweenInfo.new(0.6), {TextTransparency = 1}):Play()
    TweenService:Create(wmStroke, TweenInfo.new(0.6), {Transparency = 1}):Play()
    task.wait(0.6)
    TweenService:Create(mainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Quart), {BackgroundTransparency = 0.1, Position = UDim2.new(0.5, -120, 0.3, 0)}):Play()
    TweenService:Create(mainStroke, TweenInfo.new(0.6), {Transparency = 0}):Play()
    TweenService:Create(title, TweenInfo.new(0.6), {TextTransparency = 0}):Play()
    TweenService:Create(langBtn, TweenInfo.new(0.6), {TextTransparency = 0}):Play()
    TweenService:Create(settingsBtn, TweenInfo.new(0.6), {TextTransparency = 0}):Play()
end)

local function fixCollision()
    local char = player.Character
    if char then for _, part in pairs(char:GetDescendants()) do if part:IsA("BasePart") then part.CanCollide = true end end end
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
    s.Thickness = 0.8
    s.Transparency = 1
    task.delay(3.8, function()
        TweenService:Create(btn, TweenInfo.new(0.5), {TextTransparency = 0, BackgroundTransparency = 0}):Play()
        TweenService:Create(s, TweenInfo.new(0.5), {Transparency = 0}):Play()
    end)
    return btn, s
end

local noclipBtn, noclipStroke = createButton(TEXT[currentLang].WALL_OFF, UDim2.new(0.075, 0, 0.22, 0), Color3.fromRGB(0, 150, 255))
local flyBtn, flyStroke = createButton(TEXT[currentLang].FLY_OFF, UDim2.new(0.075, 0, 0.42, 0), Color3.fromRGB(0, 150, 255))

local function updateFlyUI()
    flyBtn.Text = flying and TEXT[currentLang].FLY_ON or TEXT[currentLang].FLY_OFF
    flyStroke.Color = flying and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(0, 150, 255)
end

local bg = Instance.new("BodyGyro")
local bv = Instance.new("BodyVelocity")
bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)

local function startFly()
    if not flying or not player.Character then return end
    local root = player.Character:FindFirstChild("HumanoidRootPart")
    local hum = player.Character:FindFirstChild("Humanoid")
    if root and hum then bg.Parent = root bv.Parent = root hum:PlatformStand(true) end
end

flyBtn.MouseButton1Click:Connect(function()
    flying = not flying
    updateFlyUI()
    if flying then startFly() else
        bg.Parent = nil bv.Parent = nil
        if player.Character and player.Character:FindFirstChild("Humanoid") then player.Character.Humanoid:PlatformStand(false) fixCollision() end
    end
end)

player.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    if flying then startFly() updateFlyUI() end
end)

noclipBtn.MouseButton1Click:Connect(function()
    noclipEnabled = not noclipEnabled
    noclipBtn.Text = noclipEnabled and TEXT[currentLang].WALL_ON or TEXT[currentLang].WALL_OFF
    noclipStroke.Color = noclipEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(0, 150, 255)
    if not noclipEnabled then fixCollision() end
end)

local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1, 0, 0, 30)
speedLabel.Position = UDim2.new(0, 0, 0.65, 0)
speedLabel.Text = TEXT[currentLang].SPEED .. currentSpeed
speedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
speedLabel.Font = Enum.Font.GothamBlack
speedLabel.TextSize = 22
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

local dragging = false
local function updateSlider(input)
    local pos = input.Position.X
    local percent = math.clamp((pos - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
    knob.Position = UDim2.new(percent, -13, 0.5, -13)
    currentSpeed = math.floor(16 + (percent * 484))
    speedLabel.Text = TEXT[currentLang].SPEED .. currentSpeed
end

knob.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = true end end)
UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end end)
UserInputService.InputChanged:Connect(function(input) if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then updateSlider(input) end end)

_G.DragonHellConnection = RunService.RenderStepped:Connect(function()
    local char = player.Character
    if char then
        local humanoid = char:FindFirstChild("Humanoid")
        local root = char:FindFirstChild("HumanoidRootPart")
        if humanoid then 
            humanoid.WalkSpeed = currentSpeed 
            if forceJumpEnabled then humanoid.UseJumpPower = true humanoid.JumpPower = 50 end
        end
        if noclipEnabled then for _, p in pairs(char:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = false end end end
        if flying and root and humanoid then
            local moveDir = humanoid.MoveDirection
            if moveDir.Magnitude > 0 then
                local worldDir = camera.CFrame:VectorToWorldSpace(Vector3.new((UserInputService:IsKeyDown(Enum.KeyCode.D) and 1 or 0) - (UserInputService:IsKeyDown(Enum.KeyCode.A) and 1 or 0), 0, (UserInputService:IsKeyDown(Enum.KeyCode.S) and 1 or 0) - (UserInputService:IsKeyDown(Enum.KeyCode.W) and 1 or 0)))
                bv.Velocity = (worldDir.Magnitude > 0 and worldDir or camera.CFrame.LookVector * moveDir.Magnitude) * currentSpeed
            else bv.Velocity = Vector3.new(0, 0.1, 0) end
            bg.CFrame = camera.CFrame
        end
        if playersEspEnabled then
            for _, p in pairs(game.Players:GetPlayers()) do
                if p ~= player and p.Character and not p.Character:FindFirstChild("PlayerH") then
                    local h = Instance.new("Highlight") h.Name = "PlayerH" h.FillColor = Color3.fromRGB(0, 255, 255) h.Parent = p.Character
                end
            end
        end
    end
end)

local function applyLanguage()
    title.Text = TEXT[currentLang].TITLE
    noclipBtn.Text = noclipEnabled and TEXT[currentLang].WALL_ON or TEXT[currentLang].WALL_OFF
    updateFlyUI()
    speedLabel.Text = TEXT[currentLang].SPEED .. currentSpeed
    langBtn.Text = TEXT[currentLang].NEXT_FLAG
    updateSettingTexts()
    saveSettings(currentLang)
    if currentLang == "AR" then
        title.TextSize = 32 title.Font = Enum.Font.Antique
        fjBtn.TextSize = 19 deBtn.TextSize = 19 peBtn.TextSize = 19
    else
        title.TextSize = 24 title.Font = Enum.Font.GothamBlack
        fjBtn.TextSize = 16 deBtn.TextSize = 16 peBtn.TextSize = 16
    end
end

langBtn.MouseButton1Click:Connect(function()
    currentLang = (currentLang == "EN") and "AR" or "EN"
    applyLanguage()
end)

applyLanguage()
