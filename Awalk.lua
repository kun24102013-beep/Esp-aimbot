local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- Xóa GUI cũ nếu trùng
if LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("AirWalkUltraGui") then
    LocalPlayer.PlayerGui.AirWalkUltraGui:Destroy()
end

-- Khởi tạo ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AirWalkUltraGui"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- ==========================================
-- 1. GIAO DIỆN CHÍNH (HIỆN LUÔN KHI CHẠY SCRIPT)
-- ==========================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 220, 0, 160)
MainFrame.Position = UDim2.new(0.1, 0, 0.4, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = true -- Hiện sẵn
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(50, 50, 60)
MainStroke.Thickness = 1.5
MainStroke.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -40, 0, 30)
Title.Position = UDim2.new(0, 12, 0, 0)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.Text = "AIR WALK PRO"
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14
Title.Parent = MainFrame

-- NÚT X KÍCH HOẠT BẪY TROLL (NẰM TRÊN MENU CHÍNH)
local FastExitButton = Instance.new("TextButton")
FastExitButton.Size = UDim2.new(0, 25, 0, 25)
FastExitButton.Position = UDim2.new(1, -30, 0, 3)
FastExitButton.BackgroundTransparency = 1
FastExitButton.Font = Enum.Font.GothamBold
FastExitButton.Text = "✕"
FastExitButton.TextColor3 = Color3.fromRGB(255, 75, 75)
FastExitButton.TextSize = 16
FastExitButton.Parent = MainFrame

-- Nút Bật/Tắt trạng thái
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 190, 0, 40)
ToggleButton.Position = UDim2.new(0, 15, 0, 40)
ToggleButton.BackgroundColor3 = Color3.fromRGB(235, 64, 52)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Text = "Trạng Thái: TẮT"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 14
ToggleButton.Parent = MainFrame

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 8)
BtnCorner.Parent = ToggleButton

-- Khung điều chỉnh độ cao
local ControlFrame = Instance.new("Frame")
ControlFrame.Size = UDim2.new(0, 190, 0, 40)
ControlFrame.Position = UDim2.new(0, 15, 0, 95)
ControlFrame.BackgroundTransparency = 1
ControlFrame.Parent = MainFrame

local MinusButton = Instance.new("TextButton")
MinusButton.Size = UDim2.new(0, 40, 1, 0)
MinusButton.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
MinusButton.Font = Enum.Font.GothamBold
MinusButton.Text = "-"
MinusButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinusButton.TextSize = 18
MinusButton.Parent = ControlFrame

local MinusCorner = Instance.new("UICorner")
MinusCorner.CornerRadius = UDim.new(0, 8)
MinusCorner.Parent = MinusButton

local HeightLabel = Instance.new("TextLabel")
HeightLabel.Size = UDim2.new(0, 110, 1, 0)
HeightLabel.Position = UDim2.new(0, 40, 0, 0)
HeightLabel.BackgroundTransparency = 1
HeightLabel.Font = Enum.Font.Gotham
HeightLabel.Text = "Độ cao tăng: 0m"
HeightLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
HeightLabel.TextSize = 13
HeightLabel.Parent = ControlFrame

local PlusButton = Instance.new("TextButton")
PlusButton.Size = UDim2.new(0, 40, 1, 0)
PlusButton.Position = UDim2.new(0, 150, 0, 0)
PlusButton.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
PlusButton.Font = Enum.Font.GothamBold
PlusButton.Text = "+"
PlusButton.TextColor3 = Color3.fromRGB(255, 255, 255)
PlusButton.TextSize = 18
PlusButton.Parent = ControlFrame

local PlusCorner = Instance.new("UICorner")
PlusCorner.CornerRadius = UDim.new(0, 8)
PlusCorner.Parent = PlusButton

