--演出元件IceStone
IceStone = {};
IceStone.__index = IceStone;

function IceStone.New()
  local self = {};
  setmetatable(self, IceStone);
  
  self.nowPos = Vector2.zero;
  self.goal = Vector2.zero;
  self.moveOldTime = CGTimer.time;
  self.arrive = false;
  self.speed = 0;

  self.iceRC = nil;
  self.width = 0; 
  self.height = 0;
  self.gameObject = nil;
  self.rawImage = nil;
  self.material = nil;

  return self;
end

function IceStone:Free()
  if self.gameObject ~= nil then     
    poolMgr:Release("BaseLight", self.gameObject)
    poolMgr:Release("LightOpaqueMaterial", self.material)    
  end
end

function IceStone:GetPosition()
  local dx,dy,sx,sy,dsx,dsy;
  local dTime;
  local vx,vy,moveDist;  --移動距離

  if (self.nowPos.x == self.goal.x) and (self.nowPos.y == self.nowPos.y) then
    self.arrive = true;
  else
    self.arrive = false;
  end
  
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

  vx = 0;
  vy = 0;
  dTime = math.round((CGTimer.time - self.moveOldTime)*1000) * FightField.timeScale;   --時間差
  self.moveOldTime = CGTimer.time;
  moveDist = math.round(dTime* self.speed);

  dx = math.abs(self.goal.x-self.nowPos.x);
  dy = math.abs(self.goal.x-self.nowPos.x);


  if (dx<moveDist) and (dy<moveDist) then  
    self.nowPos = Vector2.New(self.goal.x, self.goal.y);
    self.arrive = true;
    return;
  end

  sx = 0;
  sy = 0;
  if dy > dx then
    sx = dy/(dx+0.001)
  else 
    sy = dx/(dy+0.001);
  end

  dsx = (moveDist/(sx+0.001));
  dsy = (moveDist/(sy+0.001));

  if dsx>moveDist then 
    dsx = moveDist;
  end
  if dsy>moveDist then 
    dsy = moveDist;
  end

  if self.nowPos.x< self.goal.x then
    vx = math.round(dsx)
  elseif (self.nowPos.x > self.goal.x)then
    vx = -math.round(dsx);
  end

  if self.nowPos.y<self.goal.y then
    vy = math.round(dsy)
  elseif (self.nowPos.y>self.goal.y)then
    vy = -math.round(dsy);
  end

  self.nowPos = Vector2.New(self.nowPos.x + vx, self.nowPos.y + vy)
end

function IceStone:SetPath(picID, order, showX, showY, objX, objY, speed)
  self.nowPos = Vector2.New(showX, showY);
  self.goal = Vector2.New(objX, objY);  
  self.speed = speed;

  local name = string.Concat("L", picID, "_", order);

  if self.gameObject == nil then 
    self.gameObject = poolMgr:Get("BaseLight")
    self.gameObject.name = name
    self.gameObject.transform:SetParent(EffectLight.light_root.transform);
    self.gameObject.transform.localPosition = Vector3.zero;
    self.gameObject.transform.localScale = Vector3.one;

    self.rawImage = self.gameObject:GetComponent("RawImage");
    self.canvans = self.gameObject:GetComponent("Canvas");

    self.rectTransform = self.gameObject:GetComponent("RectTransform");
    self.rectTransform.localScale = Vector3.New(1, 1, 1);  
    self.material = poolMgr:Get("LightOpaqueMaterial");
    self.rawImage.material = self.material;
  end  
  TextureManager.SetPng(ETextureUseType.EffectLight, name, self.rawImage);

  if self.rawImage.texture ~=nil then    
    self.width = self.rawImage.texture.width;
    self.height = self.rawImage.texture.height / 2;
    self.rectTransform.sizeDelta = Vector2.New(self.width, self.height);    
  end
end

