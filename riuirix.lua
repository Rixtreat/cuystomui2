-- =========================================================================
-- [[ DALEY HUB | CLEAN WORKSPACE WITH CONFIG POPUP ]] --
-- =========================================================================

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local Style = {
    BgColor = Color3.fromRGB(18, 14, 16),          -- Deep obsidian black backing
    CardBg = Color3.fromRGB(26, 20, 24),          -- Solid dark panel cards
    HeaderBg = Color3.fromRGB(14, 11, 13),        -- Top navbar grounding
    AccentColor = Color3.fromRGB(255, 0, 50),     -- Vivid Crimson Red
    LightningColor = Color3.fromRGB(255, 180, 190),-- Bleached high-volt red/white
    BorderColor = Color3.fromRGB(60, 35, 40),      -- Dark rustic red borders
    TextColor = Color3.fromRGB(250, 240, 240),
    MutedText = Color3.fromRGB(160, 130, 135),
    
    LightningDelay = 2.0
}

local CustomUI = Instance.new("ScreenGui")
CustomUI.Name = "DaleyHub_CleanWorkspace_" .. math.random(1000, 9999)
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

-- Helper function to generate the stylized "D" bubble logo cleanly
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
-- [[ TOP HEADER & NAVBAR ZONE ]] --
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
-- [[ VERTICAL ICON SIDEBAR SYSTEM ]] --
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
SideLayout.Padding = UDim.new(0, 18)
SideLayout.Parent = SideNav

local SidePadding = Instance.new("UIPadding")
SidePadding.PaddingTop = UDim.new(0, 18)
SidePadding.Parent = SideNav

local LightningTabButton -- Keep global reference for click binding below

local icons = {"🌱", "⚡", "🗺️", "👁️", "🌀", "⚙️"}
for i, icon in ipairs(icons) do
    local iconBtn = Instance.new("TextButton")
    iconBtn.Size = UDim2.new(0, 34, 0, 34)
    iconBtn.BackgroundTransparency = 1
    iconBtn.Text = icon
    iconBtn.Font = Enum.Font.Gotham
    iconBtn.TextSize = 18
    iconBtn.TextColor3 = Style.MutedText 
    iconBtn.ZIndex = 12
    iconBtn.Parent = SideNav
    
    if i == 2 then
        LightningTabButton = iconBtn
        iconBtn.TextColor3 = Style.AccentColor -- Bright red accent alerting accessibility
    end
end


-- =========================================================================
-- [[ DYNAMIC BACKGROUND LIGHTNING ARCHITECTURE ]] --
-- =========================================================================
local LightningCanvas = Instance.new("Frame")
LightningCanvas.Name = "LightningCanvas"
LightningCanvas.Size = UDim2.new(1, -54, 1, -54)
LightningCanvas.Position = UDim2.new(0, 54, 0, 54)
LightningCanvas.BackgroundTransparency = 1
LightningCanvas.ClipsDescendants = true
LightningCanvas.ZIndex = 2 
LightningCanvas.Parent = MainFrame

local function DrawBoltSegment(startPos, endPos, thick)
    local distance = (startPos - endPos).Magnitude
    local angle = math.deg(math.atan2(endPos.Y - startPos.Y, endPos.X - startPos.X))
    
    local segment = Instance.new("Frame")
    segment.BackgroundColor3 = Style.LightningColor
    segment.BorderSizePixel = 0
    segment.Size = UDim2.new(0, distance, 0, thick)
    segment.Position = UDim2.new(0, startPos.X, 0, startPos.Y)
    segment.AnchorPoint = Vector2.new(0, 0.5)
    segment.Rotation = angle
    segment.ZIndex = 3
    segment.Parent = LightningCanvas
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Style.AccentColor
    stroke.Thickness = 2
    stroke.Parent = segment
    
    return segment
end

