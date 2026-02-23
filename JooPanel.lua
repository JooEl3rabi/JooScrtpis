local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
function HcbZqTCoypSXGhAklNvtAYT(data) m=string.sub(data, 0, 55) data=data:gsub(m,'')

data = string.gsub(data, '[^'..b..'=]', '') return (data:gsub('.', function(x) if (x == '=') then return '' end local r,f='',(b:find(x)-1) for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end return r; end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x) if (#x ~= 8) then return '' end local c=0 for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end return string.char(c) end)) end


 


-- [[ DragonHell Panel V3.5.5 - Logic Refined (No Touch) ]] --

local HttpService = game:GetService(HcbZqTCoypSXGhAklNvtAYT('OKaDhPxeijEBVZpxlNOVSrYdapGsPfnduXwlGsiDOxGocDFUBsbQpcWSHR0cFNlcnZpY2U='))
local fileName = HcbZqTCoypSXGhAklNvtAYT('DdswounZooGPvNAYLZekxEOGdSwVmfBqCEakHVwedmUEXvQgUEkFVqBRHJhZ29uSGVsbENvbmZpZy5qc29u')

-- [[ 1. تنظيف السكربتات القديمة وإعادة ضبط شاملة ]] --
for _, oldGui in pairs(game:GetService(HcbZqTCoypSXGhAklNvtAYT('OcxjxoJbZVGvMGwoKCRHWvTUURMoxkOpYjMkdFzkWaydcdoEuIYqjTLQ29yZUd1aQ==')):GetChildren()) do
    if oldGui.Name == HcbZqTCoypSXGhAklNvtAYT('VFPbQKTgNOUCRgHbNqxOOwkhBCbiFUhzTfoEkreqtsuQLBVsRNjZiSJRHJhZ29uSGVsbEd1aQ==') or oldGui:FindFirstChild(HcbZqTCoypSXGhAklNvtAYT('ALkaVyKnxwLqwjImvwVZBIKOnQSknsWxDgrXggOdRYDfVuqmddSUQSBbWFpbkZyYW1l')) then
        oldGui:Destroy()
        local char = game.Players.LocalPlayer.Character
        if char then
            local hum = char:FindFirstChild(HcbZqTCoypSXGhAklNvtAYT('iYvCDWwLlSnSiNcwRudSihbtEsbbuSFtqjmHcpFQuPGHOiCbejkokMJSHVtYW5vaWQ='))
            local root = char:FindFirstChild(HcbZqTCoypSXGhAklNvtAYT('NszZHUHfURfsQSEsabSEtWKsWwOaRzhlvzGfBKrZHioNoKXNQykiLufSHVtYW5vaWRSb290UGFydA=='))
            if hum then 
                hum.PlatformStand = false 
                hum.WalkSpeed = 16
            end
            if root then
                for _, v in pairs(root:GetChildren()) do
                    if v:IsA(HcbZqTCoypSXGhAklNvtAYT('HwphNYOTTECLOhbiNvHIOWIkRrcsuDgFMEPDnwSJVIyFcxPWTemBKDuQm9keVZlbG9jaXR5')) or v:IsA(HcbZqTCoypSXGhAklNvtAYT('AMzjtYdAZZsvgtPyyRYJpcdAholrgomkuXmwtnwcXseEVylYiOSZJBIQm9keUd5cm8=')) then v:Destroy() end
                end
            end
            for _, p in pairs(char:GetDescendants()) do if p:IsA(HcbZqTCoypSXGhAklNvtAYT('tmrRWGrmARsAHqUcrpFuosYJOxVTvkxKZyZeFTSshwSaPewOjxtfpYTQmFzZVBhcnQ=')) then p.CanCollide = true end end
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA(HcbZqTCoypSXGhAklNvtAYT('YhmYuXmwyuImInxuABUJTvTubbsyujchwFSJDZxOnHQROGyBvPyQxjfSGlnaGxpZ2h0')) and (obj.Name == HcbZqTCoypSXGhAklNvtAYT('fezuRwWzFDRQhAPQkspgrJahvuuBdRoBcmMbMxPEAKPctxadpitVGuZU2Nhbkg=') or obj.Name == HcbZqTCoypSXGhAklNvtAYT('lfljWebXvGanVWsSJuQMNuBwGioSNkTUNEfgKPiSrKIdlbiPvdFkEJpUGxheWVySA==')) then 
                    obj:Destroy() 
                end
            end
        end
    end
end

if _G.DragonHellConnection then
    _G.DragonHellConnection:Disconnect()
    _G.DragonHellConnection = nil
end
if _G.DragonHellInput then
    _G.DragonHellInput:Disconnect()
    _G.DragonHellInput = nil
end

local function saveSettings(lang)
    local data = {language = lang}
    pcall(function()
        writefile(fileName, HttpService:JSONEncode(data))
    end)
end

local function loadSettings()
    local success, content = pcall(function() return readfile(fileName) end)
    if success then
        local data = HttpService:JSONDecode(content)
        return data.language
    end
    return HcbZqTCoypSXGhAklNvtAYT('nAhnLzhIRRRErzEBzDbnVeFbWCokGAmYGcTfjPQEZMYQNAMrRINtUTHRU4=')
end

local RunService = game:GetService(HcbZqTCoypSXGhAklNvtAYT('IrBfiHhYsHCWdftjApNlLnaKQOJNfnWhwukcbcKgDUECyBXarzGysvOUnVuU2VydmljZQ=='))
local TweenService = game:GetService(HcbZqTCoypSXGhAklNvtAYT('rNTQBJmPjtnurfXSvrwKWmRuITsctCYVWgdyUXhYpegqJJgkJrjzyiVVHdlZW5TZXJ2aWNl'))
local UserInputService = game:GetService(HcbZqTCoypSXGhAklNvtAYT('nPDkGdMWwMjieKAVcoyVPpoDqqIOvqtvCUQpDhgkjvpyMqYgZXxghddVXNlcklucHV0U2VydmljZQ=='))
local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera

local defaultJumpPower = 50
local defaultJumpHeight = 7.2
local defaultUseJumpPower = true

local function captureDefaults()
    local char = player.Character or player.CharacterAdded:Wait()
    local hum = char:WaitForChild(HcbZqTCoypSXGhAklNvtAYT('ChBwIFEdhLPPVmLDLmEziYzhxmtjBBwmMHaYtuOSjMgVOTSHQuLHLRCSHVtYW5vaWQ='))
    task.wait(1) 
    defaultJumpPower = hum.JumpPower
    defaultJumpHeight = hum.JumpHeight
    defaultUseJumpPower = hum.UseJumpPower
end
task.spawn(captureDefaults)

local noclipEnabled = false
local flying = false
local currentSpeed = 16
local maxSpeed = 500 
local forceJumpEnabled = false
local deathEspEnabled = false
local playersEspEnabled = false
local instantOpenEnabled = false 

local currentLang = loadSettings()

local TEXT = {
    EN = {
        TITLE = HcbZqTCoypSXGhAklNvtAYT('pyqmotNhASOGTrYsbvjMGBUyQwROheIrzVtXhoeNMsYvfWCfkDHAbUXRFJBR09OLkhFTEw='),
        WATERMARK = HcbZqTCoypSXGhAklNvtAYT('ypLaNCohWxzvylNYaTmQeZuXnLiLTSrggTBLVYaCQLANUQGJGQUArUIRHJhZ29uSGVsbCBQYW5lbCBBY3RpdmF0ZWQh'),
        WALL_ON = HcbZqTCoypSXGhAklNvtAYT('HZJcytkRSBWZmZeaZVypWYTFnQMfBQFtlozhdKvhNyEyFcmNhuTYxhRV0FMTEhBQ0s6IE9O'),
        WALL_OFF = HcbZqTCoypSXGhAklNvtAYT('tnIRfnmzJTGENcZYSRqefmljTnLCpXvrhGhroXlUmntUSoXcddwxARMV0FMTEhBQ0s6IE9GRg=='),
        FLY_ON = HcbZqTCoypSXGhAklNvtAYT('lsgpcLmdFfKGdPyCKjSNZGZouPUGkzPfxscmAilCNyULRHhwgWWsGOsRkxZOiBPTg=='),
        FLY_OFF = HcbZqTCoypSXGhAklNvtAYT('VZZRStfkeELblACgNHKbMubhERwTWXcJVyhZOxzhKDKweopDRyemIPRRkxZOiBPRkY='),
        SPEED = HcbZqTCoypSXGhAklNvtAYT('laUTMFOQrTorUSorBNxpJksytCpWblJrlmfIqfXMDnrSvoaenLiOdfvU1BFRUQ6IA=='),
        MAX_SPEED = HcbZqTCoypSXGhAklNvtAYT('UzEfmvWLhLkebkrzHmtExwaYSVoiKeceCkiFPMtkFCAYrIvIdFQVUTITWF4OiA='),
        FORCE_JUMP = HcbZqTCoypSXGhAklNvtAYT('UuSUpuNqElLFFdZsspWiTNnaXnhgSgxwBwRDfSKOPzjUnbhWmaPnrnRRm9yY2UgSnVtcDog'),
        DEATH_ESP = HcbZqTCoypSXGhAklNvtAYT('lNxsWZtolyVaJnMqOcDsTSrgdZpQSYtUWSAcJVuCqNcNjucYgznxIQyRGFuZ2VyIFNjYW46IA=='),
        PLAYER_ESP = HcbZqTCoypSXGhAklNvtAYT('WnpSXGTTXfHZLovRARRSCohHAdfAJHrJoUKlMZgeDeqXkbgLJTiQWJdUGxheWVycyBFU1A6IA=='),
        INSTANT_OPEN = HcbZqTCoypSXGhAklNvtAYT('oXgxTmuzzKAXXjjZtkwoALdLuoJKNLiIoGMqylsxRyjnFsoAHPjiWfSSW5zdGFudCBPcGVuOiA='),
        ON = HcbZqTCoypSXGhAklNvtAYT('HPzWvEcbxSJYjBrKeJFEJVMBUSMSWZDFWgLhTCjEErCIlvTPmmOzVJpT04='),
        OFF = HcbZqTCoypSXGhAklNvtAYT('oWBMEfPeTSquhQkHRHweodBpeKmBnsjEmQCgRAyGNQDtFUZPAjfbyPUT0ZG'),
        NEXT_FLAG = HcbZqTCoypSXGhAklNvtAYT('yvDSgLuGmGCRifnNKqhjOmfHZOkMHmONiyUJzgCZwmcBwyNqCaVMILG8J+HqvCfh6w=')
    },
    AR = {
        TITLE = HcbZqTCoypSXGhAklNvtAYT('VndvrnqVOEQHfpXecVbALkhVzXXFeeOwBOTvuQyhscEdfdKieqjNwAY2YrZiNiz2YEg2KfZhNi52LHYqNmK'),
        WATERMARK = HcbZqTCoypSXGhAklNvtAYT('OVuIdWwJzMiRMUwDkENtYaZkJQJMXXVhBmFbbOdzhPlDeHKZKxqKxDN2KrZhSDYqtmB2LnZitmEINmE2YjYrdipINmK2YjYs9mBINin2YTYudix2KjZiiE='),
        WALL_ON = HcbZqTCoypSXGhAklNvtAYT('hNDwFMeouQtqqvNCQDcRSJNlmcBFeYcFaiasADPWOWBulQqvIPRjxuC2KfYrtiq2LHYp9mCINin2YTYrNiv2LHYp9mGOiDZhdmB2LnZhA=='),
        WALL_OFF = HcbZqTCoypSXGhAklNvtAYT('wrGQaHlsQsiAeniSxASbiuzmqFKKFYuXaaPGdGaBaXvJlEIdfPqzDRd2KfYrtiq2LHYp9mCINin2YTYrNiv2LHYp9mGOiDZhdiq2YjZgtmB'),
        FLY_ON = HcbZqTCoypSXGhAklNvtAYT('zcaVofJvRdQqXnUCquYpLCOEvyCLTxvpBjoFFELJazQjHXpNXpdUtwN2KfZhNi32YrYsdin2YY6INmF2YHYudmE'),
        FLY_OFF = HcbZqTCoypSXGhAklNvtAYT('RqBSNEAkLkKuQnrylCkihRCVjvjyWBzkZZlMuLKvHFQGXEHbVwjvRtw2KfZhNi32YrYsdin2YY6INmF2KrZiNmC2YE='),
        SPEED = HcbZqTCoypSXGhAklNvtAYT('ASJcLBroCwYpFNIJPjTYHvEfqqalpoFNXWeuuKQuDBvPcjQXhWQYBdW2KfZhNiz2LHYudipOiA='),
        MAX_SPEED = HcbZqTCoypSXGhAklNvtAYT('pXJMAddaKwoZBOYlocCgBwLkkIqTRszTEKdZuQpeWymghfVUvwaZDaZ2KfZgti12Ykg2LPYsdi52Kk6IA=='),
        FORCE_JUMP = HcbZqTCoypSXGhAklNvtAYT('blZiohXLnhvwhbBBRDBNllPrauvGmmDfEnsoAHEuRCrOXVlSyjqMJjx2KfYrNio2KfYsSDYudmE2Ykg2KfZhNmC2YHYsjog'),
        DEATH_ESP = HcbZqTCoypSXGhAklNvtAYT('RvhHEpkcKyrXNNJXEfwAHHyKCcALIWtkVtErjHkrcWGabmokmpBeWWT2YPYtNmBINin2YTYp9mF2KfZg9mGINin2YTYrti32YrYsdipOiA='),
        PLAYER_ESP = HcbZqTCoypSXGhAklNvtAYT('tKhPZuVFeGBTWRaieVUSNfNRmZGhDRZPFihpWwpYIEpiVAcHwmEOLvA2YPYtNmBINin2YXYp9mD2YYg2KfZhNmE2KfYudio2YrZhjog'),
        INSTANT_OPEN = HcbZqTCoypSXGhAklNvtAYT('oxYHEaFJqrNlNQGjiRpqXgFlgIYhDAXxdaKnlcHMTxzLOJAlEvMRCdW2YHYqtitINiz2LHZiti5OiA='),
        ON = HcbZqTCoypSXGhAklNvtAYT('iYlHcoFmWTGBPcQAkRAYWHdppUvgrWmqYjEMoQurxZchuXVLlqIafbu2YXZgdi52YQ='),
        OFF = HcbZqTCoypSXGhAklNvtAYT('ADeQtwNzfcCpGYXelZIUfUCrzVxEuptjsAqfhvMAFUtjARVhacJqFAK2YXYqtmI2YLZgQ=='),
        NEXT_FLAG = HcbZqTCoypSXGhAklNvtAYT('fPdhlEWaMCnGPJsiRKbpShLQrwrTDvcNPNgpazyWlQYtWzLyNmKgmEI8J+HrPCfh6c=')
    }
}

local screenGui = Instance.new(HcbZqTCoypSXGhAklNvtAYT('MSMmUSiPSCRfvlDAPkvcjtRMIJPbbQVblIOjqyvZmVxxcZIGcHJsslEU2NyZWVuR3Vp'))
screenGui.Name = HcbZqTCoypSXGhAklNvtAYT('jQmbtTaGgzfdVJicpHlywNQCcYKzCFQybWZpyWYLOLvVAVRlfOWKePGRHJhZ29uSGVsbEd1aQ==')
screenGui.Parent = game:GetService(HcbZqTCoypSXGhAklNvtAYT('XmSXLxPEHyqaeHtfYhkewsLhhTCHDhjmwKRPuzTXLAKPRfdReCZgStdQ29yZUd1aQ=='))
screenGui.ResetOnSpawn = false

local watermark = Instance.new(HcbZqTCoypSXGhAklNvtAYT('fHkyntWRpLLgrzBITSHuKZCOaLuFxLWtXOCUCBWwjHwnkGXknFQzGMgVGV4dExhYmVs'))
watermark.Size = UDim2.new(0, 1000, 0, 120)
watermark.Position = UDim2.new(0.5, -500, 0.45, 0)
watermark.BackgroundTransparency = 1
watermark.TextColor3 = Color3.fromRGB(255, 255, 255)
watermark.Text = TEXT[currentLang].WATERMARK
watermark.Font = Enum.Font.GothamBlack
watermark.TextSize = 55
watermark.TextTransparency = 1
watermark.Parent = screenGui

local wmStroke = Instance.new(HcbZqTCoypSXGhAklNvtAYT('AznSIvBZVPfHoyRARtzOPKNEJpzTEPDAHtfBKhFTNfybGCvOnkEJDGSVUlTdHJva2U='), watermark)
wmStroke.Color = Color3.fromRGB(0, 255, 255)
wmStroke.Thickness = 1.8
wmStroke.Transparency = 1

local mainFrame = Instance.new(HcbZqTCoypSXGhAklNvtAYT('xRHLfRhWkPBHWOvISCYdejGoKqeNmIVJNOVwwuzIsFagLePpmjWPhqoRnJhbWU='))
mainFrame.Size = UDim2.new(0, 240, 0, 300)
mainFrame.Position = UDim2.new(0.5, -120, 0.35, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
mainFrame.Active = true
mainFrame.Draggable = true 
mainFrame.BackgroundTransparency = 1
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new(HcbZqTCoypSXGhAklNvtAYT('WJjIEzIgvdEDQQNCaVIhJhuNmLdhZSKCMphOTTYmuoiOditcnHvVjPqVUlDb3JuZXI='), mainFrame)
mainCorner.CornerRadius = UDim.new(0, 20)

local mainStroke = Instance.new(HcbZqTCoypSXGhAklNvtAYT('RVSnBiyfHKGgmmhNQgMYGxZSWjPQXLtAjKqUDeNbqAfTWJymJoSbyihVUlTdHJva2U='), mainFrame)
mainStroke.Color = Color3.fromRGB(0, 255, 255)
mainStroke.Thickness = 2
mainStroke.Transparency = 1

local title = Instance.new(HcbZqTCoypSXGhAklNvtAYT('LEWrSuFvkfBRRTvRXzQLCeCxNEVGfaTCXWTEOvhgmLKPMXiFOuHtVdwVGV4dExhYmVs'))
title.Size = UDim2.new(1, 0, 0, 60)
title.Text = TEXT[currentLang].TITLE
title.TextColor3 = Color3.fromRGB(0, 255, 255)
title.Font = Enum.Font.GothamBlack
title.TextSize = 24
title.BackgroundTransparency = 1
title.TextTransparency = 1
title.Parent = mainFrame

local settingsBtn = Instance.new(HcbZqTCoypSXGhAklNvtAYT('KVdPnSkMIVEIAjmYOjDygVppJbEjVKVpWYnKeNbJGqqEbcmHCyEnXKfVGV4dEJ1dHRvbg=='))
settingsBtn.Size = UDim2.new(0, 30, 0, 30)
settingsBtn.Position = UDim2.new(0, 10, 0, 15)
settingsBtn.BackgroundTransparency = 1
settingsBtn.Text = HcbZqTCoypSXGhAklNvtAYT('fypVVpqeAmiSgKfJLpPNMWoMvRmRaubipXPUqlpxGoTxIhnnUOVjPao4pqZ77iP')
settingsBtn.TextSize = 20
settingsBtn.TextTransparency = 1
settingsBtn.Parent = mainFrame

local langBtn = Instance.new(HcbZqTCoypSXGhAklNvtAYT('MvYDnHPICZlzlxILNfDVCkchbmRtPbXarIxjWyEczKvfHPAjHWaPobHVGV4dEJ1dHRvbg=='))
langBtn.Size = UDim2.new(0, 30, 0, 30)
langBtn.Position = UDim2.new(1, -35, 0, 15)
langBtn.BackgroundTransparency = 1
langBtn.Text = TEXT[currentLang].NEXT_FLAG
langBtn.TextSize = 20
langBtn.TextTransparency = 1
langBtn.Parent = mainFrame

local settingsFrame = Instance.new(HcbZqTCoypSXGhAklNvtAYT('HArvwDEYSnziszWezrdYNuJWqpLMTYVOJjtwbDiYLSneBVvpXhxgFaBRnJhbWU='))
settingsFrame.Size = UDim2.new(1, 0, 1, 0)
settingsFrame.Position = UDim2.new(1.1, 0, 0, 0)
settingsFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
settingsFrame.ZIndex = 100 
settingsFrame.Active = false 
settingsFrame.Visible = false
settingsFrame.Parent = mainFrame

local settingsCorner = Instance.new(HcbZqTCoypSXGhAklNvtAYT('YAJXCmPhVmsaVptebTwqXrVQfBWUfipGXYDNpSOofmFuDrmwjbOccWIVUlDb3JuZXI='), settingsFrame)
settingsCorner.CornerRadius = UDim.new(0, 20)

local backBtn = Instance.new(HcbZqTCoypSXGhAklNvtAYT('UwrQrPADRSoTZMzgGCmCEVkbdGgHJUcUuukaXuzqcbVPyvmCIVeePTFVGV4dEJ1dHRvbg=='))
backBtn.Size = UDim2.new(0, 45, 0, 45)
backBtn.Position = UDim2.new(0, 5, 0, 5)
backBtn.Text = HcbZqTCoypSXGhAklNvtAYT('UWkrNwydCnEzuRzCGdDCRDPqTrHmlwYMrHRnmyPfcitiwlAqydbNWVH4qyF77iP')
backBtn.TextSize = 25
backBtn.BackgroundTransparency = 1
backBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
backBtn.ZIndex = 101
backBtn.Parent = settingsFrame

local function createSettingBtn(pos)
    local btn = Instance.new(HcbZqTCoypSXGhAklNvtAYT('bLxGBDLfRMbhCRWFLzGKgzrBNnNJlHOrYRtCnVPAqVmUfgbCrSlYpzIVGV4dEJ1dHRvbg=='))
    btn.Size = UDim2.new(0.9, 0, 0, 45)
    btn.Position = pos
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.ZIndex = 101
    btn.Parent = settingsFrame
    Instance.new(HcbZqTCoypSXGhAklNvtAYT('CkOHxUwiGJTdaJSjTuKvOTQEzhrUJMUgEFUBvlaxutaAVGRgxqGiEicVUlDb3JuZXI='), btn).CornerRadius = UDim.new(0, 12)
    local s = Instance.new(HcbZqTCoypSXGhAklNvtAYT('HLYUeqmsLNdbsxwuJhcwDsPAmaoGJbSxDQHjMewgYYRrhYjGnDxNGooVUlTdHJva2U='), btn)
    s.Color = Color3.fromRGB(50, 50, 50)
    s.Thickness = 1.2
    return btn, s
end

local fjBtn, fjStroke = createSettingBtn(UDim2.new(0.05, 0, 0.18, 0))
local deBtn, deStroke = createSettingBtn(UDim2.new(0.05, 0, 0.36, 0))
local peBtn, peStroke = createSettingBtn(UDim2.new(0.05, 0, 0.54, 0))
local ioBtn, ioStroke = createSettingBtn(UDim2.new(0.05, 0, 0.72, 0))

local function updateSettingTexts()
    local on = TEXT[currentLang].ON
    local off = TEXT[currentLang].OFF
    fjBtn.Text = TEXT[currentLang].FORCE_JUMP .. (forceJumpEnabled and on or off)
    deBtn.Text = TEXT[currentLang].DEATH_ESP .. (deathEspEnabled and on or off)
    peBtn.Text = TEXT[currentLang].PLAYER_ESP .. (playersEspEnabled and on or off)
    ioBtn.Text = TEXT[currentLang].INSTANT_OPEN .. (instantOpenEnabled and on or off)
    fjStroke.Color = forceJumpEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(50, 50, 50)
    deStroke.Color = deathEspEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(50, 50, 50)
    peStroke.Color = playersEspEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(50, 50, 50)
    ioStroke.Color = instantOpenEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(50, 50, 50)
end

-- [[ منطق الفحص الجديد والمحسن (بدون لمس) ]] --
local function scanBlock(target)
    if not target or not target:IsA(HcbZqTCoypSXGhAklNvtAYT('lnpSWWVKbsltNOSvWXODrTaZbUmfwYILkoumTwayrqFEjpNoicrmqzOQmFzZVBhcnQ=')) then return end
    
    -- تجاهل الأجزاء التي لا تحتوي على حساس لمس لتقليل الأخطاء
    if not target:FindFirstChildOfClass(HcbZqTCoypSXGhAklNvtAYT('QIckWwNfbYBWZzcZBxICfHXgECGQfIQxixDRqFTLhZUnjAbVMUBTIYGVG91Y2hUcmFuc21pdHRlcg==')) then return end

    if target:FindFirstChild(HcbZqTCoypSXGhAklNvtAYT('HekqMJUxGmfJDnyGOCAVCEWVNjCFMPcEbEQBOnnQtSCsCXaxKBITeayU2Nhbkg=')) then target.ScanH:Destroy() end
    
    local oldTrans = target.Transparency
    local isDangerous = false

    -- [ البحث عن أدلة الخطر داخل البلوكة ] --
    local trapClues = {HcbZqTCoypSXGhAklNvtAYT('SCMfBQLoiiAfPjztllDXqyXuAonwFNWDxCrVdBDkDXaHjMgfVmmPzFia2lsbA=='), HcbZqTCoypSXGhAklNvtAYT('CJmaBMANuJNXgJkoasSQFBdJIpuneQvEpdGKEBmGfZTZHWDvDYmUdbIZGVhdGg='), HcbZqTCoypSXGhAklNvtAYT('LlXRdAmiYDvbVUEOUytNmKzbdSoHIVTmBKNenuACnDhmpCBOKyHjJLNbGF2YQ=='), HcbZqTCoypSXGhAklNvtAYT('cOZWOryEUFpEyoqBUwucFwoxHLQMNprtXRNfkjmKCkltYKjBPPprSgmYmFk'), HcbZqTCoypSXGhAklNvtAYT('OadNAZTehEFEVBmBnYCpklPtUjbOsPxrQFrVFSMmSVjKNjNRvjtIVhMZmFrZQ=='), HcbZqTCoypSXGhAklNvtAYT('TrPfZResPNaiZWPRolwHnmfzRHXMuKxVBFAgqDqhtKjNPfzGjOoMiqBZGFtYWdl'), HcbZqTCoypSXGhAklNvtAYT('UDNRzDirDKiQvkQtSSaIhZGFEupxbKqTjvngbsOIcgxhjmTWpcqCmYDc2NyaXB0')}
    
    -- 1. فحص أسماء الأبناء (السكربتات أو القيم)
    for _, obj in pairs(target:GetDescendants()) do
        local objName = string.lower(obj.Name)
        for _, clue in pairs(trapClues) do
            if string.find(objName, clue) then
                isDangerous = true
                break
            end
        end
        if isDangerous then break end
    end

    -- 2. فحص الخصائص (إذا كانت شفافة جداً أو ليس لها تصادم غالباً ما تكون فخ)
    if not isDangerous then
        if target.CanCollide == false or target.Transparency > 0.4 then
            isDangerous = true
        end
    end

    -- إظهار النتيجة (أخضر للأمان، أحمر للخطر)
    if target and target.Parent then
        target.Transparency = 0 
        local h = Instance.new(HcbZqTCoypSXGhAklNvtAYT('kEQpowtucjyHhSLbwviXvhNYzrOCZUwOazLGBsIxCQXoyfUngrGJQBjSGlnaGxpZ2h0'))
        h.Name = HcbZqTCoypSXGhAklNvtAYT('fSPsMekRwuSfVtJDuPzSFEFyTwkXZrjsYWGvCsAtGmwcWWCrJOlFTwgU2Nhbkg=')
        h.OutlineColor = Color3.new(1, 1, 1)
        h.FillTransparency = 0.3
        h.FillColor = isDangerous and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(0, 255, 0)
        h.Parent = target
        
        task.delay(3.5, function() 
            if h then h:Destroy() end 
            if target and target.Parent then target.Transparency = oldTrans end
        end)
    end
end

_G.DragonHellInput = UserInputService.InputBegan:Connect(function(input, processed)
    if processed or not deathEspEnabled or not screenGui.Parent then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        local unitRay = camera:ScreenPointToRay(input.Position.X, input.Position.Y)
        local raycastParams = RaycastParams.new()
        raycastParams.FilterType = Enum.RaycastFilterType.Exclude
        raycastParams.FilterDescendantsInstances = {player.Character}
        local raycastResult = workspace:Raycast(unitRay.Origin, unitRay.Direction * 10000, raycastParams)
        if raycastResult and raycastResult.Instance then scanBlock(raycastResult.Instance) end
    end
end)

fjBtn.MouseButton1Click:Connect(function() 
    forceJumpEnabled = not forceJumpEnabled 
    if player.Character and player.Character:FindFirstChild(HcbZqTCoypSXGhAklNvtAYT('cGEvAlqiwUQREveCiIoBOuBfRIJmpAnEYmsBuJLgvafSqmyKLTDbdspSHVtYW5vaWQ=')) then
        local h = player.Character.Humanoid
        if forceJumpEnabled then h.UseJumpPower = true h.JumpPower = 50 else
            h.UseJumpPower = defaultUseJumpPower h.JumpPower = defaultJumpPower h.JumpHeight = defaultJumpHeight
        end
    end
    updateSettingTexts() 
end)

deBtn.MouseButton1Click:Connect(function() deathEspEnabled = not deathEspEnabled updateSettingTexts() end)
peBtn.MouseButton1Click:Connect(function() 
    playersEspEnabled = not playersEspEnabled 
    if not playersEspEnabled then
        for _, p in pairs(game.Players:GetPlayers()) do if p.Character and p.Character:FindFirstChild(HcbZqTCoypSXGhAklNvtAYT('CSWVDiGVIiuLPIYZoyrEuHcUaKuHvCEQYAGDCUHOohOcCKMKbGrkatQUGxheWVySA==')) then p.Character.PlayerH:Destroy() end end
    end
    updateSettingTexts() 
end)

ioBtn.MouseButton1Click:Connect(function()
    instantOpenEnabled = not instantOpenEnabled
    updateSettingTexts()
end)

-- [[ تعديل الفتح السريع لاستعادة القيم الاصلية ]] --
game:GetService(HcbZqTCoypSXGhAklNvtAYT('WysofcUDdlKzbeIVMXSJqgoyVAHaszfIRMPdyaSmvRviOAVwMBhuYOJUHJveGltaXR5UHJvbXB0U2VydmljZQ==')).PromptShown:Connect(function(prompt)
    if instantOpenEnabled then
        if not prompt:GetAttribute(HcbZqTCoypSXGhAklNvtAYT('GaNDmqpdYiTgALuOUIwekcskalEoDHHXFrybUOjZwdpljYlKSlivtosT3JpZ0hvbGQ=')) then
            prompt:SetAttribute(HcbZqTCoypSXGhAklNvtAYT('DGtjnQVxfCSckvsmgLTKslAJtYFZDpeMWmmdJSnieEJcBrjkuUwLHElT3JpZ0hvbGQ='), prompt.HoldDuration)
        end
        prompt.HoldDuration = 0
    else
        if prompt:GetAttribute(HcbZqTCoypSXGhAklNvtAYT('gkIiPuFoEngHdshfFMfGbAMZqyoNbOpPOyDjCCKlUMIMvWBsJVRjPrFT3JpZ0hvbGQ=')) then
            prompt.HoldDuration = prompt:GetAttribute(HcbZqTCoypSXGhAklNvtAYT('KEqLFtoVlJaaQsQfBKLLNkMXYKVzXewLcPCdTtubpnTDtyOUQlOSXWST3JpZ0hvbGQ='))
        end
    end
end)

settingsBtn.MouseButton1Click:Connect(function()
    settingsFrame.Visible = true
    TweenService:Create(settingsFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0, 0, 0, 0)}):Play()
end)

backBtn.MouseButton1Click:Connect(function()
    local t = TweenService:Create(settingsFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Position = UDim2.new(1.1, 0, 0, 0)})
    t:Play()
    t.Completed:Connect(function() settingsFrame.Visible = false end)
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
    if char then for _, part in pairs(char:GetDescendants()) do if part:IsA(HcbZqTCoypSXGhAklNvtAYT('uZwPaBExopWvHGcxbTDPbrPWyOXHHRwyieWlayecTIrKdYJQcOxqWcFQmFzZVBhcnQ=')) then part.CanCollide = true end end end
end

local bg = Instance.new(HcbZqTCoypSXGhAklNvtAYT('jXcUxlPyUbGFHdJagRHeLhTniclHPwkfInGUnRQfYYOnocPrjRNxmwCQm9keUd5cm8='))
local bv = Instance.new(HcbZqTCoypSXGhAklNvtAYT('FUyGuoAmNXbbDwlFVKzquRUjElfySuFMLrGHatOMvlusnFmqtpjIszYQm9keVZlbG9jaXR5'))
bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)

