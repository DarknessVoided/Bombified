if GetObjectName(GetMyHero()) ~= "Irelia" then return end

if not pcall( require, "Inspired" ) then PrintChat("You are missing Inspired.lua - Go download it and save it in Common!") return end

OnTick(function(myHero)
	if IOW:mode == 'Combo' then
		Combo()
	end
	
	if IOW:mode == 'LaneClear' then
		LaneClear()
	end
	
	if IOW:mode == "Harass" then
	Harass()
	end
end)

function Harass()
	if IreliaMenu.Harass.UseQ:value and ValidTarget(target) and GetPercentMP(myHero) >= IreliaMenu.Mana.ManagerQ:value() then
		CastQHarass(unit)
	end
	
	if IreliaMenu.Harass.UseE:value() and ValidTarget(target) and GetPercentMP(myHero) >= IreliaMenu.Mana.ManagerE:value() then
		CastEHarass(unit)
	end	
end

function CastQHarass(unit)
