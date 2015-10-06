if GetObjectName(myHero) ~= "Nidalee" then return end
 
local nidaslime = Menu("Nidaslime", "Nidaslime")
 
nidaslime:SubMenu("Combo", "Combo")
nidaslime.Combo:Boolean("Q", "Use Q", true)
nidaslime.Combo:Boolean("W", "Use W", true)
nidaslime.Combo:Boolean("E", "Use E", true)
nidaslime.Combo:Boolean("R", "Use R", true)
nidaslime.Combo.Key("Combo", "Combo", string.byte(" "))
 
nidaslime:SubMenu("Misc", "Misc")
nidaslime.Misc:Boolean("lvl", "AutoLevel RQEW", true)
nidaslime.Misc:Boolean("hunted", "Use Cougar only when Hunted!", true)
nidaslime.Misc:Key("Escape", "Escape with W", string.byte(" V"))
nidaslime.Misc:Boolean("AutoCougar", "Auto Cougar", true)
 
OnLoop(function(myHero)--Starts onLoop
Autolvl()
local target = GetCurrentTarget()
escape()
combo()
hunted()
huntedcheck()
check()
end)
 
function check()
GetCastName(myHero,_Q) == "TakeDown" or
GetCastName(myHero,_W) == "Pounce" or
GetCastName(myHero,_E) == "Swipe" then
Cougar = true
Human = false
elseif
GetCastName(myHero,_Q) == "JavelinToss" or
GetCastName(myshero,_W) == "Bushwhack" or
GetCastName(myHero,_E) == "PrimalSurge" then
Cougar = false
Human = true
end
 
function escape()
local mousePos = GetMousePos()
if nidaslime.Misc.Escape and CanUseSpell(_W) and Cougar then
CastSkillShot(_W,mousePos.PredPos.x,mousePos.PredPos.y,PredPos.z) and MoveToXYZ(mousePos.x,mousePos.y,mousePos.z)
end
elseif CanUseSpell(myHero,_R) == READY then
CastSpell(_R)
end
end
end
 
OnCreateObj(function(Object)
 
if GetObjectBaseName(Object) == 'Nidalee_Base_Q_Tar.Troy' then
objhunt1 = true
end
 
if GetObjectBaseName(Object) == 'Nidalee_Base_Q_Buf.Troy' then
objhunt2 = true
end
 
if GetObjectBaseName(Object) == 'Nidalee_Base_P_Buf.Troy' then
objhunt3 = true
end
end) --End of function
 
OnDeleteObj(function(Object)
 
if GetObjectBaseName(Object) == 'Nidalee_Base_Q_Tar.Troy' then
objhunt1 = false
end
 
if GetObjectBaseName(Object) == 'Nidalee_Base_Q_Buf.Troy' then
objhunt2 = false
end
 
if GetObjectBaseName(Object) == 'Nidalee_Base_P_Buf.Troy' then
objhunt3 = false

end
end) --End of function
 
function hunted(target)
return
GotBuff(target, "nidaleepassivehunted")
end --End of function

function extraPounce()
	if huntedcheck then
		extraRange=0
	else
		extraRange=375
	end
end

function huntedcheck()
if hunted(target) and human and (objhunt1 or objhunt2 or objhunt3) then
if nidaslime.Misc.AutoCougar:Value() and nidaslime.Combo.Combo:Value() and GoS:ValidTarget(target,650) and CanUseSpell(myHero,_R) then
CastSpell(_R)
else
return
end
end
 
function CastSpear(unit)
	QPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1650,250,1200,70,true,true)
		if CanUseSpell(_Q) == READY and nidaslime.Combo.Q:Value() and nidaslime.Combo.Combo:Value() and GoS:ValidTarget(target, 1500) and human then
			CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
		end
end

function TakeDown(unit)
	if CanUseSpell(_Q) and cougar and nidaslime.Combo.Q:Value() and nidaslime.Combo.Combo:Value() and GoS:ValidTarget(target, 375)
		if CanUseSpell(_Q) == READY and Cougar and nidaslime.Combo.Combo:Value() and GoS:ValidTarget(target, 375) then
			CastSpell(_Q)
		end
end

function Pounce(unit)
	WPRED = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1650,250,1200,70,false,true)