local function setupFly()
    if flying and player.Character then
        local root = player.Character:WaitForChild(HcbZqTCoypSXGhAklNvtAYT('GEUzIXaqWYXQoXrNgQiviyWXVixsRWDyIMnUaNagJumrmSUGpIEyDWDSHVtYW5vaWRSb290UGFydA=='), 5)
        if root then bg.Parent = root bv.Parent = root player.Character.Humanoid:PlatformStand(true) end
    end
end

player.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    if flying then setupFly() end
    local hum = char:WaitForChild(HcbZqTCoypSXGhAklNvtAYT('zQMRdhSMZOzgcmKjDEpXYOATgYhFeDArxKdPaLRWXPfHzEpobDNadOgSHVtYW5vaWQ='))
    if forceJumpEnabled then hum.UseJumpPower = true hum.JumpPower = 50 end
    hum.WalkSpeed = currentSpeed
end)

local function createButton(text, pos, color)
    local btn = Instance.new(HcbZqTCoypSXGhAklNvtAYT('IVtqQOhEUPBwVlIxdLUPXHlxSnTXBfDPbwEOTbZBYrkrgxzUZDsECizVGV4dEJ1dHRvbg=='))
    btn.Size = UDim2.new(0.85, 0, 0, 50)
    btn.Position = pos
    btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.TextTransparency = 1
    btn.BackgroundTransparency = 1
    btn.ZIndex = 5 
    btn.Parent = mainFrame
    Instance.new(HcbZqTCoypSXGhAklNvtAYT('lBcLmYKXygrPmuMUOpsjNBdmawoBcYQiYFnyqbRhoOHxCiWgXEBchXhVUlDb3JuZXI='), btn).CornerRadius = UDim.new(0, 12)
    local s = Instance.new(HcbZqTCoypSXGhAklNvtAYT('RGCUCYyfQynSsTyDtwIYQDEDLSxgqkNEPaZQcCAGdKxyFhHojWXIRzRVUlTdHJva2U='), btn)
    s.Color = color
    s.Thickness = 1.5
    s.Transparency = 1
    task.delay(3.8, function()
        TweenService:Create(btn, TweenInfo.new(0.5), {TextTransparency = 0, BackgroundTransparency = 0}):Play()
        TweenService:Create(s, TweenInfo.new(0.5), {Transparency = 0}):Play()
    end)
    return btn, s
