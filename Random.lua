Udyr = MenuConfig("Udyr", "Udyr")

Udyr:Menu("Combo", "Combo")
Udyr.Combo:Boolean("Q", "Use Q", true)
Udyr.Combo:Boolean("W", "Use W", true)
Udyr.Combo:Boolean("E", "Use E", true)
Udyr.Combo:Boolean("R", "Use R", true)

Udyr:Menu("Misc", "Misc")
Udyr.Misc.KeyBinding:("Flee", "Swiftly", false)

OnTick(function(myHero)
target = GetCurrentTarget()
Flee()
Combo()
AutoLvL()
end)

function Combo()
	if CanUseSpell(_E) and if not GotBuff(target, "udyrbearstuncheck") and ValidTarget(target, 400) then
	CastSpell(_E)
		end
		
	if CanUseSpell(_Q) then
	CastSpell(_Q)
	end
	
end --This marks the end of the function Combo()

OnProcessSpellComplete(function(Object,spellProc)
	if Object == myHero and spellProc.name == ("Udyr_PhoenixBreath_cas.troy" or "Udyr_Sprit_Phoenix_Breath_cas.troy") then
	Turtle = false
	Bear = false
	Tiger = false
	Phoenix = true
	end
end)

OnCreateObj(function(Object)
	if Object == ("Udyr_PhoenixBreath_cas.troy" or "Udyr_Sprit_Phoenix_Breath_cas.troy") then
	Flame = true
	end
	
	if Object == ("udyr_tiger_claw_tar.troy" or "Udyr_Spirit_Tiger_Claw_tar.troy") then
	Tiger = true
	end
end)

OnDeleteObj(function(Object)
	if Object == ("Udyr_PhoenixBreath_cas.troy" or "Udyr_Sprit_Phoenix_Breath_cas.troy") then
	Flame = false
	end
	
	if Object == ("udyr_tiger_claw_tar.troy" or "Udyr_Spirit_Tiger_Claw_tar.troy") then
	Tiger = false
	end
end)