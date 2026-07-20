-- =========================================================================
-- [[ DALEY HUB | FULLY POPULATED WORKSPACE ]] --
-- =========================================================================

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")

local Style = {
    BgColor = Color3.fromRGB(18, 14, 16),          -- Deep obsidian black
    CardBg = Color3.fromRGB(26, 20, 24),          -- Solid dark panel cards
    HeaderBg = Color3.fromRGB(14, 11, 13),        -- Top navbar
    AccentColor = Color3.fromRGB(255, 0, 50),      -- Vivid Crimson Red
    LightningColor = Color3.fromRGB(255, 180, 190),-- Bleached high-volt red/white
    BorderColor = Color3.fromRGB(60, 35, 40),      -- Dark rustic red borders
    TextColor = Color3.fromRGB(250, 240, 240),
    MutedText = Color3.fromRGB(160, 130, 135),
    
    LightningDelay = 2.0
}

local CustomUI = Instance.new("ScreenGui")
CustomUI.Name = "DaleyHub_Populated_" .. math.random(1000, 9999)
CustomUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
CustomUI.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 820, 0, 460) 
MainFrame.Position = UDim2.new(0.5, -410, 0.5, -230)
MainFrame.BackgroundColor3 = Style.BgColor
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = CustomUI

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 12)
FrameCorner.Parent = MainFrame

local FrameStroke = Instance.new("UIStroke")
FrameStroke.Thickness = 2
FrameStroke.Color = Style.AccentColor
FrameStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
FrameStroke.Parent = MainFrame

-- Helper function for Logo
local function CreateLogoD(parent, size, pos)
    local logoBg = Instance.new("Frame")
    logoBg.Size = size
    logoBg.Position = pos
    logoBg.BackgroundColor3 = Style.HeaderBg
    logoBg.ZIndex = 16
    logoBg.Parent = parent

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(1, 0)
    c.Parent = logoBg

    local s = Instance.new("UIStroke")
    s.Color = Style.AccentColor
    s.Thickness = 2
    s.Parent = logoBg

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, -2)
    label.BackgroundTransparency = 1
    label.Text = "D"
    label.Font = Enum.Font.FredokaOne
    label.TextColor3 = Style.AccentColor
    label.TextSize = size.Y.Offset * 0.65
    label.ZIndex = 17
    label.Parent = logoBg
    
    return logoBg
end

-- =========================================================================
-- [[ TOP HEADER & NAVBAR ]] --
-- =========================================================================
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 54)
TopBar.BackgroundColor3 = Style.HeaderBg
TopBar.BorderSizePixel = 0
TopBar.ZIndex = 10
TopBar.Parent = MainFrame

local TopBarLine = Instance.new("Frame")
TopBarLine.Size = UDim2.new(1, 0, 0, 1)
TopBarLine.Position = UDim2.new(0, 0, 1, 0)
TopBarLine.BackgroundColor3 = Style.BorderColor
TopBarLine.BorderSizePixel = 0
TopBarLine.ZIndex = 11
TopBarLine.Parent = TopBar

CreateLogoD(TopBar, UDim2.new(0, 34, 0, 34), UDim2.new(0, 14, 0, 10))

local SearchBar = Instance.new("TextBox")
SearchBar.Name = "SearchBar"
SearchBar.Size = UDim2.new(0, 360, 0, 34)
SearchBar.Position = UDim2.new(0, 65, 0, 10)
SearchBar.BackgroundColor3 = Style.BgColor
SearchBar.BorderSizePixel = 0
SearchBar.Text = ""
SearchBar.PlaceholderText = "Search parameters..."
SearchBar.PlaceholderColor3 = Style.MutedText
SearchBar.TextColor3 = Style.TextColor
SearchBar.Font = Enum.Font.Gotham
SearchBar.TextSize = 13
SearchBar.TextXAlignment = Enum.TextXAlignment.Left
SearchBar.ZIndex = 12
SearchBar.Parent = TopBar

local SearchPadding = Instance.new("UIPadding")
SearchPadding.PaddingLeft = UDim.new(0, 12)
SearchPadding.Parent = SearchBar