function IceStone:SetPosition() 
  if self.gameObject ~= nil then     
    self.gameObject.transform.localPosition =  Vector3.New(self.nowPos.x - self.width / 2, -self.nowPos.y + self.height, 0);  
    self.canvans.sortingOrder = FightField.FIGHT_BODYLIGHT_ORDER + self.gameObject.transform.localPosition.y 
  end
end

function IceStone:Update()
  self:GetPosition();
  self:SetPosition();
end


FlySand = InheritsFromBaseAttackSkill();

function FlySand:InitExtraParameters()
  self.iceStone = {}; --TIceStone;   //下五顆冰
  self.smoke = {};    --TLight;         //煙
  self.corona = {};   --TLight;        //光環
  self.stoneInfo = {};--rIceStone;  //冰石相關資料
  for i = 1, 5 do 
    self.iceStone[i] = nil;
    self.stoneInfo[i] = {};
    self.isFall = false;     --是否己掉落下來
    self.hitOldTime = 0;     --被命中的時間
    self.isHit = false;      --是否有命中人
  end
end


function FlySand:ExtraClose()
  for k,v in pairs(self.iceStone) do
    v:Free()
  end  
  table.Clear(self.iceStone);

  ClearLightTable(self.smoke);
  ClearLightTable(self.corona);
end

function FlySand:GetAttackIdx(count)
  return self.emyIdxAy[count];
end

function FlySand:GetFallPos(idx)  
  local newPos = Vector2.zero;
  local target = FightField.fightHum[self.tarIdx];
  if idx == 1 then
    newPos = target:GetChipPos()
  elseif Contains(idx, 2, 3) then     
    newPos = target:GetSpot(idx-1, FieldChipDistW);
  elseif Contains(idx, 4, 5) then 
    newPos = target:GetSpot(idx-1, FieldChipDistH);    
  end
  return newPos;
end

function FlySand:isPlayOver()  
  if self.step == 4 then  
    for i=1, 5 do
      --若還有一個沒有做完被挨的畫面,就不算結束
      if self.corona[i] ~= nil then 
        if self.corona[i].picId ~= 0 then        
          return false;          
        end
      end
    end
    return true;    
  end
  return false;
end

function FlySand:SetStone()
  --const
  local SlopeLeft = 1.32352;
  local SlopeRight = 1.42105;
  local IceDist = 300;        --冰在上空的距離

  local sinSita, cosSita;     --Width斜率的Sin和Cos
  local x, y, showPage;
  local fixed = Vector2.zero;
  local target = FightField.fightHum[self.tarIdx];
  local newPos = Vector2.zero;
  local dist = 0;
  
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

  if target.party_Kind == EFightParty.Left then     
    sinSita = 1/ math.sqrt(math.pow(SlopeLeft, 2)+1);
    cosSita = SlopeLeft / math.sqrt(math.pow(SlopeLeft, 2)+1);
    showPage = 2;
  elseif target.party_Kind == EFightParty.Right then       
    sinSita = 1/ math.sqrt(math.pow(SlopeRight, 2)+1);
    cosSita = SlopeRight / math.sqrt(math.pow(SlopeRight, 2)+1);
    showPage = 1;      
  else  --預設使用 Party_Left: 的設定      
    sinSita = 1/ math.sqrt(math.pow(SlopeLeft, 2)+1);
    cosSita = SlopeLeft / math.sqrt(math.pow(SlopeLeft, 2)+1);
    showPage = 2;
  end

  for i=1, 5 do  
    if i == 1 then      
      newPos = target:GetChipPos();      
    elseif Contains(i, 2, 3) then         
      newPos = target:GetSpot(i-1, FieldChipDistW);
    elseif Contains(i, 4, 5) then 
      newPos = target:GetSpot(i-1, FieldChipDistH);        
    end

    dist = IceDist + math.random(0, 60) + i*50;
    fixed.x = math.round(dist*sinSita);
    fixed.y = math.round(dist*cosSita);

    if target.party_Kind == EFightParty.Left then       
      x = newPos.x + fixed.x;
      y = newPos.y - fixed.y;
    elseif target.party_Kind == EFightParty.Right then                     
      x = newPos.x - fixed.x;
      y = newPos.y - fixed.y;
    else  --預設使用 Party_Left: 的設定
      x = newPos.x - fixed.x;
      y = newPos.y - fixed.y;
    end
    self.stoneInfo[i].isFall = false

    if self.iceStone[i] ~= nil then 
      self.iceStone[i]:Free();
      self.iceStone[i] = nil;
    end

    self.iceStone[i] = IceStone.New();
    self.iceStone[i]:SetPath(10061+ math.random(0,2), showPage, x, y+30, newPos.x, newPos.y+30, 0.36 + math.random(36)/100);
  end
