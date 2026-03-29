-- DELTA UI | ESCAPE TSUNAMI SAFE SCRIPT

-- noks | hub (GUI + your script inserted)

local Players = game:GetService("Players")

local player = Players.LocalPlayer

local PlayerGui = player:WaitForChild("PlayerGui")

-- Auto copy discord link

setclipboard("https://discord.gg/7t2EQmFYSE")

-- Cleanup

pcall(function()

    PlayerGui:FindFirstChild("SideMenuUI"):Destroy()

end)

-- ================= GUI =================

local gui = Instance.new("ScreenGui", PlayerGui)

gui.Name = "SideMenuUI"

gui.ResetOnSpawn = false

-- Open button

local openBtn = Instance.new("TextButton", gui)

openBtn.Size = UDim2.new(0,50,0,140)

openBtn.Position = UDim2.new(1,-50,0.5,-70)

openBtn.Text = "≡"

openBtn.TextScaled = true

openBtn.BackgroundColor3 = Color3.fromRGB(20,20,25)

openBtn.TextColor3 = Color3.new(1,1,1)

openBtn.BorderSizePixel = 0

Instance.new("UICorner", openBtn).CornerRadius = UDim.new(0,12)

-- Main frame (box)

local main = Instance.new("Frame", gui)

main.Size = UDim2.new(0,520,0,300)

main.Position = UDim2.new(0.5,-260,0.5,-150)

main.BackgroundColor3 = Color3.fromRGB(18,18,22)

main.Visible = false

main.BorderSizePixel = 0

Instance.new("UICorner", main).CornerRadius = UDim.new(0,16)

-- Sidebar

local sidebar = Instance.new("Frame", main)

sidebar.Size = UDim2.new(0,140,1,0)

sidebar.BackgroundColor3 = Color3.fromRGB(22,22,28)

sidebar.BorderSizePixel = 0

Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0,16)

local title = Instance.new("TextLabel", sidebar)

title.Size = UDim2.new(1,-20,0,40)

title.Position = UDim2.new(0,10,0,10)

title.Text = "NOKS | HUB"

title.Font = Enum.Font.GothamBold

title.TextScaled = true

title.TextColor3 = Color3.fromRGB(230,230,230)

title.BackgroundTransparency = 1

local function sideBtn(txt,y)

    local b = Instance.new("TextButton", sidebar)

    b.Size = UDim2.new(0,110,0,40)

    b.Position = UDim2.new(0,15,0,y)

    b.Text = txt

    b.Font = Enum.Font.GothamBold

    b.TextScaled = true

    b.TextColor3 = Color3.new(1,1,1)

    b.BackgroundColor3 = Color3.fromRGB(38,38,48)

    b.BorderSizePixel = 0

    Instance.new("UICorner", b).CornerRadius = UDim.new(0,10)

    return b

end

local mainBtn = sideBtn("Main",60)

local duperBtn = sideBtn("Duper",120)

-- Content frame

local mainContent = Instance.new("Frame", main)

mainContent.Size = UDim2.new(1,-150,1,-20)

mainContent.Position = UDim2.new(0,150,0,10)

mainContent.BackgroundColor3 = Color3.fromRGB(28,28,34)

mainContent.BorderSizePixel = 0

Instance.new("UICorner", mainContent).CornerRadius = UDim.new(0,12)

-- =========================

-- YOUR SCRIPT STARTS HERE

-- =========================

local RunService = game:GetService("RunService")

local UserInputService = game:GetService("UserInputService")

local Workspace = game:GetService("Workspace")

local char = player.Character or player.CharacterAdded:Wait()

local hrp = char:WaitForChild("HumanoidRootPart")

local humanoid = char:FindFirstChild("Humanoid") or char:WaitForChild("Humanoid")

local savedCF = nil

local speedOn = false

local speedValue = 16

-- Character setup after respawn

