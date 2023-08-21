FightNumber = {};
FightNumber.__index = FightNumber;

local fightRoot = nil;

function FightNumber.AviodCov()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function FightNumber.Destroy()
  poolMgr:DestroyPool("BaseNumber");
end

function FightNumber.Initialize()
  fightRoot = GameObject.Find("BaseNumberRoot").transform;
  
  CGResourceManager.Load(
    "BaseNumber",
    "",
    function(assetName, asset)
      poolMgr:CreatePool("BaseNumber", asset);
    end
  );
end

function FightNumber.AviodCov1()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function FightNumber.AviodCov2()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function FightNumber.AviodCov3()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function FightNumber.New(aText, aTracerStyle, aSrcX, aSrcY, aObjX, aObjY, aSpeed, aFontStyle)  
  if aFontStyle == nil then 
    aFontStyle = 4;
  end

  local self = {};
  setmetatable(self, FightNumber)
  self.startPos = Vector2.New(aSrcX, aSrcY);
  self.nowPos = Vector2.New(aSrcX, aSrcY); -- ShowX Y
  self.target = Vector2.New(aObjX, aObjY); -- OBJX Y    

  self.tempShowY = 0;
  self.text = aText;               --數字或是miss
  self.speed = aSpeed;               --移動的速度

  self.moveOldTime = CGTimer.time;         --移動開始的時間  

  self.delayTick = 0;           --延遲播放時間 (0:立即播放)
  self.arrive = false;          --到達
  self.totalDist = (self.target - self.nowPos).magnitude;           --總距離
  self.totalTime = self.totalDist / (self.speed * 1000);

  self.tracer_Style = aTracerStyle;         --軌跡風格
  self.fontStyle = aFontStyle;            --字的樣式(0~11) 92/7/10-1F

  self.gameObject = poolMgr:Get("BaseNumber");
  self.transform = self.gameObject.transform;
  self.gameObject.transform:SetParent(fightRoot.transform);
  self.gameObject.transform.localPosition = Vector3.zero;
  self.gameObject.transform.localScale = Vector3.zero;  

  self.text_Word = self.gameObject.transform:Find("Text_Word"):GetComponent("Text");  
  self.text_Number = self.gameObject.transform:Find("Text_Number"):GetComponent("Text");
  if self.delayTick > 0 then 
    self.gameObject:SetActive(false);
  end

  self:SetUpText();

  return self;
end

function FightNumber:SetUpText()
  local size = 4;
  self.text_Word.text = "";
  self.text_Number.text = "";
  if tonumber(self.text) == nil then    --字串
    self:SetWord(Vector3.zero, self.text,  0, size)
  else
    if self.tracer_Style == EEffectLightTracer.Line then    --如果是向上顯示數字,不改變大小        
      size = 4;
      if self.fontStyle == 4 then            
--        if Warship.scene == EWaterScene.Fight then --若在水戰時
--          size = 2                                                --字縮小
--        else                                                        //不在水戰時        
        self:SetWord(Vector3.New(-15, 0, 0), "HP", 0, size);
        self:SetNumber(Vector3.New(30, 0, 0), size)
--        end       
      elseif self.fontStyle == 3 then     
        self:SetWord(Vector3.New(-15, 0, 0), "SP", 4, size);
        self:SetNumber(Vector3.New(30, 0, 0), size)       
      elseif self.fontStyle == 12 then            
--              if Warship.scene == EWaterScene.Fight then//若在水戰時
        self:SetNumber(Vector3.New(30, 0, 0), size)            
      else
        self:SetNumber(Vector3.zero, size)            
      end       
    else
      self:SetNumber(Vector3.zero, 5)                  
    end
  end
end

function FightNumber.AviodCov4()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function FightNumber.AviodCov5()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function FightNumber.AviodCov6()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function FightNumber:GetScaleSize()
  local aFreeDist = (self.target - self.nowPos).magnitude;                       
  return math.max(math.ceil(aFreeDist/(self.totalDist + 0.001)* 35), 2);
end

