--[[
V1.0 - Initial Commit]]--

if not pcall( require, "Inspired" ) then PrintChat("You are missing Inspired.lua - Go download it and save it in Common!") return end

SupportedHero = {["Akali"] = true}
Class = "Akali"

function Akali:__init()
OnTick(function(myHero) self:OnLoad(myHero) end)
OnDraw(function(myHero) self:On_Draw(myHero) end)
end)

Akali = MenuConfig("[ButterAIO", "ButterAIO")

Akali:Menu("Combo", "Combo")
Akali:Menu("Misc", "Misc")
