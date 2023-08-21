
MoveController = {}
MoveController.__index = MoveController;

local BeePath = {
  {-100, -100},
  {-100, 100},
  {100, 100},
  {100, -100},
  {100, -100},
  {100, 100},
  {-100, 100},
  {-100, -100}
};

--[[
Now in the days of Amraphel, king of Shinar, Arioch, king of Ellasar, Chedorlaomer, king of Elam, and Tidal, king of Goiim,
They made war with Bera, king of Sodom, and with Birsha, king of Gomorrah, Shinab, king of Admah, and Shemeber, king of Zeboiim, and the king of Bela (which is Zoar).
All these came together in the valley of Siddim (which is the Salt Sea).
For twelve years they were under the rule of Chedorlaomer, but in the thirteenth year they put off his control.
And in the fourteenth year, Chedorlaomer and the kings who were on his side, overcame the Rephaim in Ashteroth-karnaim, and the Zuzim in Ham, and the Emim in Shaveh-kiriathaim,
And the Horites in their mountain Seir, driving them as far as El-paran, which is near the waste land.
Then they came back to En-mishpat (which is Kadesh), making waste all the country of the Amalekites and of the Amorites living in Hazazon-tamar.
And the king of Sodom with the king of Gomorrah and the king of Admah and the king of Zeboiim and the king of Bela (that is Zoar), went out, and put their forces in position in the valley of Siddim,
Against Chedorlaomer, king of Elam, and Tidal, king of Goiim, and Amraphel, king of Shinar, and Arioch, king of Ellasar: four kings against the five.
Now the valley of Siddim was full of holes of sticky earth; and the kings of Sodom and Gomorrah were put to flight and came to their end there, but the rest got away to the mountain.
And the four kings took all the goods and food from Sodom and Gomorrah and went on their way.
And in addition they took Lot, Abram's brother's son, who was living in Sodom, and all his goods.
And one who had got away from the fight came and gave word of it to Abram the Hebrew, who was living by the holy tree of Mamre, the Amorite, the brother of Eshcol and Aner, who were friends of Abram.
And Abram, hearing that his brother's son had been made a prisoner, took a band of his trained men, three hundred and eighteen of them, sons of his house, and went after them as far as Dan.
--]]


MoveController.PalyerMoveTime = 0.4;

function MoveController.New(roleController)
  local self = {};
  setmetatable(self, MoveController);

  self.roleController = roleController;

  self.targetPosition = Vector2.zero;

  self.movePath = {};

  self.isMoveDefaultPath = false;
  self.isMoveRandomPath = false;
  self.pathMedIndex = 0;
  self.pathMed = {};
  self.pathCount = 1;

  self.callback = nil;  

  --bee
  self.beeIndex = 0;
  self.beeTargets = {};

  return self;
end

function MoveController.GetBitxorA(bitxor)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoXorN = 10;
    DemoXorN = bit.bxor(DemoXorN, bitxor)
    
    return DemoXorN;
  end
end

function MoveController.GetBitxorB(bitxor)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoXorN = 10;
    DemoXorN = bit.bxor(DemoXorN, bitxor)
    
    return DemoXorN;
  end
end

function MoveController.GetBitxorC(bitxor)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoXorN = 10;
    DemoXorN = bit.bxor(DemoXorN, bitxor)
    
    return DemoXorN;
  end
end

