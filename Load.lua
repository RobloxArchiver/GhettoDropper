--[[

_G.Drops = value | Amount of drops
_G.TermProcess = bool | When you finish dropping
_G.SendChat = bool | Sends a start and leave message. 

]]

_G.Drops = 1
_G.TermProcess = false
_G.SendChat = true

loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/RobloxArchiver/GhettoDropper/main/src/drop.lua"))()