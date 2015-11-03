if GetObjectName(GetMyHero()) ~= "Irelia" then return end

if not pcall( require, "Inspired" ) then PrintChat("You are missing Inspired.lua - Go and download it and save it in Common!") return end

local IreliaMenu = MenuConfig("Irelia", "Irelia")

IreliaMenu:Menu("Combo", "Combo Settings")
IreliaMenu.Combo:Boolean("Q", "Use Q", true)
IreliaMenu.Combo:Boolean("W", "Use W", true)
IreliaMenu.Combo:Boolean("E", "Use E", true)
IreliaMenu.Combo:Boolean("R", "Use R", true)

IreliaMenu:Menu("LaneClear", "LaneClear Settings")
IreliaMenu.LaneClear:Boolean("Q", "Use Q", true)
IreliaMenu,LaneClear:Boolean("R", "Use R in LaneClear(EnemyCheck will be added)", false)
IreliaMenu.LaneClear:Slider("Mana", "Only use Skill when mana >", 30, 0, 100, 1)

IreliaMenu:Menu("Harass", "Harass Settings")
IreliaMenu.Harass:Boolean("Q", "Use Q" true)
IreliaMenu.Harass:Boolean("W", "Use W", true)
IreliaMenu.Harass:Boolean("E", "Use E", true)
IreliaMenu.Harass:Slider("Mana", "Only use Skill when mana >", 30, 0, 100, 1)

ts = TargetSelector("ts", "Target Selector",  DAMAGE_PHYSICAL, 1400, TARGET_LOW_HP)
IreliaMenu:TargetSelector("ts", "Target Selector", "blahblah", "blahblah")

OnTick(function(myHero)
	if IOW:mode() == "Combo" then
		Combo()
	end
	
	for _,mob in pairs(minionManager.objects) do
	if IOW:mode() == "LaneClear" and GetTeam(mob) == QRange then
		LaneClear()
	end
	
	if IOW:mode() == "Harass" then
	Harass()
	end
	Checks()
	local RPred = GetPredictionForPlayer(myHeroPos(),target,GetMoveSpeed(target),math.huge,100,40,false,false)
end)

function Harass()
	if IreliaMenu.Harass.Q:value and ValidTarget(target, QRange) isReady(_Q) and GetPercentMP(myHero) >= IreliaMenu.Harass.Mana:value() then
		CastTargetSpell(target,_Q)
	end
	
	if IreliaMenu.Harass.W:value() and IsReady(_W) and IsInDistance(target, WRange) and GetPercentMP(myHero) >= IreliaMenu.Harass.Mana:value() then
		CastSpell(_W)
	end

	if IreliaMenu.Harass.E:Value() and IsReady(_E) and IsInDistance(target, ERange) and GetPercentMP(myHero) >= IreliaMenu.Harass.Mana:value() then
			CastTargetSpell(target,_E)
	end
end

function Checks()
	local QRange = GetCastRange(myHero,_Q)
	local WRange = GetCastRange(myHero,_W)
	local ERange = GetCastRange(myHero,_E)
	local RRange = GetCastRange(myHero,_R)
end

function LaneClear()
local mob = GetOrigin(mob)
local SpellDMG = GetCastLevel(myHero,_Q)

local Calc = 
	if IsReady(_Q) and IreliaMenu.LaneClear.Q:value() and GetPercentMP(myHero) >= IreliaMenu.LaneClear.Mana:value() and ValidTarget(mob, QRange) then
		CastTargetSpell(mob,_Q)
	end
end

function Combo()
	if IsReady(_Q) and IreliaMenu.Combo.Q:value() and ValidTarget(target, QRange) and IsInDistance(target, QRange) then
		CastTargetSpell(target,_Q)
	end
	
	if IsReady(_W) and ValidTarget(target, WRange) and IreliaMenu.Combo.W:value() then
		CastSpell(_W)
	end
	
	if target ~= nil and IsReady(_E) and IreliaMenu.Combo.E:value()  and ValidTarget(target,ERange) then
		CastTargetSpell(target,_E)
	end
	
	if IsReady(_R) and IreliaMenu.Combo.R:value() and ValidTarget(target, RRange) and RPred.HitChance == 1 then
		CastSkillShot(_R, RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
	end
end