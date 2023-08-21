
EResidual = {
  None      = 0,         --無
  Residual1 = 1,         --殘影效果一
  Residual2 = 2,         --殘影效果二
  Residual3 = 3,         --殘影效果三
  Overturn  = 4,         --顛倒
  Huge      = 5,         --放大
  Small     = 6          --縮小
}

local tempVec2 = Vector2.New(0, 0);
local AlphaTable = { 255, 200, 160, 120, 80, 40, ["Default"] = 255 };

Tft_Role = {};
Tft_Role.__index = Tft_Role;

function Tft_Role.DoNothing(reader)
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function Tft_Role.New(reader)
  local self = {};
  setmetatable(self, Tft_Role);

  self.npcId = reader:ReadInt32();
  self.roleController = nil;

  self.startStep = reader:ReadInt32();
  self.totalStep = reader:ReadInt32();
  self.direction = reader:ReadInt32();

  self.destXY = {};      
  for j = 0, self.totalStep do
    local destInfo = {};
    destInfo.x = reader:ReadInt32(); --對應整張背景圖的絕對位置X
    destInfo.y = reader:ReadInt32(); --對應整張背景圖的絕對位置y
    destInfo.arrive = reader:ReadBoolean(); --是否到達此點
    destInfo.speedLevel = reader:ReadInt32(); --移動速度:   1: 0.08, 2: 0.12,  3: 0.4
    destInfo.pose = reader:ReadInt32(); --移動到此點的動作狀態 0~255
    destInfo.ride = reader:ReadInt32(); --有無座騎 0: 沒有  1: 不變  其他:座騎的id
    destInfo.frame = reader:ReadInt32(); --是否鎖定RI 0: 不鎖  1~4: 鎖定動作值
    destInfo.residual = reader:ReadInt32(); --是否秀殘影
    destInfo.musicNo = reader:ReadByte(); --0: 無   其餘：背景音樂檔編號
    reader:ReadBytes(3);

    self.destXY[j] = destInfo;
  end
  self.destXY[1].pose = self.destXY[0].pose;

  self.position = Vector2.zero; --圖左上座標
  self.destination = Vector2.zero; --目的地左上座標

  --秀殘影用
  self.residualTime = 0;
  self.residualX = {}; 
  self.residualY = {};
  for i = 1, 5 do  
    self.residualX[i] = 0;
    self.residualY[i] = 0;
  end

  self.shrink = 0;
  self.overturn = false;

  self.arrive = false;
  self.speedLevel = 2; --開始速度為一般
  
  self.nowStep = 0; --目前移動到第幾個路線
  self.oldTime = CGTimer.time;
  self.overTime = 0;
  self.pose = ERolePose.Stand; --姿勢種類
  self.frame = 0; --目前步數
  
  return self;
end

function Tft_Role:Load(parent, roleController)
  self.roleController = roleController;
  self.roleController.transform:SetParent(parent.transform)

  self.position.x = self.destXY[0].x;
  self.position.y = self.destXY[0].y;
  self.destination.x = self.destXY[0].x;
  self.destination.y = self.destXY[0].y;
  
  self.roleController:SetPosition(self.position);
  self.roleController:SetDirection(self.direction);
  
  self.nowStep = 0;
  self.speedLevel = 2;
  self.oldTime = CGTimer.time;
  self.overTime = CGTimer.time;
  self.residualTime = CGTimer.time;
end

function Tft_Role:Destroy()
  self.roleController:Destroy()
  self.roleController = nil;
end

