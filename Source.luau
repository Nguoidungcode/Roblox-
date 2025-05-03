local gui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
gui.Name = "SimpleMenu"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 200, 0, 150)
frame.Position = UDim2.new(0.5, -100, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

local btn = Instance.new("TextButton", frame)
btn.Size = UDim2.new(1, 0, 0, 50)
btn.Text = "Bấm vào đây"
btn.MouseButton1Click:Connect(function()
    print("Đã bấm nút")
end)