local function setupCharacter()

    char = player.Character or player.CharacterAdded:Wait()

    hrp = char:WaitForChild("HumanoidRootPart")

    humanoid = char:FindFirstChild("Humanoid") or char:WaitForChild("Humanoid")

end

player.CharacterAdded:Connect(setupCharacter)

-- ===== Helper Function =====

local function createButton(parent,text,posY)

    local btn = Instance.new("TextButton", parent)

    btn.Size = UDim2.new(0.85,-20,0,32)

    btn.Position = UDim2.new(0,10,0,posY)

    btn.Text = text

    btn.Font = Enum.Font.GothamSemibold

    btn.TextSize = 15

    btn.TextColor3 = Color3.fromRGB(245,245,245)

    btn.BackgroundColor3 = Color3.fromRGB(70,90,190)

    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,12)

    return btn

end

-- ===== Main Frame (inside mainContent) =====

local mainFrame = Instance.new("Frame", mainContent)

mainFrame.Size = UDim2.new(1,0,1,0)

mainFrame.BackgroundTransparency = 1

mainFrame.Visible = true

-- Scroll

local mainScroll = Instance.new("ScrollingFrame", mainFrame)

mainScroll.Size = UDim2.new(1,0,1,0)

mainScroll.CanvasSize = UDim2.new(0,0,0,900)

mainScroll.ScrollBarThickness = 10

mainScroll.BackgroundTransparency = 1

local mainLayout = Instance.new("UIListLayout", mainScroll)

mainLayout.SortOrder = Enum.SortOrder.LayoutOrder

mainLayout.Padding = UDim.new(0,10)

-- Main Title

local mainTitle = Instance.new("TextLabel", mainScroll)

mainTitle.Size = UDim2.new(1,-20,0,40)

mainTitle.Position = UDim2.new(0,10,0,10)

mainTitle.BackgroundTransparency = 1

mainTitle.Text = "Main"

mainTitle.Font = Enum.Font.GothamBold

mainTitle.TextSize = 20

mainTitle.TextColor3 = Color3.fromRGB(235,235,255)

-- Buttons

local saveBtn = createButton(mainScroll,"📌 Save Position",60)

saveBtn.MouseButton1Click:Connect(function() savedCF = hrp.CFrame end)

local instaBtn = createButton(mainScroll,"⚡ Insta TP",120)

instaBtn.MouseButton1Click:Connect(function() if savedCF then hrp.CFrame = savedCF end end)

local tpForwardBtn = createButton(mainScroll,"➡ TP Forward (+40)",180)

tpForwardBtn.MouseButton1Click:Connect(function()

    hrp.CFrame = hrp.CFrame * CFrame.new(0,0,-40)

end)

local speedToggle = createButton(mainScroll,"⚡ Toggle Speed",240)

local speedBox = Instance.new("TextBox", mainScroll)

speedBox.Size = UDim2.new(0.6,0,0,30)

speedBox.Position = UDim2.new(0,10,0,300)

speedBox.PlaceholderText = "WalkSpeed"

speedBox.TextColor3 = Color3.fromRGB(245,245,245)

speedBox.BackgroundColor3 = Color3.fromRGB(50,50,70)

Instance.new("UICorner", speedBox).CornerRadius = UDim.new(0,8)

speedBox:GetPropertyChangedSignal("Text"):Connect(function()

    local clean = speedBox.Text:gsub("%D","")

    if speedBox.Text ~= clean then

        speedBox.Text = clean

    end

    local val = tonumber(speedBox.Text)

    if val and val > 500 then

        speedBox.TextColor3 = Color3.fromRGB(255,80,80)

        speedBox.Text = "500 ONLY"

    else

        speedBox.TextColor3 = Color3.fromRGB(245,245,245)

    end

end)

speedToggle.MouseButton1Click:Connect(function()

    local val = tonumber(speedBox.Text)

    if not val then return end

    speedValue = math.clamp(val, 0, 500)

    speedOn = not speedOn

    if humanoid then

        humanoid.WalkSpeed = speedOn and speedValue or 16

    end

    speedToggle.BackgroundColor3 =

        speedOn and Color3.fromRGB(120,200,120)

        or Color3.fromRGB(70,90,190)

end)

