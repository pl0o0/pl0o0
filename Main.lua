local plr = game.Players.LocalPlayer
local chara = plr.Character or plr.CharacterAdded:Wait()
local Humaoid = chara:WaitForChild("Humanoid")

local screenGui = Instance.new("ScreenGui")  -- ScreenGui を作成
screenGui.Parent =plr:WaitForChild("PlayerGui")  -- プレイヤーの PlayerGui に追加

local frame = Instance.new("Frame")  -- Frame を作成
frame.Parent = screenGui  -- ScreenGui の子に追加

-- Frame のプロパティを設定
frame.Size = UDim2.new(0, 255, 0, 247)  -- サイズ {0, 255},{0, 247}
frame.Position = UDim2.new(0.75, 0, 0.041, 0)  -- 位置 {0.75, 0},{0.041, 0}
frame.BackgroundTransparency = 0.5  -- 背景の透明度を0.5に設定
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- 色を黒に設定

-- ボタンを作成
local button = Instance.new("TextButton")
button.Parent = frame  -- Frame の子に追加

-- ボタンのサイズと位置を設定（6等分の1つ目を作成）
button.Size = UDim2.new(0, 255, 0, 247 / 6)  -- フレームの高さを6等分したうちの1つ
button.Position = UDim2.new(0, 0, 0, 0)  -- フレームの一番上に配置
button.Text = "WalkSpeed"  -- ボタンのテキスト
button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- ボタンの背景色（赤に設定）

-- ボタンのテキストの設定（中央揃え）
button.TextColor3 = Color3.fromRGB(255, 255, 255)  -- テキストを白に設定
button.TextSize = 20  -- テキストサイズを設定
button.TextStrokeTransparency = 0.5  -- テキストのストローク透明度を設定
button.TextScaled = true

button.TextXAlignment = Enum.TextXAlignment.Center  -- 水平方向（X軸）の中央に配置
button.TextYAlignment = Enum.TextYAlignment.Center  -- 垂直方向（Y軸）の中央に配置-- テキストの配置を中央に設定

button.MouseButton1Click:Connect(function(player)
	chara.Humanoid.WalkSpeed += 10
end)

local button2 = Instance.new("TextButton")
button2.Name = "TextButton2"
button2.Parent = frame  -- Frame の子に追加

-- ボタンのサイズと位置を設定（6等分の1つ目を作成）
button2.Size = UDim2.new(0, 255, 0, 247 / 6)  -- フレームの高さを6等分したうちの1つ
button2.Position = UDim2.new(0, 0, 0, 42)  -- フレームの一番上に配置
button2.Text = "AimBot"  -- ボタンのテキスト
button2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- ボタンの背景色（赤に設定）

-- ボタンのテキストの設定（中央揃え）
button2.TextColor3 = Color3.fromRGB(255, 255, 255)  -- テキストを白に設定
button2.TextSize = 20  -- テキストサイズを設定
button2.TextStrokeTransparency = 0.5  -- テキストのストローク透明度を設定
button2.TextScaled = true

button.TextXAlignment = Enum.TextXAlignment.Center  -- 水平方向（X軸）の中央に配置
button.TextYAlignment = Enum.TextYAlignment.Center  -- 垂直方向（Y軸）の中央に配置-- テキストの配置を中央に設定

local player = game.Players.LocalPlayer
local camera = game.Workspace.CurrentCamera
local mouse = player:GetMouse()

-- 目標プレイヤーの頭を見つける
local function findTarget()
	local closestPlayer = nil
	local closestDistance = math.huge  -- 最大の距離で初期化（近いプレイヤーを探すため）

	for _, otherPlayer in pairs(game.Players:GetPlayers()) do
		if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("Head") then
			local head = otherPlayer.Character.Head
			local distance = (head.Position - camera.CFrame.Position).magnitude
			if distance < closestDistance then
				closestDistance = distance
				closestPlayer = otherPlayer
			end
		end
	end

	return closestPlayer
end

-- 左クリックしている間に視点を合わせる
local function aimAtTarget(targetPlayer)
	if targetPlayer then
		local targetHead = targetPlayer.Character.Head
		-- カメラのCFrameをターゲットの頭に向ける
		camera.CFrame = CFrame.new(camera.CFrame.Position, targetHead.Position)
	end
end

-- クリックしている間に視点を合わせる
local aiming = false
mouse.Button1Down:Connect(function()
	aiming = true
end)

mouse.Button1Up:Connect(function()
	aiming = false
end)

-- 毎フレームの処理
game:GetService("RunService").RenderStepped:Connect(function()
	if aiming then
		local targetPlayer = findTarget()
		aimAtTarget(targetPlayer)
	end
end)
