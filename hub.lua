local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local function notify(title, text)
    local notification = Instance.new("Frame")
    notification.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    notification.BorderSizePixel = 0
    notification.Position = UDim2.new(1, 10, 0.3, 0)
    notification.Size = UDim2.new(0, 300, 0, 80)
    notification.AnchorPoint = Vector2.new(1, 0)
    notification.Parent = ScreenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = notification

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(100, 255, 100)
    stroke.Thickness = 2
    stroke.Parent = notification

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Position = UDim2.new(0, 15, 0, 10)
    titleLabel.Size = UDim2.new(1, -30, 0, 25)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 18
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = notification

    local textLabel = Instance.new("TextLabel")
    textLabel.Text = text
    textLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    textLabel.BackgroundTransparency = 1
    textLabel.Position = UDim2.new(0, 15, 0, 35)
    textLabel.Size = UDim2.new(1, -30, 0, 35)
    textLabel.Font = Enum.Font.Gotham
    textLabel.TextSize = 14
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.TextYAlignment = Enum.TextYAlignment.Top
    textLabel.Parent = notification

    local tweenIn = game:GetService("TweenService"):Create(
        notification,
        TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {Position = UDim2.new(1, -10, 0.3, 0)}
    )
    
    local tweenOut = game:GetService("TweenService"):Create(
        notification,
        TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In),
        {Position = UDim2.new(1, 10, 0.3, 0)}
    )

    tweenIn:Play()
    wait(3)
    tweenOut:Play()
    tweenOut.Completed:Wait()
    notification:Destroy()
end

local success, result = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TrowHack/scripts/refs/heads/roblox/" .. game.PlaceId))()
end)

if success then
    notify("SUCCESS", "Game Found")
else
    notify("ERROR", "Script not found")
end
