-- Menu Hack Blox Fruits Full (Android GUI)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Blox Fruits Hack Mobile", "DarkTheme")

-- ========== Auto Farm ==========
local AutoFarmTab = Window:NewTab("Auto Farm")
local FarmSection = AutoFarmTab:NewSection("Level / Quái")

FarmSection:NewToggle("Auto Farm Level", "Tự farm quái theo level", function(state)
    _G.AutoFarm = state
    while _G.AutoFarm do
        wait()
        -- Nhận quest + dịch chuyển đến quái
        local args = {
            [1] = "StartQuest",
            [2] = "BanditQuest1",
            [3] = 1
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        wait(1)
        local enemy = game:GetService("Workspace").Enemies:FindFirstChild("Bandit [Lv. 5]")
        if enemy and enemy:FindFirstChild("HumanoidRootPart") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame
        end
    end
end)

-- ========== Farm Boss ==========
local BossSection = AutoFarmTab:NewSection("Boss")

local bosses = {"The Gorilla King", "Bobby", "Yeti", "Mob Leader", "Vice Admiral", "Warden", "Chief Warden", "Swan"}
BossSection:NewDropdown("Chọn Boss", "Farm boss cụ thể", bosses, function(bossName)
    _G.SelectedBoss = bossName
end)

BossSection:NewToggle("Auto Farm Boss", "Farm boss đã chọn", function(state)
    _G.FarmBoss = state
    while _G.FarmBoss do
        wait()
        local boss = game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectedBoss)
        if boss and boss:FindFirstChild("HumanoidRootPart") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame
        end
    end
end)

BossSection:NewToggle("Farm All Boss", "Tìm & farm tất cả boss", function(state)
    _G.FarmAllBoss = state
    while _G.FarmAllBoss do
        wait()
        for _,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if string.find(v.Name, "Boss") or v.Name == "Swan" then
                if v:FindFirstChild("HumanoidRootPart") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                    break
                end
            end
        end
    end
end)

-- ========== Combat ==========
local CombatTab = Window:NewTab("Combat")
local CombatSection = CombatTab:NewSection("Tấn công")

CombatSection:NewToggle("Fast Attack", "Tấn công nhanh", function(state)
    _G.FastAttack = state
    while _G.FastAttack do
        wait(0.1)
        game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
        wait(0.05)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
    end
end)

-- ========== Teleport ==========
local TeleportTab = Window:NewTab("Teleport")
local TeleportSection = TeleportTab:NewSection("Đảo")

local islands = {
    ["Pirate Starter"] = Vector3.new(1037, 125, 1245),
    ["Marine Starter"] = Vector3.new(-260, 8, 2050),
    ["Jungle"] = Vector3.new(-1497, 12, 110),
    ["Desert"] = Vector3.new(1160, 5, 4300),
    ["Frozen Village"] = Vector3.new(1146, 125, -1327)
}

TeleportSection:NewDropdown("Chọn đảo", "Dịch chuyển tới đảo", {"Pirate Starter", "Marine Starter", "Jungle", "Desert", "Frozen Village"}, function(choice)
    local pos = islands[choice]
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
end)

-- ========== Farm Nguyên liệu ==========
local MaterialTab = Window:NewTab("Nguyên liệu")
local MaterialSection = MaterialTab:NewSection("Farm Bone / Material")

MaterialSection:NewToggle("Farm Bone", "Tự farm bone (Halloween)", function(state)
    _G.FarmBone = state
    while _G.FarmBone do
        wait()
        for _,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if v:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                break
            end
        end
    end
end)

MaterialSection:NewButton("Farm Material (test)", "Dịch chuyển đến NPC nguyên liệu", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1153, 7, 4372)
end)

-- ========== Chọn Vũ Khí ==========
local WeaponTab = Window:NewTab("Vũ khí")
local WeaponSection = WeaponTab:NewSection("Chọn")

WeaponSection:NewDropdown("Chọn vũ khí", "Melee, Sword, Fruit", {"Melee", "Sword", "Fruit", "Gun"}, function(choice)
    _G.Weapon = choice
    print("Đã chọn vũ khí: "..choice)
end)
