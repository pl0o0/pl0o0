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
