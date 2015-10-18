--Soon
--After Varus Q
if GetObjectName(myHero) ~= "Ekko" then return end

local EkkoMenu = Menu("Ekko", "Ekko")

EkkoMenu:SubMenu("Combo", "Combo")
EkkoMenu.Combo:Boolean("Q", "Use Q", true)
EkkoMenu.Combo:Boolean("W", "Use W", true)
EkkoMenu.Combo:Boolean("E", "Use E", true)
EkkoMenu.Combo:Boolean("R", "Use R", true)

EkkoMenu:SubMenu("Settings", "Combo Settings")
EkkoMenu.Settings:Boolean("RTurst", "Enable Burst Mode", true)
EkkoMenu.Settings:Slider("RBurst", "Minimum Enemies To Use Burst Mode R In Auto R", 1, 1, 5, 1)
EkkoMenu.Settings:Slider("RHealth", "Minimum HP Percent To Use Burst Mode R In Auto R", 30, 0, 100, 1)
EkkoMenu.Settings:Boolean("RSurf", "Enable "Safe Mode", true)
EkkoMenu.Settings:Slider("RSave", "Minimum HP Percent To Use Safe Mode R In Auto R", 30, 0, 100, 1)

EkkoMenu:SubMenu("Drawings", "Drawings")
EkkoMenu.Drawings:Boolean("Show Radius of EkkoUlti", false)

EkkoMenu.SubMenu("Misc", "Misc")
EkkoMenu.Misc:Boolean("WE", "W on Stunned Enemies", true)
EkkoMenu.Misc:Boolean("AutoLvL", "Auto Level in R>Q>E>W", false)

function OnTick()
	Checks()
	KS()
end

function Checks()
	QReady = CanUseSpell(_Q)
	WReady = CanUseSpell(_W)
	EReady = CanUseSpell(_E)
	RReady = CanUseSpell(_R)
end

OnCreateObj
