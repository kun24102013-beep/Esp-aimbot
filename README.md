-- TSB ULTIMATE POTATO MODE & REALTIME FPS
-- Bản vá lỗi cú pháp - Chạy mượt cho Mobile/iPad

local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

local localPlayer = Players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")

----------------------------------------------------
-- 1. BẢNG TÍNH FPS THỜI GIAN THỰC (SIÊU CHÍNH XÁC)
----------------------------------------------------
if playerGui:FindFirstChild("TSB_Ultra_FPS") then
    playerGui.TSB_Ultra_FPS:Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TSB_Ultra_FPS"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local fpsLabel = Instance.new("TextLabel")
fpsLabel.Size = UDim2.new(0, 100, 0, 25)
fpsLabel.Position = UDim2.new(0, 15, 0, 60) -- Nằm góc trái dưới nút chat
fpsLabel.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
fpsLabel.BackgroundTransparency = 0.3
fpsLabel.TextColor3 = Color3.fromRGB(0, 255, 128)
fpsLabel.TextSize = 13
fpsLabel.Font = Enum.Font.RobotoMono
fpsLabel.Text = "FPS: Đang tính..."
fpsLabel.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 6)
uiCorner.Parent = fpsLabel

local frameTimes = {}
RunService.RenderStepped:Connect(function()
    local now = os.clock()
    table.insert(frameTimes, now)
    
    while frameTimes[1] and frameTimes[1] < now - 1 do
        table.remove(frameTimes, 1)
    end
    
    local currentFps = #frameTimes
    fpsLabel.Text = "⚡ FPS: " .. tostring(currentFps)
    
    if currentFps >= 55 then
        fpsLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
    elseif currentFps >= 35 then
        fpsLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
    else
        fpsLabel.TextColor3 = Color3.fromRGB(255, 75, 75)
    end
end)

----------------------------------------------------
-- 2. TẮT ĐỒ HỌA & ĐỔ BÓNG LIGHTING
----------------------------------------------------
pcall(function()
    Lighting.GlobalShadows = false
    for _, effect in ipairs(Lighting:GetChildren()) do
        if effect:IsA("PostEffect") or effect:IsA("BloomEffect") or effect:IsA("BlurEffect") or effect:IsA("ColorCorrectionEffect") or effect:IsA("SunRaysEffect") then
            effect.Enabled = false
        end
    end
end)

----------------------------------------------------
-- 3. DIỆT SẠCH AURA, BỤI & HIỆU ỨNG CHIÊU THỨC
----------------------------------------------------
local function wipeOutLagObjects(object)
    pcall(function()
        -- Xóa sổ hoàn toàn hạt bụi, vệt lướt, hào quang, highlight nhân vật
        if object:IsA("ParticleEmitter") or object:IsA("Trail") or object:IsA("Beam") or object:IsA("Fire") or object:IsA("Smoke") or object:IsA("Sparkles") or object:IsA("Highlight") then
            object:Destroy()
            
        -- Xóa các khối Mesh khổng lồ làm hiệu ứng chiêu thức phát sáng
        elseif object:IsA("MeshPart") and (object.Name:lower():find("effect") or object.Name:lower():find("aura") or object.Name:lower():find("blast")) then
            object:Destroy()
            
        -- Xóa ảnh dán tường và nền đất để nhẹ máy
        elseif object:IsA("Decal") or object:IsA("Texture") then
            object:Destroy()
            
        -- Ép map về dạng nhựa phẳng không bóng đổ
        elseif object:IsA("BasePart") and not object:IsA("MeshPart") then
            object.Material = Enum.Material.SmoothPlastic
            object.CastShadow = false
        end
    end)
end

-- Quét dọn map hiện tại
for _, descendant in ipairs(Workspace:GetDescendants()) do
    wipeOutLagObjects(descendant)
end

-- Bắt và xóa ngay lập tức khi chiêu thức mới được tung ra
Workspace.DescendantAdded:Connect(function(descendant)
    task.wait()
    if descendant and descendant.Parent then
        wipeOutLagObjects(descendant)
    end
end)

print("=== TSB FIXED & READY ===")