local SearchCorner = Instance.new("UICorner")
SearchCorner.CornerRadius = UDim.new(0, 6)
SearchCorner.Parent = SearchBar

local SearchStroke = Instance.new("UIStroke")
SearchStroke.Color = Style.BorderColor
SearchStroke.Thickness = 1
SearchStroke.Parent = SearchBar

local CenterLogo = CreateLogoD(TopBar, UDim2.new(0, 50, 0, 50), UDim2.new(0.5, -25, 0, 2))
CenterLogo.ZIndex = 18

local Controls = Instance.new("Frame")
Controls.Size = UDim2.new(0, 70, 1, 0)
Controls.Position = UDim2.new(1, -75, 0, 0)
Controls.BackgroundTransparency = 1
Controls.ZIndex = 12
Controls.Parent = TopBar

local ControlLayout = Instance.new("UIListLayout")
ControlLayout.FillDirection = Enum.FillDirection.Horizontal
ControlLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
ControlLayout.VerticalAlignment = Enum.VerticalAlignment.Center
ControlLayout.Padding = UDim.new(0, 12)
ControlLayout.Parent = Controls

local function AddWindowBtn(txt, callback)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 18, 0, 18)
    b.BackgroundTransparency = 1
    b.Text = txt
    b.Font = Enum.Font.GothamMedium
    b.TextColor3 = Style.MutedText
    b.TextSize = 14
    b.ZIndex = 13
    b.Parent = Controls
    b.MouseButton1Click:Connect(callback)
end

AddWindowBtn("—", function()
    TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 820, 0, 54)}):Play()
end)
AddWindowBtn("✕", function()
    CustomUI:Destroy()
end)

-- =========================================================================
-- [[ SIDEBAR ]] --
-- =========================================================================
local SideNav = Instance.new("Frame")
SideNav.Name = "SideNav"
SideNav.Size = UDim2.new(0, 54, 1, -54)
SideNav.Position = UDim2.new(0, 0, 0, 54)
SideNav.BackgroundColor3 = Style.HeaderBg
SideNav.BorderSizePixel = 0
SideNav.ZIndex = 10
SideNav.Parent = MainFrame

local SideNavLine = Instance.new("Frame")
SideNavLine.Size = UDim2.new(0, 1, 1, 0)
SideNavLine.Position = UDim2.new(1, 0, 0, 0)
SideNavLine.BackgroundColor3 = Style.BorderColor
SideNavLine.BorderSizePixel = 0
SideNavLine.ZIndex = 11
SideNavLine.Parent = SideNav

local SideLayout = Instance.new("UIListLayout")
SideLayout.FillDirection = Enum.FillDirection.Vertical
SideLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
SideLayout.Padding = UDim.new(0, 14)
SideLayout.Parent = SideNav

local SidePadding = Instance.new("UIPadding")
SidePadding.PaddingTop = UDim.new(0, 14)
SidePadding.Parent = SideNav

local LightningTabButton

-- Clear labels instead of problematic emojis
local icons = {"[M]", "[Z]", "[G]", "[E]", "[S]", "[C]"}
for i, labelText in ipairs(icons) do
    local iconBtn = Instance.new("TextButton")
    iconBtn.Size = UDim2.new(0, 36, 0, 36)
    iconBtn.BackgroundColor3 = Style.CardBg
    iconBtn.Text = labelText
    iconBtn.Font = Enum.Font.GothamBold
    iconBtn.TextSize = 12
    iconBtn.TextColor3 = Style.MutedText 
    iconBtn.ZIndex = 12
    iconBtn.Parent = SideNav
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 6)
    c.Parent = iconBtn

    if i == 2 then
        LightningTabButton = iconBtn
        iconBtn.TextColor3 = Style.AccentColor
    end
end

-- =========================================================================
-- [[ MAIN CONTENT VIEWPORT ]] --
-- =========================================================================
local MainContentArea = Instance.new("ScrollingFrame")
MainContentArea.Name = "MainContentArea"
MainContentArea.Size = UDim2.new(1, -84, 1, -94)
MainContentArea.Position = UDim2.new(0, 68, 0, 72)
MainContentArea.BackgroundTransparency = 1
MainContentArea.BorderSizePixel = 0
MainContentArea.ScrollBarThickness = 4
MainContentArea.ScrollBarImageColor3 = Style.AccentColor
MainContentArea.ZIndex = 5
MainContentArea.Parent = MainFrame