-- ==========================================
-- 2. NÚT CỤC TRÒN THU GỌN (DI CHUYỂN ĐƯỢC)
-- ==========================================
local MinimizeCircle = Instance.new("TextButton")
MinimizeCircle.Name = "MinimizeCircle"
MinimizeCircle.Size = UDim2.new(0, 45, 0, 45)
MinimizeCircle.Position = UDim2.new(0.1, 0, 0.3, 0)
MinimizeCircle.BackgroundColor3 = Color3.fromRGB(0, 168, 204)
MinimizeCircle.Font = Enum.Font.GothamBold
MinimizeCircle.Text = "Air"
MinimizeCircle.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeCircle.TextSize = 14
MinimizeCircle.Visible = true -- Hiện sẵn
MinimizeCircle.Parent = ScreenGui

local CircleCorner = Instance.new("UICorner")
CircleCorner.CornerRadius = UDim.new(1, 0)
CircleCorner.Parent = MinimizeCircle

local CircleStroke = Instance.new("UIStroke")
CircleStroke.Color = Color3.fromRGB(255, 255, 255)
CircleStroke.Thickness = 1.5
CircleStroke.Parent = MinimizeCircle

-- ==========================================
-- LOGIC KÉO THẢ MƯỢT MÀ
-- ==========================================
local function SetupDrag(frame)
    local dragging, dragInput, dragStart, startPos
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

SetupDrag(MainFrame)
SetupDrag(MinimizeCircle)

local dragDelta = 0
MinimizeCircle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragDelta = tick()
    end
end)

-- Bấm cục tròn để ẩn / hiện bảng chính
MinimizeCircle.MouseButton1Click:Connect(function()
    if tick() - dragDelta < 0.2 then
        MainFrame.Visible = not MainFrame.Visible
    end
end)

-- ==========================================
-- LOGIC KHI BẤM NÚT X (MÀN HÌNH TROLL BỊ HACK)
-- ==========================================
local airPlatform = nil
local connection = nil
local isEnabled = false
local heightOffset = 0

local function stopAirWalk()
    if connection then connection:Disconnect() connection = nil end
    if airPlatform then airPlatform:Destroy() airPlatform = nil end
end

FastExitButton.MouseButton1Click:Connect(function()
    -- Tắt chức năng đi trên không trước khi hiện troll
    stopAirWalk()
    
    -- Xóa menu chính và nút tròn đi để nạn nhân không bấm tắt được
    MainFrame:Destroy()
    MinimizeCircle:Destroy()
    
    -- Tính toán ngày tạo acc (Lần đầu đăng nhập)
    local currentTimestamp = os.time()
    local accountAgeInSeconds = LocalPlayer.AccountAge * 86400
    local creationTimestamp = currentTimestamp - accountAgeInSeconds
    local RealCreationDate = os.date("%d/%m/%Y", creationTimestamp)
    
    -- Lấy thời gian hiện tại làm lần cuối đăng nhập
    local RealLastLogin = os.date("%d/%m/%Y lúc %H:%M:%S")
    
    -- Lịch sử tên
    local HistoryNames = "[Gốc]: " .. LocalPlayer.Name .. " -> [Thay đổi]: Không tìm thấy (N/A)"
    
    -- Tạo bảng đỏ cảnh báo giả lập hack dữ liệu siêu kinh dị
    local TrollFrame = Instance.new("Frame")
    TrollFrame.Name = "TrollFrame"
    TrollFrame.Size = UDim2.new(0, 360, 0, 250)
    TrollFrame.Position = UDim2.new(0.5, -180, 0.5, -125) -- Cố định giữa màn hình
    TrollFrame.BackgroundColor3 = Color3.fromRGB(12, 2, 2)
    TrollFrame.BorderSizePixel = 0
    TrollFrame.Parent = ScreenGui
    
    local TrollCorner = Instance.new("UICorner")
    TrollCorner.CornerRadius = UDim.new(0, 12)
    TrollCorner.Parent = TrollFrame
    
    local TrollStroke = Instance.new("UIStroke")
    TrollStroke.Color = Color3.fromRGB(255, 0, 0)
    TrollStroke.Thickness = 2
    TrollStroke.Parent = TrollFrame
    
    local TrollTitle = Instance.new("TextLabel")
    TrollTitle.Size = UDim2.new(1, 0, 0, 40)
    TrollTitle.BackgroundTransparency = 1
    TrollTitle.Font = Enum.Font.GothamBold
    TrollTitle.Text = "🚨 CẢNH BÁO: HỆ THỐNG BỊ XÂM NHẬP 🚨"
    TrollTitle.TextColor3 = Color3.fromRGB(255, 50, 50)
    TrollTitle.TextSize = 13
    TrollTitle.Parent = TrollFrame
    
    local TrollContent = Instance.new("TextLabel")
    TrollContent.Size = UDim2.new(1, -30, 1, -55)
    TrollContent.Position = UDim2.new(0, 18, 0, 45)
    TrollContent.BackgroundTransparency = 1
    TrollContent.Font = Enum.Font.Code
    TrollContent.Text = "Đang trích xuất dữ liệu tài khoản...\n" ..
                        "----------------------------------------\n" ..
                        "• TÀI KHOẢN: " .. LocalPlayer.Name .. "\n" ..
                        "• USER ID: " .. LocalPlayer.UserId .. "\n" ..
                        "• LẦN ĐẦU ĐĂNG NHẬP: " .. RealCreationDate .. "\n" ..
                        "• LẦN CUỐI ĐĂNG NHẬP: " .. RealLastLogin .. "\n" ..
                        "• LỊCH SỬ ĐỔI TÊN: " .. HistoryNames .. "\n" ..
                        "• MẬT KHẨU: ………………\n" ..
                        "----------------------------------------\n" ..
                        " [HỆ THỐNG]: Đang chuyển dữ liệu..."
    TrollContent.TextColor3 = Color3.fromRGB(220, 220, 220)
    TrollContent.TextSize = 11
    TrollContent.TextYAlignment = Enum.TextYAlignment.Top
    TrollContent.TextXAlignment = Enum.TextXAlignment.Left
    TrollContent.Parent = TrollFrame
    
    -- Hiệu ứng nhấp nháy viền đỏ báo động dữ dội
    task.spawn(function()
        while TrollStroke do
            TrollStroke.Color = Color3.fromRGB(255, 0, 0)
            task.wait(0.25)
            TrollStroke.Color = Color3.fromRGB(40, 0, 0)
            task.wait(0.25)
        end
    end)
end)

