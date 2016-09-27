if GetObjectName(myHero) ~= "Olaf" then return end

require('OpenPredict')

local OlafQ = {delay = 0.25, speed = 1600, width = 90, range = 1000} 

local OlafMenu = Menu("OlafNation", "OlafNation")
--Combo Menu
  OlafMenu:Menu("Combo", "Combo")
  OlafMenu.Combo:Boolean("useQ", "Use Q", true)
  OlafMenu.Combo:Boolean("useW", "Use W", true)
  OlafMenu.Combo:Boolean("useE", "Use E", true)
  OlafMenu.Combo:Boolean("useR", "Use R", true)
  OlafMenu.Combo:Slider("ultX","Ult on X enemies around", 3, 1, 5, 1)
-- Harass Menu
  OlafMenu:Menu("Harass", "Harass")
--Q
  OlafMenu.Combo:Boolean("useR", "Use Q", true)   
  OlafMenu.Harass:Slider("manaQ","Mana-Manager | Q", 60, 0, 100, 1)
--W
  OlafMenu.Combo:Boolean("useW", "Use W", true) 
  OlafMenu.Harass:Slider("manaW","Mana-Manager | W", 40, 0, 100, 1)
--E
  OlafMenu.Combo:Boolean("useE", "Use E", true)
  OlafMenu.Harass:Slider("manaE","Hp-Manager | E", 20, 0, 100, 1) 
-- KillSteal Menu
  OlafMenu:Menu("KillSteal", "KillSteal")
  OlafMenu.KillSteal:Boolean("useQ", "Use Q", true)
  OlafMenu.KillSteal:Boolean("useE", "Use E", true)




OnTick(function()

    if IOW:Mode() == "Combo" then
       
        local target = GetCurrentTarget() 
        -- 
        if ValidTarget(target,OlafQ.range) and CanUseSpell(myHero,_Q) == READY and OlafMenu.Combo.useQ:Value() then
                        
            local qPred = GetPrediction(target,OlafQ)
                         
            if qPred and qPred.hitChance >= 0.25 then 
                CastSkillShot(_Q,qPred.castPos)
            end
        end
       
        if ValidTarget(target,GetRange(myHero) + GetHitBox(target)) and CanUseSpell(myHero,_W) == READY and OlafMenu.Combo.useW:Value() then
          CastSpell(_W) 
        end
        
        if ValidTarget(target,GetRange(myHero) + GetHitBox(target)) and CanUseSpell(myHero,_E) == READY and OlafMenu.Combo.useE:Value() then
          CastTargetSpell(target,_E)
        end
        
        if ValidTarget(target,GetRange(myHero) + GetHitBox(target)) and CanUseSpell(myHero,_R) == READY and OlafMenu.Combo.useR:Value() then
          CastSpell(_R)
        end

         if GetItemSlot(myHero, 3077) > 0 and IsReady(GetItemSlot(myHero, 3077)) then
       CastSpell(GetItemSlot(myHero, 3077))
      end
    if GetItemSlot(myHero, 3074) > 0 and IsReady(GetItemSlot(myHero, 3074)) then
       CastSpell(GetItemSlot(myHero, 3074))
      end
   if GetItemSlot(myHero, 3748) > 0 and IsReady(GetItemSlot(myHero, 3748)) then
       CastSpell(GetItemSlot(myHero, 3748))
    end 
end)