end

function FlySand:ShowIceStone()
  for k, v in pairs(self.iceStone) do
    if v ~= nil then 
      v:Update()
    end
  end
end

function FlySand:Update()
  self:UpdateHitPose();
  self:ShowIceStone();
  self:UpdateLogic();
end

function FlySand:StoneAllFall()
  local aimIdx;
  local newPos;

  for i=1, 5 do  
    if self.iceStone[i].arrive and self.stoneInfo[i].isFall == false then    
      self.stoneInfo[i].isFall = true;
      newPos = self:GetFallPos(i);

      self.smoke[i] = EffectLight.New(10008, 100,10,15, 15, EEffectLightTracer.StandAni, newPos.x, newPos.y, 255, false, 60);  
      self.smoke[i]:SetTimeScale(FightField.timeScale);     
      self.smoke[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);
      self.corona[i] = EffectLight.New(10052, 25, 1, 10, 10, EEffectLightTracer.StandAni, newPos.x, newPos.y,10, false, 70);
      self.corona[i]:SetTimeScale(FightField.timeScale);  
      self.corona[i]:SetSortingOrder(FightField.FIGHT_BODYLIGHT_ORDER);

      FightField.fightHum[self.humIdx]:PlaySound();

      aimIdx = self:GetAttackIdx(i);
      if aimIdx ~= -1 and FightField.fightHum[aimIdx] ~= nil then      
        FightField.fightHum[aimIdx].roleController:Hit();
        self.stoneInfo[i].isHit = true;
        self.stoneInfo[i].hitOldTime = CGTimer.time;
      end
    end
  end

  local isAllFall = true;
  for i=1, 5 do  
    if self.stoneInfo[i].isFall == false then    
      isAllFall = false;
      break;
    end
  end
  
  return isAllFall;
end

function FlySand:UpdateLogic()  
  local newPos;
  local me = FightField.fightHum[self.humIdx];
  if self.step == 1 then           
    newPos = me:GetMagicPos();
    me:SetMoment(newPos.x, newPos.y, false);
    me.roleController:MagicAttack();
    self:SetStone()
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
    self.step = 2;      
  elseif self.step == 2 then   
    if self:StoneAllFall() then   
      self:SetStone();
      self.step = 3;
    end
  elseif self.step == 3 then           
    if self:StoneAllFall() then 
      self.step = 4;          
     end
  elseif self.step == 4 then 
    if self:isPlayOver() then 
      self.isLightEnd = true;
      self.step = 5;
    end
  end
end

function FlySand:UpdateHitPose()
  local aimIdx;
  local count = 0;
  for i=1, 5 do  
    aimIdx = self:GetAttackIdx(i);
    if aimIdx ~= -1 then
      count = count + 1;
    end

    if self.stoneInfo[i].isHit then
      if (CGTimer.time - self.stoneInfo[i].hitOldTime) * 1000  * FightField.timeScale>= 100 then    
        self.stoneInfo[i].isHit = false;
        aimIdx = self:GetAttackIdx(i);
        if aimIdx ~= -1 then
          FightField.RestoreFightInfo(aimIdx);
        end
      end
    end
  end
end