--[[
Now Dinah, the daughter whom Leah had by Jacob, went out to see the women of that country.
And when Shechem, the son of Hamor the Hivite who was the chief of that land, saw her, he took her by force and had connection with her.
Then his heart went out in love to Dinah, the daughter of Jacob, and he said comforting words to her.
And Shechem said to Hamor, his father, Get me this girl for my wife.
Now Jacob had word of what Shechem had done to his daughter; but his sons were in the fields with the cattle, and Jacob said nothing till they came.
Then Hamor, the father of Shechem, came out to have a talk with Jacob.
Now the sons of Jacob came in from the fields when they had news of it, and they were wounded and very angry because of the shame he had done in Israel by having connection with Jacob's daughter; and they said, Such a thing is not to be done.
But Hamor said to them, Shechem, my son, is full of desire for your daughter: will you then give her to him for a wife?
And let our two peoples be joined together; give your daughters to us, and take our daughters for yourselves.
Go on living with us, and the country will be open to you; do trade and get property there.
And Shechem said to her father and her brothers, If you will give ear to my request, whatever you say I will give to you.
However great you make the bride-price and payment, I will give it; only let me have the girl for my wife.
But the sons of Jacob gave a false answer to Shechem and Hamor his father, because of what had been done to Dinah their sister.
And they said, It is not possible for us to give our sister to one who is without circumcision, for that would be a cause of shame to us:
But on this condition only will we come to an agreement with you: if every male among you becomes like us and undergoes circumcision;
Then we will give our daughters to you and take your daughters to us and go on living with you as one people.
But if you will not undergo circumcision as we say, then we will take our daughter and go.
And their words were pleasing to Hamor and his son Shechem.
And without loss of time the young man did as they said, because he had delight in Jacob's daughter, and he was the noblest of his father's house.
--]]


function Tft_Role:Show(isResidual, aIdx, aKind)
  local alpha = AlphaTable.Default;
  local flag = EResidual.None;
  if isResidual then
    alpha = AlphaTable[aIdx] or AlphaTable.Default;
    if aKind == EResidual.Residual1 then               --殘影一(漸漸變淡)
      flag = 2;
    elseif aKind == EResidual.Residual2 then           --殘影二(光芒漸淡)
      flag = 3;
    elseif aKind == EResidual.Residual3 then           --殘影三(趨向白光)
      flag = 4;
    else
      flag = 1
    end
  end

  self.roleController:SetPosition(self.position);
  
  self.overturn = false;
  self.shrink = 10;
  --Hum.Squelch:=10;

  if aKind == EResidual.Overturn then
    self.overturn = true;
  elseif aKind == EResidual.Huge then  --是否放大
    self.shrink = 15;
  elseif aKind == EResidual.Role_Small then  --是否縮小
    self.shrink = 5;
  end

  if not isResidual then    --如果不是秀殘影  
    if MoviePlayer.isEfficacy1 then         --播放特效中      
      if (PicId == 1135) then          
         --牛怪腳底陰影  92/9/7-1F
         --se_CtrlImgDB.DrawAddToMem(HumManage.MonsterShadowIndex,Hum.ShowX-47,Hum.ShowY-18,Now_alpha);        
      else          
        --rc:=Rect(49,88,49+31,88+17);     //秀影子
        --se_CtrlImgDB.DrawAddToMem(HumManage.ShadowIndex,Hum.ShowX-15,Hum.ShowY-7,rc,Now_alpha);
      end
    else
      if (PicId == 1135) then
        --牛怪腳底陰影  92/9/7-1F
        --se_CtrlImgDB.DrawToMemPlus(HumManage.MonsterShadowIndex,Hum.ShowX-47,Hum.ShowY-18);
      else
        --rc:=Rect(49,88,49+31,88+17);     //秀影子
        --se_CtrlImgDB.DrawToMemPlus(HumManage.ShadowIndex,Hum.ShowX-15,Hum.ShowY-7,rc);
      end
    end
  end
  
  if not self.arrive then
    self.roleController:FaceTo(self.destination);
  end
  
  local maxFrame = self.roleController:GetAnimationFrame(self.roleController:GetAnimationId(self.pose));
  if maxFrame > 0 then
    if self.destXY[self.nowStep].frame == 0 then
      if CGTimer.time - self.overTime > MoviePlayer.poseInterval[self.speedLevel] then
        self.overTime = CGTimer.time;
        self.frame = self.frame + 1;
        if self.frame >= maxFrame then 
          self.frame = 0;
        end            
      end
    else
      if self.destXY[self.nowStep].frame > maxFrame then
        self.frame = maxFrame - 1;
      else
        self.frame = self.destXY[self.nowStep].frame - 1;
      end
    end
    self.roleController:SetAnimationForceFrame(self.frame);        
  end
  
  self.roleController:UpdateShow(false);