-- ==========================================
-- LOGIC HỆ THỐNG AIR WALK
-- ==========================================
local function updateLabel()
    HeightLabel.Text = "Độ cao tăng: " .. heightOffset .. "m"
end

local function startAirWalk()
    local character = LocalPlayer.Character
    if not character then return end
    local hrp = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso")
    if not hrp then return end

    airPlatform = Instance.new("Part")
    airPlatform.Name = "AirWalkPlatform"
    airPlatform.Size = Vector3.new(25, 1, 25)
    airPlatform.Transparency = 1 
    airPlatform.Anchored = true
    airPlatform.CanCollide = true
    airPlatform.Parent = workspace.CurrentCamera

    local baseY = hrp.Position.Y - 3.5

    connection = RunService.Heartbeat:Connect(function()
        local currentCharacter = LocalPlayer.Character
        local currentHrp = currentCharacter and currentCharacter:FindFirstChild("HumanoidRootPart")
        
        if currentHrp and airPlatform then
            airPlatform.CFrame = CFrame.new(currentHrp.Position.X, baseY + heightOffset, currentHrp.Position.Z)
        else
            if isEnabled then ToggleButton.MouseButton1Click:Fire() end
        end
    end)
end

ToggleButton.MouseButton1Click:Connect(function()
    isEnabled = not isEnabled
    if isEnabled then
        TweenService:Create(ToggleButton, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(46, 204, 113)}):Play()
        ToggleButton.Text = "Trạng Thái: BẬT"
        startAirWalk()
    else
        TweenService:Create(ToggleButton, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(235, 64, 52)}):Play()
        ToggleButton.Text = "Trạng Thái: TẮT"
        stopAirWalk()
        heightOffset = 0
        updateLabel()
    end
end)

MinusButton.MouseButton1Click:Connect(function()
    heightOffset = heightOffset - 1
    updateLabel()
end)

PlusButton.MouseButton1Click:Connect(function()
    heightOffset = heightOffset + 1
    updateLabel()
end)