local function GenerateLightningStrike()
    if not LightningCanvas.Parent then return end
    local containerWidth = LightningCanvas.AbsoluteSize.X
    local containerHeight = LightningCanvas.AbsoluteSize.Y
    if containerWidth < 50 then return end
    
    local startX = math.random(40, containerWidth - 40)
    local currentPoint = Vector2.new(startX, 0)
    local targetY = containerHeight
    local segments = {}
    
    while currentPoint.Y < targetY do
        local nextY = currentPoint.Y + math.random(20, 45)
        if nextY > targetY then nextY = targetY end
        local nextX = currentPoint.X + math.random(-30, 30)
        local nextPoint = Vector2.new(nextX, nextY)
        
        local line = DrawBoltSegment(currentPoint, nextPoint, math.random(2, 4))
        table.insert(segments, line)
        currentPoint = nextPoint
    end
    
    TweenService:Create(FrameStroke, TweenInfo.new(0.05, Enum.EasingStyle.Quad), {Color = Style.LightningColor}):Play()
    
    task.spawn(function()
        task.wait(0.06)
        for _, part in ipairs(segments) do
            TweenService:Create(part, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {BackgroundTransparency = 1}):Play()
            local str = part:FindFirstChildOfClass("UIStroke")
            if str then TweenService:Create(str, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {Transparency = 1}):Play() end
        end
        TweenService:Create(FrameStroke, TweenInfo.new(0.3, Enum.EasingStyle.Linear), {Color = Style.AccentColor}):Play()
        task.wait(0.2)
        for _, part in ipairs(segments) do part:Destroy() end
    end)
end

task.spawn(function()
    while true do
        task.wait(Style.LightningDelay)
        GenerateLightningStrike()
    end
end)


-- =========================================================================
-- [[ BLANK MAIN VIEWPORT & POPUP CONTROLLER CONTAINER ]] --
-- =========================================================================
local MainContentArea = Instance.new("Frame")
MainContentArea.Name = "MainContentArea"
MainContentArea.Size = UDim2.new(1, -84, 1, -94)
MainContentArea.Position = UDim2.new(0, 68, 0, 72)
MainContentArea.BackgroundTransparency = 1 -- Intentionally completely blank canvas workspace area
MainContentArea.ZIndex = 5
MainContentArea.Parent = MainFrame

-- The Slide-In/Toggle Config View Panel via Sidebar access
local ControlCard = Instance.new("Frame")
ControlCard.Name = "ControlCard"
ControlCard.Size = UDim2.new(0, 540, 0, 110)
ControlCard.Position = UDim2.new(0.5, -270, 0.5, -55)
ControlCard.BackgroundColor3 = Style.CardBg
ControlCard.BackgroundTransparency = 0.1
ControlCard.Visible = false -- Off visually till side slider button toggled
ControlCard.ZIndex = 20
ControlCard.Parent = MainFrame

local CardCorner = Instance.new("UICorner")
CardCorner.CornerRadius = UDim.new(0, 8)
CardCorner.Parent = ControlCard

local CardStroke = Instance.new("UIStroke")
CardStroke.Color = Style.AccentColor
CardStroke.Thickness = 1.5
CardStroke.Parent = ControlCard

-- Close Option Inside Slider Panel Box
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 24, 0, 24)
CloseBtn.Position = UDim2.new(1, -28, 0, 4)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "✕"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextColor3 = Style.MutedText
CloseBtn.TextSize = 12
CloseBtn.ZIndex = 22
CloseBtn.Parent = ControlCard
CloseBtn.MouseButton1Click:Connect(function()
    ControlCard.Visible = false
end)

local SliderContainer = Instance.new("Frame")
SliderContainer.Size = UDim2.new(1, -40, 1, -20)
SliderContainer.Position = UDim2.new(0, 20, 0, 12)
SliderContainer.BackgroundTransparency = 1
SliderContainer.ZIndex = 21
SliderContainer.Parent = ControlCard

local SliderTitle = Instance.new("TextLabel")
SliderTitle.Size = UDim2.new(1, 0, 0, 20)
SliderTitle.BackgroundTransparency = 1
SliderTitle.Text = "⚡ LIGHTNING DISCHARGE FREQUENCY"
SliderTitle.Font = Enum.Font.GothamBold
SliderTitle.TextSize = 12
SliderTitle.TextColor3 = Style.TextColor
SliderTitle.TextXAlignment = Enum.TextXAlignment.Center
SliderTitle.ZIndex = 22
SliderTitle.Parent = SliderContainer

local SliderTrack = Instance.new("Frame")
SliderTrack.Size = UDim2.new(1, 0, 0, 6)
SliderTrack.Position = UDim2.new(0, 0, 0, 42)
SliderTrack.BackgroundColor3 = Style.BgColor
SliderTrack.BorderSizePixel = 0
SliderTrack.ZIndex = 22
SliderTrack.Parent = SliderContainer