function FightNumber.GetSize(sizeKind)
  --todo
  if sizeKind == 0 then 
     --0:DestRC:=bounds(x+n*4 -shift, y, 4, 6);--IconType 0~2 之 1:4
    return 6
  elseif sizeKind == 1 then 
     --1:DestRC:=bounds(x+n*8 -shift, y, 8,10);//IconType 0~2 之 2:4
    return 10;
  elseif sizeKind == 2 then 
     --2:DestRC:=bounds(x+n*12-shift, y,12,14);//IconType 0~2 之 3:4
    return 14;
  elseif sizeKind == 3 then 
    --3:DestRC:=bounds(x+n*16-shift, y,16,17);//IconType 0~2 之原size
    return 17;
  elseif sizeKind == 4 then 
     --4:DestRC:=bounds(x+n*20-shift, y,20,27);//IconType 3~4 之 3:4
    return 35; 
  elseif sizeKind == 5 then 
     --5:DestRC:=bounds(x+n*26-shift, y,26,35);//IconType 3~4 之原size
    return 41;
  elseif sizeKind == 6 then 
    --:DestRC:=bounds(x+n*32-shift, y,32,41);
    return 56;
  elseif sizeKind == 7 then 
    --7:DestRC:=bounds(x+n*12-shift, y,12,15);
    return 15;
  elseif sizeKind == 8 then 
    --8:DestRC:=bounds(x+n*20-shift, y,20,28);
    return 28;
  elseif sizeKind == 9 then 
    --9:DestRC:=bounds(x+n*10-shift, y,10,12);//IconType 9~11 之原size
    return 11;
  end
  return 27;
end

function FightNumber.AviodCov7()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function FightNumber.AviodCov8()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function FightNumber:UpdateFontSize()
   if tonumber(self.text) ~= nil then    
    if self.tracer_Style ~= EEffectLightTracer.Line then    --如果是向上顯示數字,不改變大小              
      self.text_Number.fontSize =self:GetScaleSize();          
    end
  end
end

function FightNumber:SetWord(bias, text, colorkind, fontSize)
  self.text_Word.gameObject:SetActive(true);
  self.text_Word.text= text;
  if colorkind == 0 then 
    LuaHelper.SetColor(self.text_Word, Color.Red);
  elseif colorkind == 4 then 
    LuaHelper.SetColor(self.text_Word, Color.Blue);
  elseif colorkind == 5 then 
    LuaHelper.SetColor(self.text_Word, Color.Orange);
  end

  self.text_Word.gameObject.transform.localPosition = bias;
  self.text_Word.fontSize = FightNumber.GetSize(fontSize);
end

function FightNumber:SetNumber(bias, fontSize)
  self.text_Number.gameObject:SetActive(true);
  self.text_Number.text= self.text;

  LuaHelper.SetColor(self.text_Number, Color.Orange);

  self.text_Number.fontSize = FightNumber.GetSize(fontSize);
  self.text_Number.gameObject.transform.localPosition = bias;
end

function FightNumber:Free()
  poolMgr:Release("BaseNumber",self.gameObject)
end

function FightNumber.AviodCov9()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function FightNumber.AviodCov10()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function FightNumber:Getposition()
  local nowTime = CGTimer.time - self.moveOldTime;
  local weight = nowTime / self.totalTime;
             
  if (weight >= 1) then    
    self.nowPos.x = self.target.x;
    self.nowPos.y = self.target.y;
    self.arrive = true;
  else    
    self.arrive = false;    
    self.nowPos = Vector2.Lerp(self.startPos, self.target, weight);
  end   
end

function FightNumber:UpdateCurve()
  local jy;
  local nowDist;      --現在距離

  if self.tracer_Style == EEffectLightTracer.Curve then  
    --TempShowY:=ShowY;
    nowDist = (self.nowPos - self.target).magnitude;
    jy = math.round(360*(0.5- math.abs((nowDist/(self.totalDist+0.001))-0.5)));
    jy = math.round(jy-0.003* math.pow(jy,2));
    self.nowPos.y = self.nowPos.y - jy;
  end
end

function FightNumber:Update()
  if self.delayTick > 0 then 
    if (CGTimer.time - self.moveOldTime) * 1000 > self.delayTick then 
      self.gameObject:SetActive(true);
      self.delayTick = 0;
      self.moveOldTime = CGTimer.time;
    end   
    return true;
  end

  if self.arrive == true then
    self:Free();
    return false;
  end
  self.transform.localScale = Vector3.one;  
  self:Getposition();
  local tempY = self.nowPos.y;
  self:UpdateCurve();
  self:UpdateFontSize();
  self.transform.localPosition = Vector3.New(self.nowPos.x, -self.nowPos.y, 0);  

  self.nowPos.y = tempY;

  return true;
end

function FightNumber.AviodCov11()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end