-- Duper Frame (inside mainContent)

local duperFrame = Instance.new("Frame", mainContent)

duperFrame.Size = UDim2.new(1,0,1,0)

duperFrame.BackgroundTransparency = 1

duperFrame.Visible = false

-- Scroll for duper

local duperScroll = Instance.new("ScrollingFrame", duperFrame)

duperScroll.Size = UDim2.new(1,0,1,0)

duperScroll.CanvasSize = UDim2.new(0,0,0,900)

duperScroll.ScrollBarThickness = 10

duperScroll.BackgroundTransparency = 1

local duperLayout = Instance.new("UIListLayout", duperScroll)

duperLayout.SortOrder = Enum.SortOrder.LayoutOrder

duperLayout.Padding = UDim.new(0,10)

local duperTitle = Instance.new("TextLabel", duperScroll)

duperTitle.Size = UDim2.new(1,-20,0,40)

duperTitle.Position = UDim2.new(0,10,0,10)

duperTitle.BackgroundTransparency = 1

duperTitle.Text = "Duper"

duperTitle.Font = Enum.Font.GothamBold

duperTitle.TextSize = 20

duperTitle.TextColor3 = Color3.fromRGB(235,235,255)

-- Duper buttons (same as your original)

local dupeBrainrotToggle = false

local dupeBrainrotBtn = createButton(duperScroll,"Dupe Brainrot",60)

dupeBrainrotBtn.MouseButton1Click:Connect(function()

    dupeBrainrotToggle = not dupeBrainrotToggle

    if dupeBrainrotToggle then

        local tool = player.Character and player.Character:FindFirstChildOfClass("Tool")

        if tool then

            local newTool = tool:Clone()

            newTool.Parent = player.Backpack

            dupeBrainrotBtn.BackgroundColor3 = Color3.fromRGB(120,200,120)

        end

    else

        dupeBrainrotBtn.BackgroundColor3 = Color3.fromRGB(70,90,190)

    end

end)

local infJumpToggle = false

local infJumpBtn = createButton(duperScroll,"Infinite Jump",120)

infJumpBtn.MouseButton1Click:Connect(function()

    infJumpToggle = not infJumpToggle

    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")

    if humanoid then

        humanoid.JumpHeight = infJumpToggle and 100 or 50

        infJumpBtn.BackgroundColor3 = infJumpToggle and Color3.fromRGB(120,200,120) or Color3.fromRGB(70,90,190)

    end

end)

local noClipToggle = false

local noClipBtn = createButton(duperScroll,"No Clip",180)

noClipBtn.MouseButton1Click:Connect(function()

    noClipToggle = not noClipToggle

    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")

    if humanoid then

        humanoid.PlatformStand = noClipToggle

        noClipBtn.BackgroundColor3 = noClipToggle and Color3.fromRGB(120,200,120) or Color3.fromRGB(70,90,190)

    end

end)

-- Buttons to switch tabs

mainBtn.MouseButton1Click:Connect(function()

    mainFrame.Visible = true

    duperFrame.Visible = false

end)

duperBtn.MouseButton1Click:Connect(function()

    mainFrame.Visible = false

    duperFrame.Visible = true

end)

openBtn.MouseButton1Click:Connect(function()

    main.Visible = not main.Visible

end)

-- Speed force

RunService.RenderStepped:Connect(function()

    if humanoid then

        humanoid.WalkSpeed = speedOn and speedValue or 16

    end

end)

-- TP forward keybind

UserInputService.InputBegan:Connect(function(input,gpe)

    if gpe then return end

    if input.KeyCode == Enum.KeyCode.F then

        hrp.CFrame = hrp.CFrame * CFrame.new(0,0,-40)

    end

end)