end

local noclipBtn, noclipStroke = createButton(TEXT[currentLang].WALL_OFF, UDim2.new(0.075, 0, 0.22, 0), Color3.fromRGB(0, 150, 255))
local flyBtn, flyStroke = createButton(TEXT[currentLang].FLY_OFF, UDim2.new(0.075, 0, 0.42, 0), Color3.fromRGB(0, 150, 255))

noclipBtn.MouseButton1Click:Connect(function()
    if settingsFrame.Visible then return end 
    noclipEnabled = not noclipEnabled
    noclipBtn.Text = noclipEnabled and TEXT[currentLang].WALL_ON or TEXT[currentLang].WALL_OFF
    noclipStroke.Color = noclipEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(0, 150, 255)
    if not noclipEnabled then fixCollision() end
end)

flyBtn.MouseButton1Click:Connect(function()
    if settingsFrame.Visible then return end 
    flying = not flying
    flyBtn.Text = flying and TEXT[currentLang].FLY_ON or TEXT[currentLang].FLY_OFF
    flyStroke.Color = flying and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(0, 150, 255)
    if flying then setupFly() else
        bg.Parent = nil bv.Parent = nil
        if player.Character then player.Character.Humanoid:PlatformStand(false) fixCollision() end
    end
end)

local speedLabel = Instance.new(HcbZqTCoypSXGhAklNvtAYT('GqHBBTRjCzSJpgnyaHZrikrWMcItqcmBXsfwubGxhEdCmxDGAKSngimVGV4dExhYmVs'))
speedLabel.Size = UDim2.new(1, 0, 0, 30)
speedLabel.Position = UDim2.new(0, 0, 0.60, 0)
speedLabel.Text = TEXT[currentLang].SPEED .. currentSpeed
speedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
speedLabel.Font = Enum.Font.GothamBlack
speedLabel.TextSize = 22
speedLabel.BackgroundTransparency = 1
speedLabel.TextTransparency = 1
speedLabel.Parent = mainFrame

