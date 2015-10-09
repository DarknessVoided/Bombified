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
