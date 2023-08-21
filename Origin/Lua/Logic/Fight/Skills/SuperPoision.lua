SuperPoision = InheritsFromBaseAttackSkill();

function SuperPoision:InitExtraParameters()
  self.poisonList = {}; --施毒光影
end

function SuperPoision:ExtraClose()  
  for k, v in pairs(self.poisonList) do 
    v:Stop();
  end
  table.Clear(self.poisonList)
end

function SuperPoision:Update()
  local newPos = {};
  local light;
  local count = 0;
  local me = FightField.fightHum[self.humIdx];

  if self.step == 1 then 
    newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();

    --八卦魔法陣
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground,10079,50,1,22,22, EEffectLightTracer.StandAni, me.nowPos.x+5, me.nowPos.y,30, false, 113);      
    self.step = 2;
    --1--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local code = DemoCode.GetBitxor(20);
      code = code * 10;
    end
    ---2--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      --local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      for i = 1, 3 do
        DemoCode.SetColorNum(i);
      end
      local area =  DemoCode.CalTriangleArea(1, 1);
      local currentOptio = area;
      --local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  elseif self.step == 2 then 
    if me.roleController.animationFrame == 3 then     
      for k, v in pairs(self.emyIdxAy)do
        local target = FightField.fightHum[v];
        for i =2, 9 do          
          newPos.x = target.nowPos.x + math.random(0,50)-25;
          newPos.y = target.nowPos.y - math.random(0, 100);
          count = 50 + math.random(0, 100);
          light = EffectLight.New(10049,count,1,3,3, EEffectLightTracer.Stand, newPos.x,newPos.y,15, true, 50);    
          light:SetTimeScale(FightField.timeScale);   
          light:SetSortingOrder(FightField.FIGHT_SKY_ORDER);  
          table.insert(self.poisonList, light);
        end
      end
      self.interval = 0.8;
      self.step = 3;        
    end
  elseif self.step == 3 then 
    if self:CheckInterval() then
      self.step = 4;
      self.isLightEnd = true; --特技施展完畢        
    end
  end
end