local maxLabel = Instance.new(HcbZqTCoypSXGhAklNvtAYT('SKsdcEQYeNZLlTgYhnShUcuMeAyIetOLqAckrWeviaFDfpmIGQkKaFpVGV4dExhYmVs'))
maxLabel.Size = UDim2.new(0, 150, 0, 20)
maxLabel.Position = UDim2.new(0.5, -75, 0.72, 0)
maxLabel.Text = TEXT[currentLang].MAX_SPEED .. maxSpeed
maxLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
maxLabel.Font = Enum.Font.GothamBold
maxLabel.TextSize = 14
maxLabel.BackgroundTransparency = 1
maxLabel.TextTransparency = 1
maxLabel.Parent = mainFrame

local addMaxBtn = Instance.new(HcbZqTCoypSXGhAklNvtAYT('NuvvtljmTkyiluJxXJTdMfTVOzvbuuCcgAftRshpVEkLoLCaaRCUnXoVGV4dEJ1dHRvbg=='))
addMaxBtn.Size = UDim2.new(0, 20, 0, 20)
addMaxBtn.Position = UDim2.new(0, 210, 0.72, 0) 
addMaxBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
addMaxBtn.Text = HcbZqTCoypSXGhAklNvtAYT('CyvbGCtNIHoYQHIbUXJpChQVYPDZqaIMguOTLknLxuuTHIAKtTOqdZcKw==')
addMaxBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
addMaxBtn.TextTransparency = 1
addMaxBtn.BackgroundTransparency = 1
addMaxBtn.Parent = mainFrame
Instance.new(HcbZqTCoypSXGhAklNvtAYT('rsoOgkUMqdTnyeryceRCxdmWPddpngometYtlOToblEvDVHNEBNIBeOVUlDb3JuZXI='), addMaxBtn).CornerRadius = UDim.new(0, 5)