local TrackCorner = Instance.new("UICorner")
TrackCorner.CornerRadius = UDim.new(1, 0)
TrackCorner.Parent = SliderTrack

local SliderFill = Instance.new("Frame")
SliderFill.Size = UDim2.new(0.4, 0, 1, 0)
SliderFill.BackgroundColor3 = Style.AccentColor
SliderFill.BorderSizePixel = 0
SliderFill.ZIndex = 23
SliderFill.Parent = SliderTrack

local FillCorner = Instance.new("UICorner")
FillCorner.CornerRadius = UDim.new(1, 0)
FillCorner.Parent = SliderFill

local SliderBtn = Instance.new("TextButton")
SliderBtn.Name = "SliderBtn"
SliderBtn.Size = UDim2.new(0, 16, 0, 16)
SliderBtn.Position = UDim2.new(0.4, -8, 0.5, -8)
SliderBtn.BackgroundColor3 = Style.TextColor
SliderBtn.Text = ""
SliderBtn.ZIndex = 24
SliderBtn.Parent = SliderTrack

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(1, 0)
BtnCorner.Parent = SliderBtn

local BtnStroke = Instance.new("UIStroke")
BtnStroke.Color = Style.AccentColor
BtnStroke.Thickness = 2
BtnStroke.Parent = SliderBtn

local ValueLabel = Instance.new("TextLabel")
ValueLabel.Size = UDim2.new(1, 0, 0, 18)
ValueLabel.Position = UDim2.new(0, 0, 0, 58)
ValueLabel.BackgroundTransparency = 1
ValueLabel.Text = "Delay Interval: 2.00s"
ValueLabel.Font = Enum.Font.Code
ValueLabel.TextSize = 11
ValueLabel.TextColor3 = Style.MutedText
ValueLabel.TextXAlignment = Enum.TextXAlignment.Center
ValueLabel.ZIndex = 22
ValueLabel.Parent = SliderContainer

-- Connect the Sidebar tab element to show/hide the configuration engine panel
LightningTabButton.MouseButton1Click:Connect(function()
    ControlCard.Visible = not ControlCard.Visible
end)


-- =========================================================================
-- [[ SLIDER INTERACTION HANDLERS ]] --
-- =========================================================================
local minVal = 0.2  
local maxVal = 6.0  
local isSliding = false

local function UpdateSlider(input)
    local relativeX = math.clamp((input.Position.X - SliderTrack.AbsolutePosition.X) / SliderTrack.AbsoluteSize.X, 0, 1)
    
    SliderBtn.Position = UDim2.new(relativeX, -8, 0.5, -8)
    SliderFill.Size = UDim2.new(relativeX, 0, 1, 0)
    
    local calculatedValue = minVal + (relativeX * (maxVal - minVal))
    Style.LightningDelay = calculatedValue
    ValueLabel.Text = string.format("Delay Interval: %.2fs", calculatedValue)
end

SliderBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        isSliding = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        isSliding = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if isSliding and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        UpdateSlider(input)
    end
end)


-- =========================================================================
-- [[ FOOTER BANNER STRIP ]] --
-- =========================================================================
local Footer = Instance.new("Frame")
Footer.Size = UDim2.new(1, -84, 0, 20)
Footer.Position = UDim2.new(0, 68, 1, -28)
Footer.BackgroundTransparency = 1
Footer.ZIndex = 5
Footer.Parent = MainFrame

local FooterText = Instance.new("TextLabel")
FooterText.Size = UDim2.new(1, 0, 1, 0)
FooterText.BackgroundTransparency = 1
FooterText.Text = "| Daley Hub v5.0 // Clean Canvas Mode Active"
FooterText.Font = Enum.Font.Code
FooterText.TextSize = 11
FooterText.TextColor3 = Style.MutedText
FooterText.TextXAlignment = Enum.TextXAlignment.Left
FooterText.ZIndex = 6
FooterText.Parent = Footer


-- =========================================================================
-- [[ DRAG HANDLING SYSTEM ]] --
-- =========================================================================
local dragging, dragInput, dragStart, startPos
local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then update(input) end
end)

print("Minimal workspace created. Access the slider anytime by clicking the ⚡ tab.")
