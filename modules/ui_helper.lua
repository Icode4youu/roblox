local UIHelper = {}

-- Gumawa ng ScreenGui sa PlayerGui ng player
function UIHelper.createScreenGui(player, name)
	local playerGui = player:WaitForChild("PlayerGui")
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = name or "HelperGui"
	screenGui.ResetOnSpawn = false
	screenGui.Parent = playerGui
	return screenGui
end

-- Gumawa ng frame na may rounded corners
function UIHelper.createFrame(parent, props)
	props = props or {}
	local frame = Instance.new("Frame")
	frame.Name = props.name or "Frame"
	frame.Size = props.size or UDim2.fromOffset(300, 200)
	frame.Position = props.position or UDim2.new(0.5, -150, 0.5, -100)
	frame.BackgroundColor3 = props.color or Color3.fromRGB(35, 35, 35)
	frame.Parent = parent

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = frame

	return frame
end

-- Gumawa ng text label
function UIHelper.createLabel(parent, props)
	props = props or {}
	local label = Instance.new("TextLabel")
	label.Name = props.name or "Label"
	label.Size = props.size or UDim2.new(1, 0, 0, 40)
	label.Position = props.position or UDim2.new(0, 0, 0, 0)
	label.BackgroundTransparency = 1
	label.TextColor3 = props.textColor or Color3.new(1, 1, 1)
	label.Font = Enum.Font.GothamBold
	label.TextSize = props.textSize or 18
	label.Text = props.text or "Label"
	label.Parent = parent
	return label
end

-- Gumawa ng button; ibalik ang instance para ma-connect ang MouseButton1Click
function UIHelper.createButton(parent, props)
	props = props or {}
	local button = Instance.new("TextButton")
	button.Name = props.name or "Button"
	button.Size = props.size or UDim2.fromOffset(200, 50)
	button.Position = props.position or UDim2.new(0.5, -100, 1, -60)
	button.BackgroundColor3 = props.color or Color3.fromRGB(30, 144, 255)
	button.TextColor3 = Color3.new(1, 1, 1)
	button.Font = Enum.Font.GothamBold
	button.TextSize = 16
	button.Text = props.text or "Click me"
	button.Parent = parent

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = button

	return button
end

return UIHelper