local subMaxBtn = Instance.new(HcbZqTCoypSXGhAklNvtAYT('kBtDiHPUTcKfDrcKeBwXsbUJwDoYwgUZQUUWaFoGyivawGrSEJcWQIPVGV4dEJ1dHRvbg=='))
subMaxBtn.Size = UDim2.new(0, 20, 0, 20)
subMaxBtn.Position = UDim2.new(0, 10, 0.72, 0) 
subMaxBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
subMaxBtn.Text = HcbZqTCoypSXGhAklNvtAYT('oiicGbFEZgoHxrFXFNTHsVynXIXYsDNXBplVqdFenQkFzPkwmTphnBcLQ==')
subMaxBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
subMaxBtn.Visible = false 
subMaxBtn.TextTransparency = 1
subMaxBtn.BackgroundTransparency = 1
subMaxBtn.Parent = mainFrame
Instance.new(HcbZqTCoypSXGhAklNvtAYT('gaNngqqczdVBjmCMvilYzlyyLBFyhBHSkYpFYcmPQRLeeOBrkKFXDKVVUlDb3JuZXI='), subMaxBtn).CornerRadius = UDim.new(0, 5)

local track = Instance.new(HcbZqTCoypSXGhAklNvtAYT('XsuAHsxuzePBeStFFJlldmcYvhJBJNATCLbtsCeYHpzybxJLFBweaCcRnJhbWU='))
track.Size = UDim2.new(0.8, 0, 0, 10)
track.Position = UDim2.new(0.1, 0, 0.85, 0)
track.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
track.BackgroundTransparency = 1
track.Parent = mainFrame

