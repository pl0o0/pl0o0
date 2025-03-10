local player = game.Players.LocalPlayer
local chara = player.Character or player.CharacterAdded:Wait()
local humanoid = chara:WaitForChild("Humanoid")

	local screenGui = Instance.new("ScreenGui")
	screenGui.Parent = player:WaitForChild("PlayerGui")

	local OpenButton = Instance.new("TextButton")
	OpenButton.Parent = screenGui
	OpenButton.Size = UDim2.new(0, 50, 0, 50)
	OpenButton.Position = UDim2.new(0.130,0,0, 250,-0)
	OpenButton.Text = "E"
	OpenButton.TextScaled = true
	OpenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	OpenButton.BackgroundTransparency = 0.5
	OpenButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	
local dragstart = nil
local startpos = nil

OpenButton.InputBegan:Connect(function(input,gameProcecssed)
	if gameProcecssed then return end
	
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		
		dragstart = input.Position
		startpos = OpenButton.Position
		
	end
end)

OpenButton.InputChanged:Connect(function(input)
	if dragstart then
		
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			local delta = input.Position - dragstart
			OpenButton.Position = UDim2.new(startpos.X.Scale, startpos.X.Offset + delta.X, startpos.Y.Scale, startpos.Y.Offset + delta.Y)
		end
	end
end)

OpenButton.InputEnded:Connect(function(input)
	
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragstart = nil
		startpos = nil
	end
end)
	
	local MenuFrame = Instance.new("ScrollingFrame")
	MenuFrame.Parent = screenGui
	MenuFrame.Size = UDim2.new(0, 550, 0, 400)
	MenuFrame.Position = UDim2.new(0.4,0,0.15, 0)
	MenuFrame.BackgroundTransparency = 0.5
	MenuFrame.BackgroundColor3 = Color3.fromRGB(85, 255, 255)
	MenuFrame.Visible = false

OpenButton.MouseButton1Up:Connect(function(player)
	MenuFrame.Visible = not MenuFrame.Visible
end)
	
	local WalkSpeedButton = Instance.new("TextButton")
	WalkSpeedButton.Parent = MenuFrame
	WalkSpeedButton.Size = UDim2.new(0, 250, 0, 50)
	WalkSpeedButton.Position = UDim2.new(0.0,0,-0.001,0)
	WalkSpeedButton.Text = "Set WalkSpeed"
	WalkSpeedButton.TextScaled = true
	WalkSpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	WalkSpeedButton.TextTransparency = 0.3
	WalkSpeedButton.BackgroundTransparency = 0.3
	WalkSpeedButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	
	local WalkSpeedTextBox = Instance.new("TextBox")
	WalkSpeedTextBox.Parent = WalkSpeedButton
	WalkSpeedTextBox.Text = "Write Number" WalkSpeedTextBox.TextScaled = true
	WalkSpeedTextBox.Size = UDim2.new(0,200,0,50)
	WalkSpeedTextBox.Position = UDim2.new(1,2,0,0)
	WalkSpeedTextBox.TextColor = BrickColor.new(Color3.fromRGB(255, 255, 255))
	WalkSpeedTextBox.BackgroundColor3 = Color3.fromRGB(0,0, 0)
	WalkSpeedTextBox.BackgroundTransparency = 0.3
	WalkSpeedTextBox.TextTransparency = 0.3
	
	local ResetWalkSpeedButton = Instance.new("TextButton")
	ResetWalkSpeedButton.Parent = MenuFrame
	ResetWalkSpeedButton.Text = "Reset" WalkSpeedTextBox.TextScaled = true
	ResetWalkSpeedButton.Size = UDim2.new(0,50,0,50)
	ResetWalkSpeedButton.Position = UDim2.new(0.830,0,-0.001,0)
	ResetWalkSpeedButton.TextColor = BrickColor.new(Color3.fromRGB(255, 255, 255))
	ResetWalkSpeedButton.BackgroundColor3 = Color3.fromRGB(0,0, 0)
	ResetWalkSpeedButton.BackgroundTransparency = 0.3
	ResetWalkSpeedButton.TextTransparency = 0.3
	

WalkSpeedButton.MouseButton1Click:Connect(function()
	
	local speed = tonumber(WalkSpeedTextBox.Text)
	if speed and speed > 0 then
		
		if humanoid then
			humanoid.WalkSpeed = speed
			print("Now Your WalkSpeed: " .. speed)
		end
	else
		print("Cant Do This Number Try Other")
	end
end)

ResetWalkSpeedButton.MouseButton1Click:Connect(function()
	if humanoid then
		humanoid.WalkSpeed = 16
		print("WalkSpeed Reset")
	end
end)

	local JumpHeightButton = Instance.new("TextButton")
	JumpHeightButton.Parent = MenuFrame
	JumpHeightButton.Size = UDim2.new(0, 250, 0, 50)
	JumpHeightButton.Position = UDim2.new(0.0,0,0.04,0)
	JumpHeightButton.Text = "Set JumpHeight"
	JumpHeightButton.TextScaled = true
	JumpHeightButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	JumpHeightButton.TextTransparency = 0.3
	JumpHeightButton.BackgroundTransparency = 0.3
	JumpHeightButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

	local JumpHeightBox = Instance.new("TextBox")
	JumpHeightBox.Parent = JumpHeightButton
	JumpHeightBox.Text = "Write Number" JumpHeightBox.TextScaled = true
	JumpHeightBox.Size = UDim2.new(0,200,0,50)
	JumpHeightBox.Position = UDim2.new(1,2,0,0)
	JumpHeightBox.TextColor = BrickColor.new(Color3.fromRGB(255, 255, 255))
	JumpHeightBox.BackgroundColor3 = Color3.fromRGB(0,0, 0)
	JumpHeightBox.BackgroundTransparency = 0.3
	JumpHeightBox.TextTransparency = 0.3

	local ResetJumpHeight = Instance.new("TextButton")
	ResetJumpHeight.Parent = MenuFrame
	ResetJumpHeight.Text = "Reset" WalkSpeedTextBox.TextScaled = true
	ResetJumpHeight.Size = UDim2.new(0,50,0,50)
	ResetJumpHeight.Position = UDim2.new(0.830,0,0.040,0)
	ResetJumpHeight.TextColor = BrickColor.new(Color3.fromRGB(255, 255, 255))
	ResetJumpHeight.BackgroundColor3 = Color3.fromRGB(0,0, 0)
	ResetJumpHeight.BackgroundTransparency = 0.3
	ResetJumpHeight.TextTransparency = 0.3


JumpHeightButton.MouseButton1Click:Connect(function()

	local jump = tonumber(JumpHeightBox.Text)
	if jump and jump > 0 then

		if humanoid then
			humanoid.JumpHeight = jump
			print("Now Your JumpHeight: " .. jump)
		end
	else
		print("Cant Do This Number Try Other")
	end
end)

ResetJumpHeight.MouseButton1Click:Connect(function()
	if humanoid then
		humanoid.JumpHeight = 16
		print("WalkSpeed Reset")
	end
end)
