--#region // Variables
local GDVer = "0.0.1-Release"
local Dropzone = game.Players.LocalPlayer.Character.Head.CFrame
local VirtualUser = game:GetService("VirtualUser") -- Anti AFK
--#endregion

print("GhettoDropper loaded. Using version: " .. GDVer)

--#region // Chat(msg, type) -- Useless but neat!
function SendChat(msg, type)
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, type)
end
--#endregion

--#region // AntiAFK
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
--#endregion

--#region // ProcessTerminate()
function ProcessTerminate()
    print("Process Complete! Terminating...")
    task.wait(5)
    game.Players.LocalPlayer:Kick("Terminated Drop Process.")
end
--#endregion

--#region //  Sends Starting Chat
if _G.SendChat == true then
    SendChat("Starting the drop of " .. _G.Drops .. " drops!", "All")
end
--#endregion

--#region // Main Dropping Function.
for i=1, _G.Drops do
    game:GetService("ReplicatedStorage").Event.Bank:FireServer("Drop", 100000, Dropzone)
    task.wait(20) -- Safe amount, too lazy to calculate the actual drop time limit. 
end
--#endregion

--#region // Final
if _G.SendChat == true then
    SendChat("Finished " .. _G.Drops .. " drops! Leaving!", "All")
end
task.wait(5)
if _G.TermProcess == true then
    ProcessTerminate()
end
--#endregion