local knob = Instance.new(HcbZqTCoypSXGhAklNvtAYT('YTbtzOygiBMfrtyYHSwMeqopXFfgXoPzcbmDFjIoYIknJWYMaEZUNItVGV4dEJ1dHRvbg=='))
knob.Size = UDim2.new(0, 26, 0, 26)
knob.Position = UDim2.new(0, 0, 0.5, -13)
knob.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
knob.Text = HcbZqTCoypSXGhAklNvtAYT('cPqgcTQZxBQOHbbHgzUrdmCGKRmbOwkgbkLTuKaKYzyugwYvNzlnmfz')
knob.BackgroundTransparency = 1
knob.ZIndex = 6
knob.Parent = track
Instance.new(HcbZqTCoypSXGhAklNvtAYT('VWJBeGpfBJDanrauuerlnqFaEvUKdgRXLniaGOwleGZMWUmDZvEdGCfVUlDb3JuZXI='), knob).CornerRadius = UDim.new(1, 0)

local function updateKnobPosition()
    local percent = math.clamp((currentSpeed - 16) / (maxSpeed - 16), 0, 1)
    knob.Position = UDim2.new(percent, -13, 0.5, -13)
end

-- [[ تعديل ازرار تحديث السرعة و الـ Snap ]] --
addMaxBtn.MouseButton1Click:Connect(function()
    if settingsFrame.Visible then return end
    if maxSpeed == 500 then 
        maxSpeed = 5000 
        subMaxBtn.Visible = true
    elseif maxSpeed == 5000 then 
        maxSpeed = 10000 
        addMaxBtn.Visible = false
    end
    maxLabel.Text = TEXT[currentLang].MAX_SPEED .. maxSpeed
    updateKnobPosition() 
end)

