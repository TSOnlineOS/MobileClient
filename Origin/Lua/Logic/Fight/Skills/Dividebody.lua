--分身
Dividebody = InheritsFromBaseAttackSkill();

function Dividebody:Update()
  local me = FightField.fightHum[self.humIdx];

  if self.step == 1 then      
    me.roleController:MagicAttack();
    --風魔法陣
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground,10077,50,1,21,21, EEffectLightTracer.StandAni, me.nowPos.x+5, me.nowPos.y,20, true, 90);
    self.interval = 0.8;
    self.step = 2;
    ---2--------------------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      local area =  DemoCode.CalTriangleArea(100, 100)
      area = area * 1 + 2;
      if area > DemoCode.GetBitxor(20) then  --test avg
        local avg = DemoCode.CalAvg(10, 20, 30);
      end
    end
    --3----------------------------------------------------
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
    if self:CheckInterval() then        
      me:SetBeh(EFightBeh.Divide);
      if me.party_Kind == EFightParty.Right then
        me:FDivide(true, me.colm-1, me.row)
      elseif me.party_Kind ==  EFightParty.Left then
        me:FDivide(true, me.colm+1, me.row);
      end
      me:PlayEffect(me.colm, me.row, ERolePose.Prepare);   --隱分身要用的
      self.interval = 1.5;
      self.step = 3;                  
    end
  elseif self.step == 3 then 
    if self:CheckInterval() then        
      self.step = 4;
      self.isLightEnd = true;   --特技施展完畢
    end
  end
end