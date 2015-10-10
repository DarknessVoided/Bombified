--Require DLIB or no shit/Shit is still in progress

if GetObjectName(myHero) ~= "Quinn" then return end

require('DLib')

local Main = menu.addItem(SubMenu.new("Quinn - The Cat Hunter"))

local Combo = Main.addItem(SubMenu.new("Combo"))
	local useQ = Combo.addItem(MenuBool.new("Use Q",true))
	local useE = Combo.addItem(MenuBool.new("Use E",true))
	local useR = Combo.addItem(MenuBool.new("Use R",true))
	local ComboActive = Combo.addItem(MenuKeyBind.new("Combo", 32))

local Misc = Main.addItem(SubMenu.new("Misc"))
	local GapCloser = Misc.addItem(MenuBool.net("Use E against GapCloser", true))
	local Interrupt = Misc.addItem(MenuBool.net("Use E to Interrupt Spells", true))
	local AutoLvL = Misc.addItem(MenuBool.net("Auto level IN RWEQ", false))
	local FleeActive = Misc.addItem(MenuKeyBind.new("Flee using Ultimate", 0x56))

--My local Stuff
local ValidTarget = d.ValidTarget
local IsInDistance = d.IsInDistance

OnLoop(function(myHero)
Combo()
Interrupt()
AutoLvL()
end)

function Combo()
	if 	if KeyIsDown(32) and ValidTarget(target) then

			local QPred = GetPredictionForPlayer(GetOrigin(target),target,GetMoveSpeed(target),2000,250,GetCastRange(myHero,_Q),60,true,true)
			if QPred.Hitchance == 1 and Combo.UseQ:Value() then
					CastSkillShot(_Q, QPred.PredPos.x,QPred.PredPos.y, QPred.PredPos.z)