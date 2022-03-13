---@diagnostic disable: undefined-global

_G.Drops = 1 -- Drop amount
local Dropzone = game.Players.LocalPlayer.Character.Head.CFrame
local VirtualUser = game:GetService("VirtualUser") -- Anti AFK

game:GetService("Players").LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

function ProcessTerminate() -- Uneeded, it just kicks you when its done. 
    print("Process Complete! Terminating...")
    task.wait(5)
    game.Players.LocalPlayer:Kick("Terminated Drop Process.")
end

for i=1, _G.Drops do
    game:GetService("ReplicatedStorage").Event.Bank:FireServer("Drop", 100000, Dropzone)
    task.wait(20) -- Safe amount, too lazy to calculate the actual drop time limit. 
end

ProcessTerminate()