function MoveController:MoveToLocalTarget(targetPosition, callback, isMoveStraight, isMoveCurrentView, isMoveLine, isBeeMove)
  self.callback = callback;
  self.movePath = FindWay.Start(self.roleController.position, targetPosition, isMoveStraight, isMoveCurrentView, isMoveLine, self.roleController);

  local target = self:GetCurTarget();

  --小屋裡，玩家卡住傳到離目標方向最近的位置
  if HouseManager.IsInHouse() and self.roleController.kind == EHuman.Player and not FurnitureManager.GetPlayerIsInteracting() then
    if target == nil or target == self.roleController.position then
      local startBlockX, startBlockY = MapManager.GetBlock(self.roleController.position);

      if MapManager.IsObstacle(startBlockX, startBlockY) then
        local tempX = targetPosition.x - MapManager.centerLeft;
        local tempY = targetPosition.y - MapManager.centerTop;

        if tempX < 0 then tempX = 0 end
        if tempY < 0 then tempY = 0 end

        local targetBlockX = math.ceil(tempX * MapManager.BLOCK_CONVERT);
        local targetBlockY = math.ceil(tempY * MapManager.BLOCK_CONVERT);

        targetBlockX, targetBlockY = MapManager.GetStartEmptyBlockWithDirect(startBlockX, startBlockY, targetBlockX, targetBlockY);
        if not MapManager.IsObstacle(targetBlockX, targetBlockY) then
          local newPosition = Vector2.New(MapManager.GetPosition(Vector2.New(targetBlockX, targetBlockY)));
          UIJoystick.StopClickEffect();
          HouseManager.TeleportPlayer(self.roleController, newPosition);
        end
      end
    end
  end

  if target == nil then
    self:StopMove(false);
    return;
  end

  if self.roleController.kind == EHuman.Player then
    MachineBox.autoMoving = isBeeMove == true;
    UIJoystick.SetClickEffect(self.movePath[#self.movePath]);
  end

  self:StartMove(target);
end

function MoveController.GetBitxorD(bitxor)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoXorN = 10;
    DemoXorN = bit.bxor(DemoXorN, bitxor)
    
    return DemoXorN;
  end
end

function MoveController.GetBitxorE(bitxor)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoXorN = 10;
    DemoXorN = bit.bxor(DemoXorN, bitxor)
    
    return DemoXorN;
  end
end

function MoveController.GetBitxorF(bitxor)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoXorN = 10;
    DemoXorN = bit.bxor(DemoXorN, bitxor)
    
    return DemoXorN;
  end
end

function MoveController.GetBitxorG(bitxor)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoXorN = 10;
    DemoXorN = bit.bxor(DemoXorN, bitxor)
    
    return DemoXorN;
  end
end

function MoveController:StartMove(target)
  --小屋裡，武將卡住傳到最近的地方
  if target == self.roleController.position and HouseManager.IsInHouse() and self.roleController.kind == EHuman.HouseWarrior then
    local targetBlockX, targetBlockY = MapManager.GetStartEmptyBlock(MapManager.GetBlock(self.roleController.position));

    if not MapManager.IsObstacle(targetBlockX, targetBlockY) then
      local newPosition = Vector2.New(MapManager.GetPosition(Vector2.New(targetBlockX, targetBlockY)));
      self.roleController:Teleport(newPosition);
      self:StartRandomPath();
      return;
    end
  end

  if target == self.roleController.position then
    self:StopMove(true);
    return;
  end

  self.targetPosition = target;

  self.roleController:FaceTo(self.targetPosition);
  self.roleController:SetIsMoving(true);

  if self.roleController.kind == EHuman.Player then
    if not CGTimer.ContainsListener(MoveController.SendRolePosition) then
      CGTimer.AddListener(MoveController.SendRolePosition, MoveController.PalyerMoveTime, true);
    end
  end
end

--[[
This is the book of the generations of Adam. In the day when God made man, he made him in the image of God;
Male and female he made them, naming them Man, and giving them his blessing on the day when they were made.
Adam had been living for a hundred and thirty years when he had a son like himself, after his image, and gave him the name of Seth:
And after the birth of Seth, Adam went on living for eight hundred years, and had sons and daughters:
And all the years of Adam's life were nine hundred and thirty: and he came to his end.
And Seth was a hundred and five years old when he became the father of Enosh:
And he went on living after the birth of Enosh for eight hundred and seven years, and had sons and daughters:
And all the years of Seth's life were nine hundred and twelve: and he came to his end.
And Enosh was ninety years old when he became the father of Kenan:
--]]

function MoveController:StopMove(moveDone)
  self.targetPosition.x = 0;
  self.targetPosition.y = 0;
  self.roleController:SetIsMoving(false);

  if self.callback ~= nil then
    moveDone = moveDone or false;
    
    local callback = self.callback;
    
    self.callback = nil;
    
    callback(self.roleController, moveDone);
  end
end

function MoveController:StartDefaultPath()
  self.isMoveDefaultPath = true;

  local target = self:GetCurTarget();
  if target == nil then
    return;
  end

  self:StartMove(target);
end

function MoveController.Trash()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function MoveController:StopDefaultPath()
  self.isMoveDefaultPath = false;
  self:StopMove()
end

function MoveController.Trash2()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function MoveController.Trash3()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function MoveController.Trash4()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function MoveController:StartRandomPath()
  self.isMoveRandomPath = true;

  local target = self:GetCurTarget();

  if target == nil then return end

  self:StartMove(target);
end

function MoveController:StopRandomPath()
  self.isMoveRandomPath = false;
  self:StopMove()
end

function MoveController.Trash5()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function MoveController:Update()
  if self.roleController.kind == EHuman.Player and FightField.isInBattle then return end --戰鬥中，不移動

  if self.targetPosition.x == 0 and self.targetPosition.y == 0 then
    if self.roleController.kind == EHuman.Player then
      self:AutoMove();
    end

    return;
  end

  self.moveDist = CGTimer.deltaTime * self.roleController.speed;
  
  local moveDirection = self.targetPosition - self.roleController.position;
  
  if moveDirection.sqrMagnitude <= self.moveDist * self.moveDist then
    --到終點
    self.roleController:SetPosition(self.targetPosition);
    
    self:RemoveCurTarget();
    local target = self:GetCurTarget();
    if target == nil then
      self:StopMove(true);
    else
      self:StartMove(target);
    end
  else
    --還沒到終點
    self.roleController:SetPosition(self.roleController.position + moveDirection.normalized * self.moveDist);
  end
end

function MoveController.Trash6()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function MoveController.Trash7()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function MoveController.Trash8()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function MoveController:GetCurTarget()
  if self.isMoveDefaultPath then
    local result;
    if self.pathMedIndex <= 0 then
      self.pathMedIndex = 1;
      self.pathCount = 1;
      self.pathMedIndex = self.pathMedIndex + self.pathCount;
    elseif self.pathMedIndex > table.Count(self.pathMed) then
      self.pathMedIndex = table.Count(self.pathMed);
      self.pathCount = -1;
      self.pathMedIndex = self.pathMedIndex + self.pathCount;
    end

    result = Vector2.New(self.pathMed[self.pathMedIndex].x, self.pathMed[self.pathMedIndex].y);
    self.pathMedIndex = self.pathMedIndex + self.pathCount;

    return result;
  elseif self.isMoveRandomPath then
    local result = self.GetRandomNextPosition(self.roleController.position, self.roleController.direction);
    return result;
  else
    if table.Count(self.movePath) <= 0 then
      return nil;
    end

    return Vector2.New(MapManager.GetPosition(self.movePath[1]));
  end
end

function MoveController:RemoveCurTarget()
  table.remove(self.movePath, 1);
end

function MoveController.GetRShiftB(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function MoveController.GetRShiftB1(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function MoveController.GetRShiftB2(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function MoveController.SendRolePosition()
  if FightField.isInBattle or not Role.CanControl() then return end --戰鬥中或不可控制，不移動

  if Role.player.moveController.targetPosition.x == 0 and Role.player.moveController.targetPosition.y == 0 then --沒目標，結束移動
    MoveController.SendMove(Role.player.position.x, Role.player.position.y);
    CGTimer.RemoveListener(MoveController.SendRolePosition);
  else
    if UIJoystick.IsDrag() then
      MoveController.SendMove(Role.player.position.x, Role.player.position.y);
    else
      local pos = MoveController.GetNextPosition();
      MoveController.SendMove(pos.x, pos.y);
    end
  end
end

function MoveController.GetNextPosition()
  local pos;
  local moveDist = Role.player.speed;--MoveController.PalyerMoveTime * Role.player.speed;
  local nowPostion = Vector2.New( math.ceil(Role.player.position.x),  math.ceil(Role.player.position.y) );
  local moveDirection = Role.player.moveController.targetPosition - nowPostion;
  
  if moveDirection.sqrMagnitude <= moveDist * moveDist then
    local target =  Role.player.moveController:GetCurTarget();
    if target == nil then
      pos = Role.player.moveController.targetPosition;
    else
      pos = target;
    end
  else
    pos = nowPostion + moveDirection.normalized * moveDist;
  end

  return pos;
end

function MoveController.GetRShiftB3(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function MoveController.GetRShiftB4(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function MoveController.GetRandomNextPosition(current_Position, faceTo)
  local result = current_Position;
  local direction = math.random(0, 63);
  local blockX, blockY = MapManager.GetBlock(current_Position);
  local targetBlockX, targetBlockY;

  if direction >= 8 then
    direction = faceTo;
  end

  for i = 0, 7 do
    local newDirection = direction + i;
    newDirection = newDirection % 8;
    targetBlockX, targetBlockY = MoveController.GetNewBlockByDirection(blockX, blockY, newDirection);
    if not MapManager.IsObstacle(targetBlockX, targetBlockY) then
      result = Vector2.New(MapManager.GetPosition(Vector2.New(targetBlockX, targetBlockY)));
      return result;
    end
  end
  result = current_Position;

  return result;
end

function MoveController.GetNewBlockByDirection(blockX, blockY, direction)
  if direction == EFaceDirection.Up then
    blockY = blockY - 1;
  elseif direction == EFaceDirection.LeftUp then
    blockX = blockX - 1;
    blockY = blockY - 1;
  elseif direction == EFaceDirection.Left then
    blockX = blockX - 1;
  elseif direction == EFaceDirection.LeftDown then
    blockX = blockX - 1;
    blockY = blockY + 1;
  elseif direction == EFaceDirection.Down then
    blockY = blockY + 1;
  elseif direction == EFaceDirection.RightDown then
    blockX = blockX + 1;
    blockY = blockY + 1;
  elseif direction == EFaceDirection.Right then
    blockX = blockX + 1;
  elseif direction == EFaceDirection.RightUp then
    blockX = blockX + 1;
    blockY = blockY - 1;
  end
  
  return blockX, blockY;
end

function MoveController.SendMove(x, y)
  --C:006-001 <玩家移動> +方向(1) +座標X(2) +座標Y(2)
  sendBuffer:Clear()
  sendBuffer:WriteByte(Role.player.direction);
  sendBuffer:WriteUInt16(x);
  sendBuffer:WriteUInt16(y);
  Network.Send(6, 1, sendBuffer);
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

--bee
local nextMoveTime = 0;

function MoveController.GetNothing()
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

function MoveController.GetNothing1()
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

function MoveController:AutoMove()
  if CGTimer.time < nextMoveTime then return end

  if not MachineBox.autoMove then return end
  if UIJoystick.IsDrag() then return end
  if not UI.IsVisible(UIMain) then return end

  local mode = MachineBox.GetMoveMode();

  local traceMoveTarget = false;
  local tracePatrolNpc = true;
  local traceNpcId = 0;
  local traceCallback = nil;

  if Define.SuperAI then
    if SceneManager.dungeonId ~= 0 then
      mode = EAutoMoveMode.Chase;

      --traceMoveTarget = false;
      tracePatrolNpc = false;

      if UI.IsVisible(UICheck) then
        UICheck.OnClick_Next();
        return;
      end

      if UI.IsVisible(UIResult) then
        UIResult.OnClickfun1();
        MachineBox.SetAutoMove(false);
        return;
      end

      local traceMissionId = 0;
      for k, v in pairs(MarkManager.showMissions) do
        if markDatas[v] ~= nil and Contains(markDatas[v].kind, 4, 5) then
          traceMissionId = v;
          break;
        end
      end

      if Contains(traceMissionId, 12331, 12347, 12351, 12355) then
        --找寶箱
        traceNpcId = 20001;
      elseif traceMissionId == 12359 then
        --找巴豆妖1
        traceNpcId = 22087;
      elseif traceMissionId == 12363 then
        --找巴豆妖2
        traceNpcId = 22088;
      elseif traceMissionId == 12367 then
        --找巴豆妖3
        traceNpcId = 22089;
      elseif traceMissionId == 12371 then
        --找巴豆妖4
        traceNpcId = 22090;
      elseif traceMissionId ~= 0 then
        --多人副本
        MarkManager.Navigation(traceMissionId);
      end

      if traceNpcId == 0 then return end

      if self.targetPosition.x ~= 0 or self.targetPosition.y ~= 0 then return end

      traceCallback =
        function(roleController, moveDone)
          if not moveDone then return end

          TargetManager.ChangeTarget();
          if Role.target ~= nil and Role.target.npcId == traceNpcId then
            Role.target:OnInteractive(EInteractive.Trig);
          end
        end
      
    else
      --traceMoveTarget = true;
      tracePatrolNpc = true;
    end
  end

  if EventManager.inBattle then return end
  if EventManager.IsRunning() then return end
  
  if mode == EAutoMoveMode.Chase then
    local chaseNpc = nil;
    local chaseDistance = nil;
    local distance = 0;
    local ignore = false;
    
    for k, v in pairs(Role.mapNpcs) do
      ignore = false;

      --檢查是否可視
      if not ignore and (v.visible == ERoleVisible.Hide or v.visible == ERoleVisible.TimeHide) then
        ignore = true;
      end

      --檢查是否鎖定目標
      if not ignore and Define.SuperAI then
        if traceNpcId ~= 0 then
          if v.npcId ~= traceNpcId then
            ignore = true;
          end
        elseif MachineBox.client.mobs[EMachineBoxRole.Player] ~= 10 then
          if k ~= MachineBox.client.mobs[EMachineBoxRole.Player] then
            ignore = true;
          end
        end
      end
      
      --檢查是否追擊 NPC
      if not ignore and tracePatrolNpc and v.data.traceRadius <= 0 then
        ignore = true;
      end

      --檢查是否追擊屬性
      if not ignore and npcDatas[v.npcId] ~= nil and not MachineBox.CheckChaseElement(npcDatas[v.npcId].element) then
        ignore = true;
      end
      
      --[[ 因應SERVER撞怪邏輯改變，不再需要做此檢查
      --檢查是否戰鬥中
      if not ignore then
        for kk, vv in pairs(Role.players) do
          if vv.index ~= Role.playerId and vv.war ~= EWar.None then
            if (v.position - vv.position).sqrMagnitude < 100 then
              ignore = true;
              break;
            end
          end
        end
      end
      --]]

      if not ignore then
        if traceMoveTarget and v.moveController ~= nil and v.moveController.targetPosition.x ~= 0 and v.moveController.targetPosition.y ~= 0 then
          distance = (Role.player.position - v.moveController.targetPosition).sqrMagnitude;
        else
          distance = (Role.player.position - v.position).sqrMagnitude;
        end

        if chaseDistance == nil or chaseDistance > distance then
          chaseNpc = v;
          chaseDistance = distance;
        end
      end
    end

    if chaseNpc ~= nil then
      if traceMoveTarget and chaseNpc.moveController ~= nil and chaseNpc.moveController.targetPosition.x ~= 0 and chaseNpc.moveController.targetPosition.y ~= 0 then
        self:MoveToLocalTarget(chaseNpc.moveController.targetPosition, traceCallback);
      else
        self:MoveToLocalTarget(chaseNpc.position, traceCallback);
      end

      if self.targetPosition ~= Vector2.zero then
        CGTimer.DoFunctionDelay(1, function() self:AutoMove(); end);
      else
        nextMoveTime = CGTimer.time + 1;
      end

      return;
    end
  end

  if not MachineBox.autoMoving then
    local target = Vector2.zero;
    
    target.x = self.roleController.position.x;
    target.y = self.roleController.position.y;

    for k, v in pairs(BeePath) do
      target.x = target.x + BeePath[k][1];
      target.y = target.y + BeePath[k][2];

      if self.beeTargets[k] == nil then
        self.beeTargets[k] = Vector2.zero;
      end

      self.beeTargets[k].x = target.x;
      self.beeTargets[k].y = target.y;
    end

    self.beeIndex = 1;
  else
    self.beeIndex = self.beeIndex + 1;
  end
  
  if table.maxn(self.beeTargets) == 0 then return end
  
  if self.beeIndex > table.maxn(self.beeTargets) then
    self.beeIndex = 1;
  end
  
  self:MoveToLocalTarget(self.beeTargets[self.beeIndex], nil, false, true, false, true);
end