local Grid = Instance.new("UIGridLayout")
Grid.CellSize = UDim2.new(0, 220, 0, 50)
Grid.CellPadding = UDim2.new(0, 15, 0, 15)
Grid.Parent = MainContentArea

-- Notification Helper
local function SendNotify(title, txt)
    pcall(function()
        StarterGui:SetCore("SendNotification", {Title = title, Text = txt, Duration = 2.5})
    end)
end

-- Function to dynamically populate script execution cards
local function AddScriptButton(name, url, useTrue)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.BackgroundColor3 = Style.CardBg
    btn.Text = name
    btn.Font = Enum.Font.GothamMedium
    btn.TextColor3 = Style.TextColor
    btn.TextSize = 12
    btn.ZIndex = 6
    btn.Parent = MainContentArea

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = btn

    local s = Instance.new("UIStroke")
    s.Color = Style.BorderColor
    s.Thickness = 1
    s.Parent = btn

    btn.MouseButton1Click:Connect(function()
        SendNotify("Daley Hub", "Executing " .. name .. "...")
        task.spawn(function()
            local success, err = pcall(function()
                if useTrue then
                    loadstring(game:HttpGet(url, true))()
                else
                    loadstring(game:HttpGet(url))()
                end
            end)
            if success then
                SendNotify("Daley Hub", "Loaded " .. name .. "!")
            else
                SendNotify("Daley Hub", "Failed to load " .. name)
                warn(err)
            end
        end)
    end)
end

-- Populate Script Buttons
AddScriptButton("RBX Script", "https://raw.githubusercontent.com/Rixtreat/rbxscrpt/main/rbx.lua")
AddScriptButton("Psychic Enigma", "https://raw.githubusercontent.com/Rixtreat/psychic-enigma/refs/heads/main/duel")
AddScriptButton("Evomon Script", "https://raw.githubusercontent.com/Rixtreat/roblox-script/refs/heads/main/evomon.lua", true)
AddScriptButton("Legacy Piece", "https://raw.githubusercontent.com/Rixtreat/legacypiece/refs/heads/main/rbx")
AddScriptButton("Poopy Script", "https://raw.githubusercontent.com/Rixtreat/poopfartskid/main/poopy.lua")
AddScriptButton("Drill Zone", "https://raw.githubusercontent.com/Rixtreat/drillzonejsbc/refs/heads/main/drill/.lua")
AddScriptButton("Fluffy Script #1", "https://raw.githubusercontent.com/Fluffyymuha87/script1/main/script.lua")
AddScriptButton("Fluffy Script #2", "https://raw.githubusercontent.com/Fluffyymuha87/script/main/script.lua")
AddScriptButton("Finalie Script", "https://raw.githubusercontent.com/Fluffyymuha87/finalie/main/final.lua")
AddScriptButton("Zombie Script", "https://raw.githubusercontent.com/Fluffyymuha87/scripts/main/zombie.lua")
AddScriptButton("Mountain Script", "https://raw.githubusercontent.com/Rixtreat/scripta1/main/mountain.lua")
AddScriptButton("Warden Script", "https://raw.githubusercontent.com/Rixtreat/scripta2/main/warden.lua")

-- Footer
local Footer = Instance.new("Frame")
Footer.Size = UDim2.new(1, -84, 0, 20)
Footer.Position = UDim2.new(0, 68, 1, -28)
Footer.BackgroundTransparency = 1
Footer.ZIndex = 5
Footer.Parent = MainFrame

local FooterText = Instance.new("TextLabel")
FooterText.Size = UDim2.new(1, 0, 1, 0)
FooterText.BackgroundTransparency = 1
FooterText.Text = "| Daley Hub v5.0 // Workspace Active"
FooterText.Font = Enum.Font.Code
FooterText.TextSize = 11
FooterText.TextColor3 = Style.MutedText
FooterText.TextXAlignment = Enum.TextXAlignment.Left
FooterText.ZIndex = 6
FooterText.Parent = Footer
