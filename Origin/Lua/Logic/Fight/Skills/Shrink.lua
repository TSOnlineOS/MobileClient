Shrink = InheritsFromBaseAttackSkill();

function Shrink:Update()
  local me = FightField.fightHum[self.humIdx];
  local target = FightField.fightHum[self.tarIdx];
  if self.step == 1 then     
    me.roleController:MagicAttack();
    --風魔法陣
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground,10077,50,1,21,21, EEffectLightTracer.StandAni, me.nowPos.x+5, me.nowPos.y,20, true, 90);     --咒語
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
      local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  elseif self.step == 2 then       
    for k, v in pairs(self.emyIdxAy)  do
      target = FightField.fightHum[v];
      if target ~= nil then 
        FightField.attack[self.humIdx]:SetLightWithOrder(2 + k,EEffectLightDis.Body,10003, 50,1,25,25, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y,20, true, 20);        
      end
    end
    self.step = 3;
  elseif self.step == 3 then      
    if FightField.attack[self.humIdx]:CheckLightIsEnd(2)then        
      self.isLightEnd = true;
      self.step = 4;
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
        local currentOption = string.Get(10055);
      end
      --5-----------------------------------------------------
      if LuaHelper.CheckDefine("DemoCode") then
        --
      end
      --6-----------------------------------------------------
    end
  end
end

--專武縮小 (多人)
EW_Shrink = InheritsAttack(Shrink);

function EW_Shrink:InitDrawBlack()
  self.needDrawBlack = true;   
end

--狀態顯示
ShrinkMe = InheritsFromBaseStatus();

function ShrinkMe:InitExtraParameters()
  self.shrinkOldTime = CGTimer.time;
  self.size = DefShrink;     --縮小後的尺寸

   --縮小的尺寸
  if FightField.fightHum[self.humIdx].shrink == DefShrink then 
    self.size = MinShrink;
  elseif FightField.fightHum[self.humIdx].shrink == MaxShrink then 
    self.size = DefShrink;
  elseif FightField.fightHum[self.humIdx].shrink == MinShrink then 
    self.size = MinShrink;
  end
end

function ShrinkMe:ExtraClose()
  FightField.fightHum[self.humIdx]:SetShrink(DefShrink);
end

function ShrinkMe:IsShrink()
  return FightField.fightHum[self.humIdx].shrink == self.size;  
end

function ShrinkMe:Update()
  local me = FightField.fightHum[self.humIdx];
  if self.step == 1 then     
    me:GetStatus(self.statusKind):SetLight(EEffectLightKind.Body1 ,10003, 50,1,25,25, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 20, true, 20);                
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
      local currentOption = string.Get(10055);
    end
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
  elseif self.step == 2 then               
    if (CGTimer.time - self.shrinkOldTime) * 1000 * FightField.timeScale >= 100 then        
      --慢慢縮小
      if me.shrink > MinShrink then          
        if me.shrink ~= self.size then
          me:SetShrink(me.shrink - 1);
        end
      else
        self.step =3;
      end            

      self.shrinkOldTime = CGTimer.time;        
    end
  end
end
