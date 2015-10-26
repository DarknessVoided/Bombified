--[[Updated for latest Inspired]]--

Menu = MenuConfig("BM 2.0", "BM")
 
Menu:Menu("rofl", "Settings")
Menu.rofl:Boolean("Laugh", "Enable Emotes", true)
Menu.rofl:Boolean("Always", "Always laugh", false)
Menu.rofl:DropDown("EmotesTable", "Use which Emotes", 1, {"Dance", "Laugh", "Taunt", "Joke"})
 
local target = GetCurrentTarget()

OnTick(function(myHero)
	target = GetCurrentTarget() or target
        if IsDead(target) and Menu.rofl.Laugh:value() then
                Emote()
        end
end)
 
IOW:AddCallback(AFTER_ATTACK, function(Target)
	target = Target or target
        if Menu.rofl.Always:Value() then
                Emote()
        end
end
 
function Emote()
        if Menu.rofl.EmotesTable:Value() == 1 then
                Emoticon = EMOTE_DANCE
        elseif Menu.rofl.EmotesTable:Value() == 2 then
                Emoticon = EMOTE_LAUGH
        elseif Menu.rofl.EmotesTable:Value() == 3 then
                Emoticon = EMOTE_TAUNT
        elseif Menu.rofl.EmotesTable:Value() == 4 then
                Emoticon = EMOTE_JOKE
        end
        CastEmote(Emoticon)
end