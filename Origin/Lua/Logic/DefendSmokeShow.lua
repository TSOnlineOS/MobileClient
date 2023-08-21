DefendSmokeShow = {}
local this = DefendSmokeShow;

local smokeEffect = nil;
local smokeTime = nil;

function DefendSmokeShow.Show(times)
  local addTime = 0;
  if LuaHelper.CheckDefine("Debug") or LuaHelper.CheckDefine("QA") then 
    addTime = times * 10;
  else
    addTime = times * 60;
  end 

  if smokeTime == nil then
    smokeTime = CGTimer.time + addTime;
  else
    smokeTime = smokeTime + addTime;
  end
  
  if not CGTimer.ContainsListener(this.Update) then
    CGTimer.AddListener(this.Update, 0.1);
  end

  this.Update();
end

function DefendSmokeShow.Update()
  if smokeTime == nil then return end
  if FightField.isInBattle then return end

  if CGTimer.time > smokeTime then
    smokeTime = nil;
    CGTimer.RemoveListener(this.Update);
    return;
  end
  
  if smokeEffect == nil or smokeEffect.picId == 0 then
    smokeEffect = EffectLight.New(10016, 60, 1, 15, 15,EEffectLightTracer.StandAni, Role.player.position.x - 10, Role.player.position.y + 40, 31, false, 25, nil, nil, nil, nil, true);                 
    smokeEffect:SetSortingOrder(1500);
  end
end

function DefendSmokeShow.Clear()
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
  smokeEffect = nil;
  smokeTime = nil;
end
