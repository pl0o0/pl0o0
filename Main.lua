print("Hello World")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Text",
    LoadingTitle = "Text",
    LoadingSubtitle = "pl0o0",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil, -- Create a custom folder for your hub/game
        FileName = "Big Hub"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
        RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
        Title = "Untitled",
        Subtitle = "Key System",
        Note = "No method of obtaining the key is provided",
        FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
        SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
        GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
        Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
})

local PlayerTab = Window:CreateTab("Player", 4483362458) -- Title, Image

-- WalkSpeed Slider
local Slider1 = PlayerTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {1, 10},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 10,
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        game.Players.LocalPlayer.Character:SetAttribute("SpeedMultiplier", Value)
    end,
})

-- Dash Length Slider
local Slider2 = PlayerTab:CreateSlider({
    Name = "Dash Length",
    Range = {10, 1000},
    Increment = 1,
    Suffix = "Length",
    CurrentValue = 10,
    Flag = "Slider2",
    Callback = function(Value)
        game.Players.LocalPlayer.Character:SetAttribute("DashLength", Value)
    end,
})

-- Jump Height Slider
local Slider3 = PlayerTab:CreateSlider({
    Name = "Jump Height",
    Range = {10, 500},
    Increment = 1,
    Suffix = "Height",
    CurrentValue = 10,
    Flag = "Slider3",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end,
})

-- ESP Button
local Button = PlayerTab:CreateButton({
    Name = "Enable ESP",
    Callback = function()
        -- プレイヤーがゲームに参加したときにESPを追加する
        game.Players.PlayerAdded:Connect(function(player)
            player.CharacterAdded:Connect(function(character)
                -- もしキャラクターが生成されたら
                local head = character:WaitForChild("Head")
                
                -- BillboardGuiの作成
                local espGui = Instance.new("BillboardGui")
                espGui.Parent = head
                espGui.Adornee = head  -- 表示される対象（ここでは頭）
                espGui.Size = UDim2.new(0, 200, 0, 50)  -- サイズ
                espGui.StudsOffset = Vector3.new(0, 3, 0)  -- どれくらいの位置に表示するか

                -- ESPのテキストラベルを作成
                local espLabel = Instance.new("TextLabel")
                espLabel.Parent = espGui
                espLabel.Text = player.Name  -- プレイヤー名を表示
                espLabel.TextColor3 = Color3.fromRGB(255, 0, 0)  -- テキストの色
                espLabel.BackgroundTransparency = 1  -- 背景を透明にする
                espLabel.TextSize = 20  -- テキストサイズ
                espLabel.TextStrokeTransparency = 0.8  -- 文字のストローク（輪郭）の透明度
            end)
        end)
    end,
})