end

function Tft_Role.DoNothing1(reader)
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function Tft_Role.DoNothing2(reader)
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function Tft_Role.DoNothing6(reader)
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function Tft_Role:ShowResidual(kind, value)
  local tempX = self.position.x;
  local tempY = self.position.y;

  if kind == 1 then
  elseif kind == 2 then
    for i = 5, 1, -1 do
      if self.residualX[i] ~= 0 and self.residualY[i] ~= 0 then
        self.position.x = self.residualX[i];
        self.position.y = self.residualY[i];
        self:Show(true, i, value);
      end
    end
  end

  self.position.x = tempX;
  self.position.y = tempY;
end

function Tft_Role:GetResidualXY()
  if math.round((CGTimer.time - self.residualTime) * MoviePlayer.timeScale) > 100 then  
    for i = 5, 2, -1 do    
      self.residualX[i] = self.residualX[i - 1];
      self.residualY[i] = self.residualY[i - 1];
    end
    self.residualX[1] = self.position.x;
    self.residualY[1] = self.position.y;
    self.residualTime = CGTimer.time;
  end
end

function Tft_Role:SortingOrder(order)
  self.roleController.canvas.sortingOrder = order + math.abs(self.position.y);
end

function Tft_Role:UpdatePosition()
  self:GetResidualXY();
  self.position = MoviePlayer.GetPosition(self.position, self.destination, self.speedLevel, CGTimer.time - self.oldTime);
  self.oldTime = CGTimer.time;

  if self.position ~= self.destination then return false end
  
  self.destXY[self.nowStep].arrive = true;
  self.arrive = true;

  if self.pose == ERolePose.Walk then
    self.pose = ERolePose.Stand;
    
    self.roleController:SetAnimationForceId(self.pose);
  end

  return true;
end

function Tft_Role.DoNothing3(reader)
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function Tft_Role:NextStep()
  self.nowStep = math.min(self.nowStep + 1, self.totalStep);

  if self.nowStep < self.totalStep then
    --把下一點座標放到目的地座標裡
    self.destination.x = self.destXY[self.nowStep].x;
    self.destination.y = self.destXY[self.nowStep].y;
    self.speedLevel = self.destXY[self.nowStep].speedLevel;
    self.arrive = false;

    if self.destXY[self.nowStep].pose ~= 255 then
      self.pose = self.destXY[self.nowStep].pose;
      
      if self.pose == ERolePose.Walk and self.position == self.destination then
        self.pose = ERolePose.Stand;
      end
      
      self.roleController:SetAnimationForceId(self.pose);
    else
      self.pose = self.destXY[self.nowStep - 1].pose;
      self.destXY[self.nowStep].pose = self.pose;

      if self.pose == ERolePose.Walk and self.position == self.destination then
        self.pose = ERolePose.Stand;
      end
      
      self.roleController:SetAnimationForceId(self.pose);
    end

    if self.destXY[self.nowStep].musicNo > 0 then
      MovieSound.PlayMovieSound(self.destXY[self.nowStep].musicNo);
    end
  else
    self.arrive = true;
    self.destination.x = self.position.x;
    self.destination.y = self.position.y;

    self.destXY[self.nowStep].frame = self.destXY[self.nowStep - 1].frame;
  end
end

function Tft_Role.DoNothing4(reader)
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function Tft_Role.DoNothing5(reader)
  if LuaHelper.CheckDefine("DemoCode") then
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end