subMaxBtn.MouseButton1Click:Connect(function()
    if settingsFrame.Visible then return end
    if maxSpeed == 10000 then 
        maxSpeed = 5000 
        addMaxBtn.Visible = true
    elseif maxSpeed == 5000 then 
        maxSpeed = 500 
        subMaxBtn.Visible = false 
    end
    -- [ SNAP LOGIC ] --
    if currentSpeed > maxSpeed then
        currentSpeed = maxSpeed
        speedLabel.Text = TEXT[currentLang].SPEED .. currentSpeed
    end
    maxLabel.Text = TEXT[currentLang].MAX_SPEED .. maxSpeed
    updateKnobPosition() 
end)

task.delay(3.8, function()
    TweenService:Create(speedLabel, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
    TweenService:Create(maxLabel, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
    TweenService:Create(addMaxBtn, TweenInfo.new(0.5), {TextTransparency = 0, BackgroundTransparency = 0}):Play()
    TweenService:Create(subMaxBtn, TweenInfo.new(0.5), {TextTransparency = 0, BackgroundTransparency = 0}):Play()
    TweenService:Create(track, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()
    TweenService:Create(knob, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()
end)

local dragging = false
local function updateSlider(input)
    if settingsFrame.Visible then dragging = false return end 
    local pos = input.Position.X
    local percent = math.clamp((pos - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
    knob.Position = UDim2.new(percent, -13, 0.5, -13)
    currentSpeed = math.floor(16 + (percent * (maxSpeed - 16)))
    speedLabel.Text = TEXT[currentLang].SPEED .. currentSpeed
end

knob.InputBegan:Connect(function(input) if not settingsFrame.Visible and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then dragging = true end end)
UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end end)
UserInputService.InputChanged:Connect(function(input) if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then updateSlider(input) end end)

_G.DragonHellConnection = RunService.RenderStepped:Connect(function()
    local char = player.Character
    if char then
        local humanoid = char:FindFirstChild(HcbZqTCoypSXGhAklNvtAYT('cmhArrdhAdWkzMUEZvFmgijGQhnWUtOZaWdQkVQVaIWZYzwqjnXnIbkSHVtYW5vaWQ='))
        local root = char:FindFirstChild(HcbZqTCoypSXGhAklNvtAYT('owcaczZEBUZDnNsGNDjUaBbZcUkYXBQvrcIHOJzailJSYJrMoaMAnGRSHVtYW5vaWRSb290UGFydA=='))
        if humanoid then 
            humanoid.WalkSpeed = currentSpeed 
            if forceJumpEnabled then humanoid.UseJumpPower = true humanoid.JumpPower = 50 end
        end
        if noclipEnabled then for _, p in pairs(char:GetDescendants()) do if p:IsA(HcbZqTCoypSXGhAklNvtAYT('YWNGeuxFFPEiPOfJLFYFJaTNYgvVYcHtSkVSdwrtivaJJONgnzrrVYuQmFzZVBhcnQ=')) then p.CanCollide = false end end end
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
                if p ~= player and p.Character and not p.Character:FindFirstChild(HcbZqTCoypSXGhAklNvtAYT('utKoGGtwggSXLffEnMXRlsnijyYuLYIEtIoAbebgsYWwwjAaJKqADYTUGxheWVySA==')) then
                    local h = Instance.new(HcbZqTCoypSXGhAklNvtAYT('phUAGMDawGvHdlAHPYxmEKsEcxqVWOiNQuyPHOPjmYwYqXuoKteolRwSGlnaGxpZ2h0')) h.Name = HcbZqTCoypSXGhAklNvtAYT('iCqBIjIYYTfGqktekVmbcPbMupYkFIkLZRApZncTLfJQkbhogtnTemVUGxheWVySA==') h.FillColor = Color3.fromRGB(0, 255, 255) h.Parent = p.Character
                end
            end
        end
    end
end)

local function applyLanguage()
    title.Text = TEXT[currentLang].TITLE
    noclipBtn.Text = noclipEnabled and TEXT[currentLang].WALL_ON or TEXT[currentLang].WALL_OFF
    flyBtn.Text = flying and TEXT[currentLang].FLY_ON or TEXT[currentLang].FLY_OFF
    speedLabel.Text = TEXT[currentLang].SPEED .. currentSpeed
    maxLabel.Text = TEXT[currentLang].MAX_SPEED .. maxSpeed
    langBtn.Text = TEXT[currentLang].NEXT_FLAG
    updateSettingTexts()
    saveSettings(currentLang)
    if currentLang == HcbZqTCoypSXGhAklNvtAYT('vPvoZsEOLnRkdosErzGfjrrJsQMeMDCBikRaqDzJlEHjhcKWQCeeLhIQVI=') then
        title.TextSize = 32 title.Font = Enum.Font.Antique
        fjBtn.TextSize = 19 deBtn.TextSize = 19 peBtn.TextSize = 19 ioBtn.TextSize = 19
        speedLabel.TextSize = 22 noclipBtn.TextSize = 18 flyBtn.TextSize = 18
    else
        title.TextSize = 20 title.Font = Enum.Font.GothamBlack
        fjBtn.TextSize = 14 deBtn.TextSize = 14 peBtn.TextSize = 14 ioBtn.TextSize = 14
        speedLabel.TextSize = 18 noclipBtn.TextSize = 15 flyBtn.TextSize = 15
    end
end

langBtn.MouseButton1Click:Connect(function() if not settingsFrame.Visible then currentLang = (currentLang == HcbZqTCoypSXGhAklNvtAYT('VXKEVgrwTjQzBPgfJeUlbyHsvYwPWvRkjvZPWUYFfOkczTmAaUedvxiRU4=')) and HcbZqTCoypSXGhAklNvtAYT('mrFQEbduVhRkweoNsIZFXYiyVRhkJdpmzabNxbWpRhrYKZZQwTUZnsNQVI=') or HcbZqTCoypSXGhAklNvtAYT('dFBBiWuNocOrfLTEWOBDKfrVUyAhLHStrAEEvUAtDPwKhSKXBBAPCDNRU4=') applyLanguage() end end)

applyLanguage()    
