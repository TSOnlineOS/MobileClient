local bit = require("bit")

--[[
And Abraham went on his way from there to the land of the South, and was living between Kadesh and Shur, in Gerar.
And Abraham said of Sarah, his wife, She is my sister: and Abimelech, king of Gerar, sent and took Sarah.
But God came to Abimelech in a dream in the night, and said to him, Truly you are a dead man because of the woman whom you have taken; for she is a man's wife.
Now Abimelech had not come near her; and he said, Lord, will you put to death an upright nation?
Did he not say to me himself, She is my sister? and she herself said, He is my brother: with an upright heart and clean hands have I done this.
And God said to him in the dream, I see that you have done this with an upright heart, and I have kept you from sinning against me: for this reason I did not let you come near her.
So now, give the man back his wife, for he is a prophet, and let him say a prayer for you, so your life may be safe: but if you do not give her back, be certain that death will come to you and all your house.
So Abimelech got up early in the morning and sent for all his servants and gave them word of these things, and they were full of fear.
Then Abimelech sent for Abraham, and said, What have you done to us? what wrong have I done you that you have put on me and on my kingdom so great a sin? You have done to me things which are not to be done.
And Abimelech said to Abraham, Why did you do this thing?
And Abraham said, Because it seemed to me that there was no fear of God in this place, and that they might put me to death because of my wife.
And, in fact, she is my sister, the daughter of my father, but not the daughter of my mother; and she became my wife:
And when God sent me wandering from my father's house, I said to her, Let this be the sign of your love for me; wherever we go, say of me, He is my brother.
Then Abimelech gave to Abraham sheep and oxen and men-servants and women-servants, and gave him back his wife Sarah.
And Abimelech said, See, all my land is before you; take whatever place seems good to you.
And he said to Sarah, See, I have given to your brother a thousand bits of silver so that your wrong may be put right; now your honour is clear in the eyes of all.
]]--

FightInfo = { };-- 戰鬥前所要備份的資料
function FightInfo.New()
  local self = { };
  self.pose_Kind = 0;
  self.speed = 0;
  self.direction = 0;
  self.beh_Kind = 0;
  return self;
end

function FightInfo.GetRShifts(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function FightInfo.GetRShifts1(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

function FightInfo.GetRShifts2(bitrshift)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoEFlow = 0;
    bit.rshift(DemoEFlow, bitrshift)
    
    return DemoEFlow
  end
end

FightEffect = { };  -- 戰鬥效果

function FightEffect.Trash()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function FightEffect.TrashA()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function FightEffect.New()
  local self = { };
  self.skillID = 0;
  -- 用於Status上面
  self.dColm = 0;
  self.dRow = 0;
  -- 對DColm目的行,DRow目的列
  self.attack_Result = 0;
  -- Attack_Result 施者結果(0:Miss 1:成功)
  self.beHitAct = 0;
  -- BeHitAct 被施者動作 (0:正常 1:擋 2:閃 3:不變)
  self.attr_Count = 0;
  -- 一共改變幾個屬性
  self.attr_Kind = { };
  -- array[1  6] of Byte;            --Attr_Kind改變屬性種類 (Const Attr_xxx)
  self.value = { };
  -- array[1  6] of Word;                --Value數值
  self.sign = { };
  -- array[1  6] of Byte;                 --Value正負值 (0正 1負)
  self.freeValue = { };
  -- array[1  6] of Word;            --還有多少數值可以扣
  self.upValue = { };
  -- :array[1  6] of  Word;              --這次跳出多少數值
  self.hitCount = 0;
  -- 己k了幾下
  return self;
end

function FightEffect.TrashC()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end


function FightEffect.TrashD()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

FlyTreasure = { };  -- 儲存各自噴寶時的特效
function FlyTreasure.New(fColm, fRow, colm, row, itemId)
  local self = { };
  self.sColm = fColm;
  self.sRow = fRow;
  self.dColm = colm;
  self.dRow = row;
  self.thingID = itemId;
  return self;
end

function FlyTreasure.MeanlessF()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function FlyTreasure.MeanlessD()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

FightRoleController = { }
FightRoleController.__index = FightRoleController;

function FightRoleController.New()
  local self = { };
  setmetatable(self, FightRoleController);

  self.data = nil; --用來儲存資料

  self.status = {};
  self.status_Kind = {};
  self.status_Kind[EFightStatusKind.Seal] = 0;    --封印狀態(0正常 1冰封 2旋風 3樹精     100)
  self.status_Kind[EFightStatusKind.Vary] = 0;    --變化狀態(0正常 101  170)
  self.status_Kind[EFightStatusKind.Faint] = 0;   --衰弱狀態(0正常 171  240)
  self.status_Kind[EFightStatusKind.Spec] = 0;    --特殊狀態(0正常 241護主)
  self.status_Kind[EFightStatusKind.Strong] = 0;  --強盛狀態(0正常 250     )
  self.status_Kind[EFightStatusKind.Passive] = 0; --被動效果

  self.transparent = false; --是否透明
  self.overturn = false;
  self.isPlant = false; --種蒜中
  self.fantasY = 0; --暫存用y值

  self.squelching = false; 
  self.squelch = MaxSquelch; --被壓扁的大小

  self.shrink = 10;   --縮放  10:為一舨大小
  self.id = 0; 

  self.moveOldTime = 0;
  self.totalMoveTime = 0;

  self.startPos = Vector2.zero;
  self.nowPos = Vector2.zero;
  self.goal = Vector2.zero;
  self.totalDist = 0;
  self.jumpStart = false;
  self.jumpHeight = 0;
  self.arrive = false;
  self.speed = 0.36;

  self.beh_Kind = 0;
  self.behOldTime = 0;
  -- 行為舊的時間,(旋轉,震動)
  self.beh_Step = 0;
  -- 執行Step
  self.beh_Repeat = 0;
  -- 重覆次數
  self.behMed = { };
  -- array[0  MaxBehMed] of TPoint;

  self.index = -1;
  self.kind = 0;
  -- humkind
  self.npcId = 0;
  self.blnExiting = false;
  --分身的行列
  self.divColm = 0;
  self.divRow = 0;
  self.blnActSetOK = false;
  -- 030718-1J  秀烏龜  active setup finish
  self.fightActInfo = FightInfo.New();
  -- 備戰資訊
  self.statusActInfo = FightInfo.New();
  -- 狀態資訊

  self.blnFirst = false;
  self.blnChoose = false;

  self.npcIdx = 0;
  -- 記錄MapNpc的idx或是MineNpc的idx
  self.colm = 0;
  self.row = 0;
  -- 座標

  self.masterID = 0;

  self.action_Kind = 0;
  -- 行動種類(例: 0無 1移,2跳,3瞬);
 
  self.party_Kind = 0;
  -- 陣營種類(0:None 1:Right 2Left)

  self.numberUp = { };   --數字往上移(用於顯示Hp, Sp, miss等);
  self.numberUpOldTime = 0;  --數字的時間

  self.hitCount = 0;
  -- 被打count
  self.effect = { };
  -- 戰鬥的效果,打在別人身上的效果

  self.useSkID = 0; --SK_HandFight;
  -- 使用的技能 --初始為肉搏技
  self.useItemID = 0;
  -- 使用的技能

  self.treasureSave = { };
  self.whirelStart = false;
  --開始旋風而起

  self.itemSkillId = 0; --使用符咒技能ID, 本回合內再使用不扣魔
  self.isTurtle = false;

  -- Unity
  self.roleController = nil;
  self.scaleRoot = nil;
  self.resShadow = {};
  self.materialKind = 1;

  return self;
end

function FightRoleController.Random()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function FightRoleController:Clear()
  self:ThrowTreasure();
  self:ResetSquelch();

  if FightField.attack[self.index] ~= nil then 
    FightField.attack[self.index]:Free();
  end
  
  for k,v in pairs(self.numberUp)do
    v:Free();
  end  
  table.Clear(self.numberUp)

  for k, v in pairs(self.status)do
    v:Free();
  end
  table.Clear(self.status)

  self:FreeResShadow();  
  --[[
  if self.scaleRoot ~= nil then 
    self.scaleRoot.transform.localScale = Vector3.one;
    self.scaleRoot.transform.localPosition = Vector3.zero;
    self.roleController.rawImage_Body.transform:SetParent(self.roleController.transform);
    self.roleController.rawImage_Body.transform:SetSiblingIndex(2);
    GameObject.Destroy(self.scaleRoot);
  end
  --]]
  if self.roleController ~= nil then 
    self.roleController:Destroy();
    self.roleController = nil;
  end  
end

function FightRoleController.Random1()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function FightRoleController.Random2()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function FightRoleController.Random3()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function FightRoleController.Random4()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function FightRoleController:DoInFight(aColm, aRow, aMasterID, isWalk, aInitSet, warType)
  -- todo return warType
  local aIdx;
  local aBasePlayer = nil;
  -- TBasePlayer

  --todo
  -- 心魔
  --if not(Contains(self.kind, Hum_Player, Hum_Players)) then
    -- todo GRole
    -- npcDatas[self.npcId].GRole == 1520 then
    -- //if NpcData.FindNPC(Role.ID).GRole = 1131 then
    -- (*
    --    CopyHuman(Player);
    --    //Hum_Kind:=Role.Hum_Kind;
    --    ID:=Role.ID;
    --    Name:=Role.Name;
    -- *)
--    aIdx = FightField.chip[3 - aColm][aRow].fHumIdx;
--    if FightField.chip[3 - aColm][aRow].humID ~= 0 and FightField.fightHum[aIdx] ~= nil and FightField.fightHum[aIdx].ID ~= 0 then
--      -- 該空位有人
--      self:CopyHuman(FightField.fightHum[aIdx]);
--    end
--  end
  if warType == EWar.Join then
    self.blnFirst = true;
    if self.kind == EHuman.Player then
      ShowCenterMessage(string.Get(40328),2000); --//請等待回合開始        
    end
  end

  if warType == EWar.OldJoin then
    -- 舊參戰100,設回參戰6  ,判斷是否第一次進戰鬥用
    warType = EWar.Join;
  end

  --  Se_EquipForm.CurrentPlayer = 0;
  --  Se_EquipForm.Human:CopyHuman(Player);
  --  Se_EquipForm.FocusHum = Player;

  self.colm = aColm;
  self.row = aRow;

  self.party_Kind = FightRoleController.GetParty(self.colm);
  if self.party_Kind == EFightParty.Right then
    --    if self.DBKind == 12 then --投石車
    --      self.direction = 0;
    --      self.isWeapon = false;
    ----{
    ----          16://銅礦
    ----            begin
    ----              direction:=8;
    ----            end
    ----}
    --    else
    --      self.direction = Pose_Prepare;
    --    end
  elseif self.party_Kind == Party_Left then
    --    if self.DBKind == 12 then --投石車
    --      self.direction = 1;
    --      self.isWeapon = false;
    ----{
    ----          16://銅礦
    ----            begin
    ----              direction:=8;
    ----              isWeapon:=False;
    ----            end
    ----}
    --    else
    --      self.direction = Pose_Prepare+1;
    --    end
  end

  self.masterID = aMasterID;
  self.roleController:SetAttribute(EAttribute.Lv, aInitSet.lv);
  self.roleController:SetAttribute(EAttribute.MaxHp, aInitSet.maxHp);
  self.roleController:SetAttribute(EAttribute.MaxSp, aInitSet.maxSp);
  self.roleController:SetAttribute(EAttribute.Hp, aInitSet.hp);
  self.roleController:SetAttribute(EAttribute.Sp, aInitSet.sp);
  self.roleController:SetAttribute(EAttribute.Element, aInitSet.element);  
  self.roleController:SetAttribute(EAttribute.UpgradeLv, aInitSet.upgradeLv);
  self:UpdateUIInfo();
  self.roleController:SetDirection(self:GetDirection());
  self.roleController:SetInBattle(true);

  self.blnActSetOK = true;
  -- 030718-1J  秀烏龜
  self.fightActInfo.pose_Kind = self.roleController.animationId;
  -- 姿勢備份
  self.fightActInfo.speed = self.speed;            --速度 .
  self.fightActInfo.direction = self.roleController.direction;
  -- 方向 .
  self.fightActInfo.beh_Kind = self.beh_Kind;
  -- 行為 .

  self.statusActInfo.pose_Kind = self.roleController.animationId;
  -- 姿勢備份
  self.statusActInfo.speed = self.speed;           --速度 .
  self.statusActInfo.direction = self.roleController.direction;
  -- 方向 .
  self.statusActInfo.beh_Kind = self.beh_Kind;
  -- 行為 .

  if isWalk then
    FightField.SetSkillKind(self.index, ESkill_Kind.EnterFight, self.index)
  else
    if self.roleController:GetAttribute(EAttribute.Hp) == 0 then
      self.roleController:SetIsDead(true)
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
  
  
  self:ResetPosition();
  
  local selectFrame = FightField.selectFrames[self.colm][self.row];  
  selectFrame.uiEvent:ClearListener();
  selectFrame.uiEvent:SetListener(EventTriggerType.PointerClick, self.DoClick);
  selectFrame.uiEvent.parameter = self;
  selectFrame.gameObject.transform.localPosition = Vector3.New(self.nowPos.x, -self.nowPos.y + 35, 0);
end

function FightRoleController:SoulDoInFight(aColm, aRow, aMasterID, isWalk, aInitSet, warType)
  -- todo return warType
  local aIdx;
  local aBasePlayer = nil;
  --[[In the beginning God created the heaven and the earth.At the first God made the heaven and the earth.
And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of God moved upon the face of the waters.
At the first God made the heaven and the earth.And the earth was waste and without form; and it was dark on the face of the deep: and the Spirit of God was moving on the face of the waters.And God said, Let there be light: and there was light.
And God, looking on the light, saw that it was good: and God made a division between the light and the dark,
Naming the light, Day, and the dark, Night. And there was evening and there was morning, the first day.
And God said, Let there be a solid arch stretching over the waters, parting the waters from the waters.
And God made the arch for a division between the waters which were under the arch and those which were over it: and it was so.
And God gave the arch the name of Heaven. And there was evening and there was morning, the second day.
And God said, Let the waters under the heaven come together in one place, and let the dry land be seen: and it was so.
And God gave the dry land the name of Earth; and the waters together in their place were named Seas: and God saw that it was good.
And God said, Let grass come up on the earth, and plants producing seed, and fruit-trees giving fruit, in which is their seed, after their sort: and it was so.
And grass came up on the earth, and every plant producing seed of its sort, and every tree producing fruit, in which is its seed, of its sort: and God saw that it was good.
And there was evening and there was morning, the third day.
And God said, Let there be lights in the arch of heaven, for a division between the day and the night, and let them be for signs, and for marking the changes of the year, and for days and for years:
And let them be for lights in the arch of heaven to give light on the earth: and it was so.
And God made the two great lights: the greater light to be the ruler of the day, and the smaller light to be the ruler of the night: and he made the stars.
And God put them in the arch of heaven, to give light on the earth;
To have rule over the day and the night, and for a division between the light and the dark: and God saw that it was good.
And there was evening and there was morning, the fourth day.
And God said, Let the waters be full of living things, and let birds be in flight over the earth under the arch of heaven.
And God made great sea-beasts, and every sort of living and moving thing with which the waters were full, and every sort of winged bird: and God saw that it was good.
And God gave them his blessing, saying, Be fertile and have increase, making all the waters of the seas full, and let the birds be increased in the earth.--]]
  
  if warType == EWar.Join then
    self.blnFirst = true;
    if self.kind == EHuman.Player then
      ShowCenterMessage(string.Get(40328),2000); --//請等待回合開始
    end
  end

  if warType == EWar.OldJoin then
    -- 舊參戰100,設回參戰6  ,判斷是否第一次進戰鬥用
    warType = EWar.Join;
  end

  self.colm = aColm;
  self.row = aRow;

  self.party_Kind = FightRoleController.GetSoulParty(self.colm);

  self.masterID = aMasterID;
  self.roleController:SetAttribute(EAttribute.Lv, aInitSet.lv);
  self.roleController:SetAttribute(EAttribute.MaxHp, aInitSet.maxHp);
  self.roleController:SetAttribute(EAttribute.MaxSp, aInitSet.maxSp);
  self.roleController:SetAttribute(EAttribute.Hp, aInitSet.hp);
  self.roleController:SetAttribute(EAttribute.Sp, aInitSet.sp);
  self.roleController:SetAttribute(EAttribute.Element, aInitSet.element);
  self.roleController:SetAttribute(EAttribute.UpgradeLv, aInitSet.upgradeLv);
  self:UpdateUIInfo();
  self.roleController:SetDirection(self:GetDirection());
  self.roleController:SetInBattle(true);

  self.blnActSetOK = true;
  -- 030718-1J  秀烏龜
  self.fightActInfo.pose_Kind = self.roleController.animationId;
  -- 姿勢備份
  self.fightActInfo.speed = self.speed;            --速度 .
  self.fightActInfo.direction = self.roleController.direction;
  -- 方向 .
  self.fightActInfo.beh_Kind = self.beh_Kind;
  -- 行為 .

  self.statusActInfo.pose_Kind = self.roleController.animationId;
  -- 姿勢備份
  self.statusActInfo.speed = self.speed;           --速度 .
  self.statusActInfo.direction = self.roleController.direction;
  -- 方向 .
  self.statusActInfo.beh_Kind = self.beh_Kind;
  -- 行為 .

  --if isWalk then
    --FightField.SetSkillKind(self.index, ESkill_Kind.EnterFight, self.index)
  --else
  --  if self.roleController:GetAttribute(EAttribute.Hp) == 0 then
  --    self.roleController:SetIsDead(true)
  --  end
  --end

  self:ResetPosition();


  self:SetAlpha(100);

  --local selectFrame = FightField.selectFrames[self.colm][self.row];
  --selectFrame.uiEvent:ClearListener();
  --selectFrame.uiEvent:SetListener(EventTriggerType.PointerClick, self.DoClick);
  --selectFrame.uiEvent.parameter = self;
  --selectFrame.gameObject.transform.localPosition = Vector3.New(self.nowPos.x, -self.nowPos.y + 35, 0);
end

function FightRoleController:ResetPosition()
  if self.kind == EHuman.SoulWarrior  then
    self.nowPos = Vector2.New(FightField.SoulChip[self.colm][self.row].x, FightField.SoulChip[self.colm][self.row].y);
  else
    self.nowPos = Vector2.New(FightField.chip[self.colm][self.row].x, FightField.chip[self.colm][self.row].y);
  end

  self.startPos = self.nowPos;
  self.goal = self.nowPos;
  self:SetPosition(self.nowPos)
end

function FightRoleController.Meanlessas()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function FightRoleController.Meanlessav()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function FightRoleController.Meanlessac()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function FightRoleController.Meanlessad()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

--function FightRoleController:SoulResetPosition()
--  self.nowPos = Vector2.New(FightField.SoulChip[self.colm][self.row].x, FightField.SoulChip[self.colm][self.row].y);
--  self.startPos = self.nowPos;
--  self.goal = self.nowPos;
--  self:SetPosition(self.nowPos)
--end

-- function FightRoleController:SetMaterial(kind)  -- 1: role  2: light
--   if self.materialKind == kind then
--     return;
--   else
--     self.materialKind = kind;
--     if kind == 1 then
--       poolMgr:Release("LightMaterial", self.roleController.material);
--       self.roleController.material = poolMgr:Get("RoleMaterial");
--     else
--       poolMgr:Release("RoleMaterial", self.roleController.material);
--       self.roleController.material = poolMgr:Get("LightMaterial");
--     end
--   end
-- end

function FightRoleController:SetAlpha(alpha)
  if alpha == 255 then 
    self.roleController.material:SetInt("_Invisible", 0);
    self.roleController.material:SetFloat("_InvisibleAlpha", 1);
  else
    self.roleController.material:SetInt("_Invisible", 1);
    self.roleController.material:SetFloat("_InvisibleAlpha", alpha / 255);
  end
  
  if LuaHelper.CheckDefine("DemoCode") then
    local folk = 69;
    local dog = 27;
    local stupid = 0;
    if stupid ~= nil then
      stupid = folk + dog;
    else
      stupid = stupid + 1;
    end
  end
end

function FightRoleController:SetOutline(visible)
  if visible then 
    self.roleController.material:SetFloat("_Outline", 1);    
    self.roleController.material:SetColor("_Color", Color.Yellow);
  else
    self.roleController.material:SetFloat("_Outline", 0);
    self.roleController.material:SetColor("_Color", Color.Alpha);
  end
  
  if LuaHelper.CheckDefine("DemoCode") then
    local meaningless = 45;
    local shift = 2;
    local result = 0;
    bit.rshift(meaningless, shift)
    bit.lshift(meaningless, shift)
    if bit.band(meaningless,45) == 45 then
      result = meaningless * shift;
    end
  end
end

function FightRoleController:SetTransparent(visible)  
  if self.transparent == visible then 
    return;
  end
  
  self.transparent = visible;

  if self.transparent  then 
    self:SetOutline(true);
    self:SetAlpha(10)
  else
    self:SetOutline(false);
    self:SetAlpha(255)
  end
end

function FightRoleController:SetPosition(pos)
  self.roleController:SetPosition(pos)

  local sceneOrder = 0;

  if not(Contains(self.kind, EHuman.Player, EHuman.Players)) then
    if Contains(self.id, 37008,37009,37015,37013,35031,35034,42107,42108,42160,42170,42184,35056) then  --木門/城門/木牆/城牆/左龍爪/左龜爪/鉅鹿外城門/鉅鹿主城門/汜水關守兵/虎牢關守兵/洛陽城守兵
      sceneOrder = FightField.FIGHT_GROUND_ORDER;
    elseif Contains(self.id, 35030,35033,35055) then --右龍爪/右龜爪    
      sceneOrder = FightField.FIGHT_BODY_ORDER + 500;
    else
      sceneOrder = FightField.FIGHT_BODY_ORDER; 
    end
  else
    sceneOrder = FightField.FIGHT_BODY_ORDER; 
  end


  self.roleController.canvas.sortingOrder = sceneOrder  + self.nowPos.y - self.scaleRoot.transform.localPosition.y;
end

function FightRoleController.Script11()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function FightRoleController.Script12()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function FightRoleController.Script13()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function FightRoleController:GetDirection()
  if self.party_Kind == EFightParty.Left then
    return 4
  elseif self.party_Kind == EFightParty.Right then
    return 0;
  end
end

function FightRoleController.GetParty(aColm)
  -- 傳入colm,得到其Party
  local result = Party_None;
  if aColm == 0 or aColm == 1 then
    result = EFightParty.Left;
  elseif aColm == 2 or aColm == 3 then
    result = EFightParty.Right;
  end
  return result;
end

function FightRoleController.Script14()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function FightRoleController.Script15()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function FightRoleController.Script16()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function FightRoleController.Script17()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function FightRoleController.Script18()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function FightRoleController.GetSoulParty(aColm)
  -- 傳入colm,得到其Party
  local result = Party_None;
  if aColm == 0 then
    result = EFightParty.Left;
  elseif aColm == 1 then
    result = EFightParty.Right;
  end
  return result;
end

function FightRoleController:ExitFight()
  -- 離開戰鬥
  if self.id == Role.playerId and self.kind == EHuman.Player then
    -- 玩家
    Role.player:SetWar(EWar.None);

    FightField.ExitFight();
  
    UIMain.SetDropdownActive(true);
  else
    FightField.FreeFightHum(self.index);
  end
end

function FightRoleController:SetBeh(aBehKind)
  -- 若是被打飛或死亡了,不準設其他行為
  -- if Beh_Kind in [Beh_FlyOut, Beh_Dead] then
  --  exit;
  if Contains(self.beh_Kind, EFightBeh.Dodge, EFightBeh.Residual, EFightBeh.Divide, EFightBeh.MagicalEye) then     
    self:CloseAllResShadow();
  end
  self.beh_Kind = aBehKind;

  if self.beh_Kind == EFightBeh.Quake then
    self:FQuake(true);
  elseif self.beh_Kind == EFightBeh.Dodge then
    self:FDodge(true);
  elseif self.beh_Kind == EFightBeh.FlyOut then
    self:FFlyOut(true);
  elseif self.beh_Kind == EFightBeh.Dead then
    self:FDead(true);
  elseif self.beh_Kind == EFightBeh.MagicalEye then
    self:FMagicalEye(true);
  elseif self.beh_Kind == EFightBeh.Residual then 
    self:FResidual(true);
  end
end

function FightRoleController:FRotate()
  local direction = self.roleController.direction;
  if (CGTimer.time - self.behOldTime) * 1000 >= (Time_Rotate / FightField.timeScale) then  
    self.behOldTime = CGTimer.time;
    direction = direction + 1;
    if direction > 7 then 
      direction = 0;
    end
    self.roleController:SetDirection(direction)
  end  
end

function FightRoleController:FQuake(Initial)
  local quakeDist = 12;  --震動的半徑
  local time_Quake = 80; --震動間隔  

  if Initial then  
    self.beh_Step = 0;
    self.startPos = Vector2.New(self.nowPos.x, self.nowPos.y);
  end
  if (CGTimer.time - self.behOldTime)* 1000 >= (time_Quake / FightField.timeScale) then  
    self.behOldTime = CGTimer.time;

    if self.beh_Step == 0 then                 
      self.nowPos = Vector2.New(self.nowPos.x + 1, self.nowPos.y + 1)
      self.beh_Step = 1;
    elseif self.beh_Step == 1 then                 
      self.nowPos = self:GetSpot( EFightSpot.Back, quakeDist);                    
      self.beh_Step = 0;        
    end
  end
end

function FightRoleController:FDodge(initial)
  local DSpeed = 0.24;
  local Dist = 50;

  local test = Vector2.zero; 
  local dx, dy;
  -- 三個邊長度
  local m;
  -- 斜率
  local aa, bb;
  local i;
  local dTime;
  local moveDist;
  -- 移動距離

  local gridW = Vector2.zero;
  -- 移到下一個格子長和寬的x,y差值
  -- Width斜率的Sin和Cos
  local aRj, dodgeDir;

  if initial then
    self.beh_Step = 0;
    self.beh_Repeat = 0;
    -- 0:為主體位置  1:為虛擬主體
    self.behMed = { };
    for i = 0, Dodge_MaxBehMed do
      self.behMed[i] = Vector2.New(FightField.chip[self.colm][self.row].x, FightField.chip[self.colm][self.row].y);
    end
    self.behOldTime = CGTimer.time;
  end

  -- 閃躲三部曲
  if self.beh_Step == 0 then
    gridW.x = math.round(Dist * FieldSinSitaW);
    gridW.y = math.round(Dist * FieldCosSitaW);

    if self.roleController.direction == 4 then
      dodgeDir = 2;
      -- 向左躲
      test = Vector2.New(self.behMed[0].x - gridW.x, self.behMed[0].y - gridW.y);      
    else
      dodgeDir = 1;
      -- 向右躲
      test = Vector2.New(self.behMed[0].x + gridW.x, self.behMed[0].y + gridW.y);            
    end
  elseif self.beh_Step == 1 then
    test = Vector2.New(self.behMed[0].x, self.behMed[0].y);                
  elseif self.beh_Step == 2 then
    -- 閃躲完畢
    self.nowPos.x = self.behMed[0].x;
    self.nowPos.y = self.behMed[0].y;
    self:SetBeh(EFightBeh.None);
    return;
  end

  dTime = math.round((CGTimer.time - self.behOldTime) * 1000) * FightField.timeScale;
  -- 時間差
  moveDist = math.round(dTime * DSpeed);

  local dist = test - self.behMed[1];
  dx = test.x - self.behMed[1].x;
  dy = test.y - self.behMed[1].y;

  if dist.magnitude <= moveDist then 
    self.behMed[1].x = test.x;
    self.behMed[1].y = test.y;
  else
    m = math.abs(dy /(dx + 0.001));

    aa = math.round((1 /(math.sqrt(math.pow(m, 2) + 1))) * moveDist);
    bb = math.round((m /(math.sqrt(math.pow(m, 2) + 1))) * moveDist);
    if dx >= 0 then
      self.behMed[1].x = self.behMed[1].x + aa
    else
      self.behMed[1].x = self.behMed[1].x - aa;
    end
    if dy >= 0 then
      self.behMed[1].y = self.behMed[1].y + bb
    else
      self.behMed[1].y = self.behMed[1].y - bb;
    end
  end

  if (math.abs(self.behMed[2].x - self.behMed[1].x) >= 20) or
    (math.abs(self.behMed[2].y - self.behMed[1].y) >= 20) then
    for i = Dodge_MaxBehMed, 2, -1 do
      self.behMed[i] = Vector2.New(self.behMed[i - 1].x, self.behMed[i - 1].y);
    end
  end

  if ((self.behMed[1].x == test.x) and(self.behMed[1].y == test.y)) and self.beh_Step < 2 then
    self.beh_Step = self.beh_Step + 1;
  end
  self.nowPos = Vector2.New(self.behMed[1].x, self.behMed[1].y);
  self.behOldTime = CGTimer.time;
end

--[[
Now Abraham was old and far on in years: and the Lord had given him everything in full measure.
And Abraham said to his chief servant, the manager of all his property, Come now, put your hand under my leg:
And take an oath by the Lord, the God of heaven and the God of the earth, that you will not get a wife for my son Isaac from the daughters of the Canaanites among whom I am living;
But that you will go into my country and to my relations and get a wife there for my son Isaac.
And the servant said, If by chance the woman will not come with me into this land, am I to take your son back again to the land from which you came?
And Abraham said, Take care that you do not let my son go back to that land.
The Lord God of heaven, who took me from my father's house and from the land of my birth, and made an oath to me, saying, To your seed I will give this land: he will send his angel before you and give you a wife for my son in that land.
And if the woman will not come with you, then you are free from this oath; only do not take my son back there.
And the servant put his hand under Abraham's leg, and gave him his oath about this thing.
And the servant took ten of his master's camels, and all sorts of good things of his master's, and went to Mesopotamia, to the town of Nahor.
And he made the camels take their rest outside the town by the water-spring in the evening, at the time when the women came to get water.
And he said, O Lord, the God of my master Abraham, let me do well in what I have undertaken this day, and give your mercy to my master Abraham.
See, I am waiting here by the water-spring; and the daughters of the town are coming out to get water:
Now, may the girl to whom I say, Let down your vessel and give me a drink, and who says in answer, Here is a drink for you and let me give water to your camels: may she be the one marked out by you for your servant Isaac: so may I be certain that you have been good to my master Abraham.
And even before his words were ended, Rebekah, the daughter of Bethuel, the son of Milcah, who was the wife of Nahor, Abraham's brother, came out with her water-vessel on her arm.
She was a very beautiful girl, a virgin, who had never been touched by a man: and she went down to the spring to get water in her vessel.
And the servant came running to her and said, Give me a little water from your vessel.
And she said, Take a drink, my lord: and quickly letting down her vessel onto her hand, she gave him a drink.
And having done so, she said, I will get water for your camels till they have had enough.
And after putting the water from her vessel into the animals' drinking-place, she went quickly back to the spring and got water for all the camels.
And the man, looking at her, said nothing, waiting to see if the Lord had given his journey a good outcome.
And when the camels had had enough, the man took a gold nose-ring, half a shekel in weight, and two ornaments for her arms of ten shekels weight of gold;
And said to her, Whose daughter are you? is there room in your father's house for us?
And she said to him, I am the daughter of Bethuel, the son of Milcah, Nahor's wife.
And she said, We have a great store of dry grass and cattle-food, and there is room for you.
And with bent head the man gave worship to the Lord;
And said, Praise be to the Lord, the God of my master Abraham, who has given a sign that he is good and true to my master, by guiding me straight to the house of my master's family.
]]--

function FightRoleController:FMagicalEye(init)
  self:FResidual(init, 60);
  if init == true then 
    self:SetJump(self.nowPos.x, self.nowPos.y - 350, false);
    self.beh_Step = 1;
  elseif self.beh_Step == 1 then 
    if self.arrive == true then 
      local oriPos = Vector2.New(FightField.chip[self.colm][self.row].x, FightField.chip[self.colm][self.row].y);
      self:SetJump(oriPos.x, oriPos.y, false);
      self.beh_Step = 2;
    end
  elseif self.beh_Step == 2 then 
    if self.arrive == true then 
      self:SetBeh(EFightBeh.None);
      self:ResetPosition();
      self.beh_Step = 0;
    end
  end
end

function FightRoleController:FDivide(init, colm, row)
  if init == nil then 
    init = false;  
  end

  if colm == nil then 
    colm = 0;
  end

  if row == nil then 
    row = 0;
  end

  local constSpeed = 0.24;

  local disX, disY, halfDist;  --三個邊長度
  local slope;      --斜率
  local tempA, tempB;
  local center = Vector2.zero; --中心點

  if init then
    self.divColm = colm;
    self.divRow = row;

    self.beh_Step = 0;
    self.beh_Repeat = 0;

    for i=0, Dodge_MaxBehMed do    
      self.behMed[i] = Vector2.New(self.nowPos.x, self.nowPos.y);
    end
  end

  if (CGTimer.time - self.behOldTime) * 1000 >= (Time_Divide / FightField.timeScale) then  
    disX = FightField.chip[self.divColm][self.divRow].x - self.nowPos.x;
    disY = FightField.chip[self.divColm][self.divRow].y - self.nowPos.y;

    halfDist = bit.rshift((FightField.chip[self.divColm][self.divRow] - self.nowPos).magnitude, 1);
    slope = math.abs(disY/(disX+0.001));

    tempA = math.round((1/(math.sqrt(math.pow(slope, 2)+1))) * halfDist );
    tempB = math.round((slope/(math.sqrt(math.pow(slope, 2)+1))) * halfDist );

    if disX >=0 then
      center.x = self.nowPos.x + tempA
    else
      center.x = self.nowPos.x -tempA;
    end

    if disY>=0 then
      center.y = self.nowPos.y + tempB
    else
      center.y = self.nowPos.y - tempB;
    end

    if self.beh_Repeat == Repeat_Divide then
      self.beh_Repeat = 0;
      self.beh_Step = self.beh_Step + 1;      
    else
      self.beh_Repeat = self.beh_Repeat + 1;
    end

    if self.beh_Step < Step_Divide then      
      tempA = math.round((1/(math.sqrt(math.pow(slope, 2)+1))) * (halfDist / Step_Divide) * self.beh_Step );
      tempB = math.round((slope/(math.sqrt(math.pow(slope, 2)+1))) * (halfDist / Step_Divide) * self.beh_Step);
      if disX>=0 then          
        self.behMed[1].x = center.x + tempA;
        self.behMed[2].x = center.x - tempA;          
      else          
        self.behMed[1].x = center.x - tempA;      
        self.behMed[2].x = center.x + tempA;                      
      end

      if disY>=0 then
        self.behMed[1].y = center.y + tempB;
        self.behMed[2].y = center.y - tempB;          
      else
        self.behMed[1].y = center.y - tempB;
        self.behMed[2].y = center.y + tempB;                      
      end

      if self.beh_Step == 0 then
        self.beh_Step = 1;       
      end

    else
      self.beh_Step = 0;
      self:SetBeh(EFightBeh.None);
    end
    self.behOldTime = CGTimer.time;
  end
end

function FightRoleController.GuessNumberG8(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function FightRoleController.GuessNumberG9(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function FightRoleController.GuessNumberG10(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function FightRoleController.GuessNumberG11(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function FightRoleController:FResidual(first,  dist)
  if dist == nil then 
    dist = 30;
  end

  if first == nil then 
    first = false;
  end
    
  if first then
    for i=0, Dodge_MaxBehMed do    
      self.behMed[i] = Vector2.New(self.nowPos.x, self.nowPos.y);
    end
    self.behOldTime = CGTimer.time;      
  end

  if self.arrive then    
    if (CGTimer.time - self.behOldTime) * 1000 >  (Time_Residual / FightField.timeScale) then    
      self.behOldTime = CGTimer.time;      
      for i = Dodge_MaxBehMed, 1, -1 do
        self.behMed[i] = self.behMed[i-1];
      end
      self.behMed[0] = Vector2.New(self.nowPos.x, self.nowPos.y);
    end
    return true;
  end

  if (CGTimer.time - self.behOldTime) >= (0.05 / FightField.timeScale) then 
    self.behOldTime = CGTimer.time;
    local tempDist;
    if jumpStart then
      tempDist = (self.nowPos - Vector2.New(self.behMed[0].x, self.behMed[0].y - self.jumpHeight)).magnitude;
    else
      tempDist = (self.nowPos - self.behMed[0]).magnitude;
    end

    if tempDist >= dist then  
      for i = Dodge_MaxBehMed, 1, -1 do
        self.behMed[i] = self.behMed[i-1];
      end
      self.behMed[0] = Vector2.New(self.nowPos.x, self.nowPos.y);
    end  
  end
  return false;
end

function FightRoleController:FDead(initial)
  if initial then  
    if self.roleController.isDead ~= true then 
      self.roleController:SetIsDead(true) 
    end
    return;
  end

  if self.roleController.animationForceId  ~= 255 then
    self:ThrowTreasure();    --把自己目前所要掉出寶的,全部放出來
    
    self:SetStatus(EFightStatusKind.Seal, ESkill_Kind.Dis);
    self:SetStatus(EFightStatusKind.Vary, ESkill_Kind.Dis);
    self:SetStatus(EFightStatusKind.Faint, ESkill_Kind.Dis);
    self:SetStatus(EFightStatusKind.Spec, ESkill_Kind.Dis);
    self:SetStatus(EFightStatusKind.Strong, ESkill_Kind.Dis);
  end
end

function FightRoleController:FFlyOut(initial)
  local flyDist = 300; --飛昇的距離
  local dSpeed = 0.24;

  local dTime;
  local moveDist;
  -- 移動距離

  if initial then
    self.beh_Step = 0;
    self.beh_Repeat = 0;
    self.behOldTime = CGTimer.time;
    -- 0:為主體位置  1:為虛擬主體
    for i = 0, Dodge_MaxBehMed do
      self.behMed[i] = Vector2.New(self.nowPos.x, self.nowPos.y);
    end
    self.behMed[2] =  Vector2.New(128, self.behMed[2].y);
    self.roleController:SetIsDead(true);
--    //若是Player被打飛的話
--    if PicIdx=0 then
--      FCtrl.RevQueueIdle:=RevQueue_FlyOut;
  end
  if math.abs(self.behMed[0].y - self.behMed[1].y) >= flyDist then
    return;
  end
  -- 時間差
  dTime = math.round((CGTimer.time - self.behOldTime) * 1000) * FightField.timeScale;  
  moveDist = math.round(dTime * dSpeed);

  if moveDist >= flyDist then
    self.behMed[1] = Vector2(self.behMed[0].x, self.behMed[0].y - flyDist);
    self:CloseResShadow(1);
    self:ExitFight();
    return;
  else
    self.behMed[1] = Vector2(self.behMed[1].x, self.behMed[0].y - moveDist);
  end

  local alpha = 0;
  if self.kind == EHuman.Player or self.kind == EHuman.Players then 
    alpha = 35;
  else
    alpha = 128;
  end
  self:SetAlpha(alpha);
  self:ShowResShadow(1, Vector3.New(self.behMed[1].x, self.behMed[1].y, 0), alpha);

  if self.kind == EHuman.Player then
    MarkManager.StopNavigation();
  end
end

function FightRoleController.GuessNumberG12(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function FightRoleController.GuessNumberG13(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function FightRoleController:RCtoSpot(colm, row, spotKind, dist)
  if spotKind == nil then 
    spotKind = 0;
  end

  if dist == nil then 
    dist = 0;
  end

  local fixedW, fixedH, goal;    --移到下一個格子長和寬的x,y差值
  local faceDir;
  local x, y;

  fixedW = Vector2.zero;
  fixedW.x = math.round(dist * FieldSinSitaW);
  fixedW.y = math.round(dist * FieldCosSitaW);

  fixedH = Vector2.zero;
  fixedH.x = math.round(dist* FieldSinSitaH);
  fixedH.y = math.round(dist* FieldCosSitaH);

  if Contains(self.colm, 0, 1) then 
    faceDir = 2;    --面向右方Screen side
  elseif Contains(self.colm, 2, 3) then 
    faceDir = 1;    --面向左方Screen side
  else --預設使用 面向右方Screen side
    faceDir = 2;    
  end

  x = FightField.chip[colm][row].x;
  y = FightField.chip[colm][row].y;
  goal = Vector2.zero;
  if faceDir == 1 then  --面向左方Screen side          
    if spotKind == EFightSpot.None then --得原地位置
      goal = Vector2.New(x, y);            
    elseif spotKind == EFightSpot.Front then --人的前面            
      goal = Vector2.New(x - fixedW.x, y - fixedW.y);            
    elseif spotKind == EFightSpot.Back then --人的後面            
      goal = Vector2.New(x + fixedW.x, y + fixedW.y);   
    elseif spotKind == EFightSpot.Left then --人的左手邊            
      goal = Vector2.New(x - fixedH.x, y + fixedH.y);   
    elseif spotKind == EFightSpot.Right then --人的右手邊            
      goal = Vector2.New(x + fixedH.x, y - fixedH.y);   
    end
  elseif faceDir == 2 then  --面向右方Screen side
     if spotKind == EFightSpot.None then --得原地位置
      goal = Vector2.New(x, y);            
    elseif spotKind == EFightSpot.Front then --人的前面            
      goal = Vector2.New(x + fixedW.x, y + fixedW.y);            
    elseif spotKind == EFightSpot.Back then --人的後面            
      goal = Vector2.New(x - fixedW.x, y - fixedW.y);   
    elseif spotKind == EFightSpot.Left then --人的左手邊            
      goal = Vector2.New(x + fixedH.x, y - fixedH.y);   
    elseif spotKind == EFightSpot.Right then --人的右手邊            
      goal = Vector2.New(x - fixedH.x, y + fixedH.y);   
    end     
  end

  return goal;
end

function FightRoleController.GuessNumberG14(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function FightRoleController.GuessNumberG15(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function FightRoleController.GuessNumberG16(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function FightRoleController.GuessNumberG17(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function FightRoleController.GuessNumberG18(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function FightRoleController.GuessNumberG19(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function FightRoleController:GetSpotOfRc(aSpotKind, aDist)
  local fixedW, fixedH, goal;
  -- TPoint 移到下一個格子長和寬的x,y差值
  local x, y;

  fixedW = { }
  fixedW.x = math.round(aDist * FieldSinSitaW);
  fixedW.y = math.round(aDist * FieldCosSitaW);

  fixedH = { };
  fixedH.x = math.round(aDist * FieldSinSitaH);
  fixedH.y = math.round(aDist * FieldCosSitaH);

  local chipPos = self:GetChipPos();
  x = chipPos.x;
  y = chipPos.y;

  goal = {};
  if self.party_Kind == EFightParty.Right then
    if aSpotKind == EFightSpot.Front then
      goal.x = x - fixedW.x;
      goal.y = y - fixedW.y;
    elseif aSpotKind == EFightSpot.Back then
      goal.x = x + fixedW.x;
      goal.y = y + fixedW.y;
    elseif aSpotKind == EFightSpot.Left then
      goal.x = x - fixedH.x;
      goal.y = y + fixedH.y;
    elseif aSpotKind == EFightSpot.Right then
      goal.x = x + fixedH.x;
      goal.y = y - fixedH.y;
    end
  else
    if aSpotKind == EFightSpot.Front then
      goal.x = x + fixedW.x;
      goal.y = y + fixedW.y;
    elseif aSpotKind == EFightSpot.Back then
      goal.x = x - fixedW.x;
      goal.y = y - fixedW.y;
    elseif aSpotKind == EFightSpot.Left then
      goal.x = x + fixedH.x;
      goal.y = y - fixedH.y;
    elseif aSpotKind == EFightSpot.Right then
      goal.x = x - fixedH.x;
      goal.y = y + fixedH.y;
    end
  end
  return goal;
end

function FightRoleController:GetSpotOfTar(aTarX, aTarY, aDist)
  local fixedW, goal;
  local tempSinSitaW, tempCosSitaW;
  local slope;
  local dx = self.nowPos.x - aTarX;
  local dy = self.nowPos.y - aTarY;
  local aTotalDist = math.round(math.sqrt(math.pow(dx, 2) + math.pow(dy, 2)));
  if aDist > aTotalDist then
    aDist = aTotalDist;
  end

  slope = math.abs(dy/ (dx + 0.001));
  tempSinSitaW = 1 / math.sqrt(math.pow(slope, 2) + 1);
  tempCosSitaW = slope / math.sqrt(math.pow(slope, 2) + 1);
  fixedW = { }
  fixedW.x = math.round(aDist * tempSinSitaW);
  fixedW.y = math.round(aDist * tempCosSitaW);
  goal = {};
  if dx >= 0 then
    goal.x = self.nowPos.x - fixedW.x;
  else
    goal.x = self.nowPos.x + fixedW.x;
  end

  if dy >= 0 then
    goal.y = self.nowPos.y - fixedW.y;
  else
    goal.y = self.nowPos.y + fixedW.y;
  end

  return goal;
end

function FightRoleController:GetChipPos()
  if self.kind == EHuman.SoulWarrior  then
    --return FightField.SoulChip[self.colm][self.row];
    return Vector2.New(FightField.SoulChip[self.colm][self.row].x, FightField.SoulChip[self.colm][self.row].y);
  else
    --return FightField.chip[self.colm][self.row];
    return Vector2.New(FightField.chip[self.colm][self.row].x, FightField.chip[self.colm][self.row].y);
  end
end

function FightRoleController.GuessNumberG20(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function FightRoleController:GetMagicPos()
  local distH = 35;

  local fixedW, fixedH, goal;
  local aCount;
  -- 計數位置
  local dx, dy;

  --  if DBKind in [16] then  //16:銅礦
  --  begin
  --    result:=GetChipPos;
  --    exit;
  --  end
  fixedW = { }
  fixedW.x = math.round(FieldChipDistW * FieldSinSitaW);
  fixedW.y = math.round(FieldChipDistW * FieldCosSitaW);

  fixedH = { };
  fixedH.x = math.round(distH * FieldSinSitaH);
  fixedH.y = math.round(distH * FieldCosSitaH);

  aCount = 1;
  goal = Vector2.zero;

  repeat
    if aCount == 1 then
      dx = 0;
      dy = 0;
    else
      local t = aCount % 1;
      if t == 0 then
        -- 上
        dx =(bit.rshift(aCount, 1)) * fixedH.x;
        dy = -(bit.rshift(aCount, 1)) * fixedH.y;
      elseif t == 1 then
        -- 下
        dx = -(bit.rshift(aCount, 1)) * fixedH.x;
        dy =(bit.rshift(aCount, 1)) * fixedH.y;
      end
    end
    aCount = aCount + 1;
    if self.party_Kind == EFightParty.Right then
      goal.x = FightField.chip[2][2].x - fixedW.x + dx;
      goal.y = FightField.chip[2][2].y - fixedW.y + dy;
    elseif self.party_Kind == EFightParty.Left then
      goal.x = FightField.chip[1][2].x + fixedW.x + dx;
      goal.y = FightField.chip[1][2].y + fixedW.y + dy;
    end
  until (FightField.GetPosFHumIdx(goal.x, goal.y) == -1);

  return goal;
end

function FightRoleController:GetAttackPos(aSpotKind, aDist)
  local attackDist = 15;

  local fixedW, fixedH, goal;
  -- TPoint 移到下一個格子長和寬的x,y差值

  local faceDir;
  local aCount;
  -- 計數位置
  local dx, dy;
  
  fixedW = Vector2.zero;
  fixedW.x = math.round(aDist * FieldSinSitaW);
  fixedW.y = math.round(aDist * FieldCosSitaW);

  fixedH = { };
  fixedH.x = math.round(attackDist * FieldSinSitaH);
  fixedH.y = math.round(attackDist * FieldCosSitaH);

  if self.colm == 0 or self.colm == 1 then
    faceDir = 2;
    -- 面向右方Screen side
  elseif self.colm == 2 or self.colm == 3 then
    faceDir = 1;
    -- 面向左方Screen side
  end

  -- todo
  --  if DBKind in [16] then   //16:銅礦
  --    FaceDir:=2;
  --  end
  aCount = 1;
  goal = Vector2.zero;
  local pos = self.nowPos;
  repeat
    if aCount == 1 then
      dx = 0;
      dy = 0;
    else
      local t = aCount % 1;
      if t == 0 then
        -- 上
        dx = bit.rshift(aCount, 1) * fixedH.x;
        dy = -(bit.rshift(aCount, 1)) * fixedH.y;
      elseif t == 1 then
        -- 下
        dx = -(bit.rshift(aCount, 1)) * fixedH.x;
        dy = bit.rshift(aCount, 1) * fixedH.y;
      end
    end
    aCount = aCount + 1;

    if faceDir == 1 then
      -- 面向左方Screen side
      if aSpotKind == EFightSpot.Front then
        -- 人的前面
        goal.x = pos.x - fixedW.x + dx;
        goal.y = pos.y - fixedW.y + dy;
      elseif aSpotKind == EFightSpot.Back then
        -- 人的後面
        goal.x = pos.x + fixedW.x + dx;
        goal.y = pos.y + fixedW.y + dy;
      elseif aSpotKind == EFightSpot.Left then
        -- 人的左手邊
        goal.x = pos.x - fixedH.x + dx;
        goal.y = pos.y + fixedH.y + dy;
      elseif aSpotKind == EFightSpot.Right then
        -- 人的右手邊
        goal.x = pos.x + fixedH.x + dx;
        goal.y = pos.y - fixedH.y + dy;
      end
    elseif faceDir == 2 then
      -- 面向右方Screen side
      if aSpotKind == EFightSpot.Front then
        -- 人的前面
        goal.x = pos.x + fixedW.x + dx;
        goal.y = pos.y + fixedW.y + dy;
      elseif aSpotKind == EFightSpot.Back then
        -- 人的後面
        goal.x = pos.x - fixedW.x + dx;
        goal.y = pos.y - fixedW.y + dy;
      elseif aSpotKind == EFightSpot.Left then
        -- 人的左手邊
        goal.x = pos.x + fixedH.x + dx;
        goal.y = pos.y - fixedH.y + dy;
      elseif aSpotKind == EFightSpot.Right then
        -- 人的右手邊
        goal.x = pos.x - fixedH.x + dx;
        goal.y = pos.y + fixedH.y + dy;
      end
    end
  until (FightField.GetPosFHumIdx(goal.x, goal.y) == -1);

  return goal;
end

function FightRoleController:SetJump(x, y, isChanageDir)
  if isChanageDir == nil then
    isChanageDir = true;
  end

  if self.isTurtle then 
    return
  end

  self.action_Kind = EFightAction.Jump;
  if isChanageDir then
    self.roleController:FaceTo(Vector2.New(x, y))
  end
  self.moveOldTime = CGTimer.time;
  self.jumpStart = true;
  self.arrive = false;
  self.goal = Vector2.New(x, y);
  self.startPos = self.nowPos;

  self.totalDist = (self.goal - self.startPos).magnitude
  self.totalMoveTime = self.totalDist / (self.speed * 1000 * FightField.timeScale);

  if self.totalDist == 0 then
    self.jumpStart = false;
  end
end

function FightRoleController.GuessNumberG21(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function FightRoleController.GuessNumberG22(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function FightRoleController.GuessNumberG23(guessNumber)
  if LuaHelper.CheckDefine("DemoCode") then
    local DemoInsideForce = 0;
    local DemoGuessN = 0;
    
    if bit.band(guessNumber, DemoGuessN) == DemoGuessN then
      DemoInsideForce = true;
    else
      DemoInsideForce = false;
    end
    
    if DemoGuessN > 100 then
      DemoGuessN = DemoGuessN +1 ;
    else
      DemoGuessN = 0;
    end
    
    return DemoInsideForce;
  end
end

function FightRoleController:SetWalk(x, y, isChanageDir)
  -- 走向座標(X,Y)
  if isChanageDir == nil then
    isChanageDir = true
  end

  if self.isTurtle then 
    return
  end

  self.action_Kind = EFightAction.Walk;

  self.moveOldTime = CGTimer.time;
  self.arrive = false;
  self.goal = Vector2.New(x, y);

  self.totalDist = (self.goal - self.nowPos).magnitude
  self.totalMoveTime = self.totalDist / (self.speed * 1000 * FightField.timeScale);
  self.startPos = Vector2.New(self.nowPos.x, self.nowPos.y);

  if isChanageDir then
    self.roleController:FaceTo(self.goal);
  end
end

function FightRoleController:SetMoment(x, y, isChanageDir)      --瞬移座標(X,Y)
  if isChanageDir == nil then 
    isChanageDir = true;
  end

  if self.isTurtle then 
    return
  end  
  
  self.action_Kind = EFightAction.Moment;
  
  self.moveOldTime = CGTimer.time;
  self.goal = Vector2.New(x, y);
  self.nowPos = Vector2.New(x, y);

  if isChanageDir then
    self.roleController:FaceTo(self.goal);
  end
  self:SetPosition(self.nowPos);
end

function FightRoleController:SetSquelch(scaleY)    
  if scaleY < MaxSquelch then
    self.squelching = true;
    self.squelch = scaleY;
    self.roleController.shadowEnabled = false;
  else
    self.squelching = false;
    self.squelch = MaxSquelch;
    self:ResetSquelch();
  end
end

function FightRoleController:UpdateSquelch()
  local rectTrans = self.roleController.transform;
  if self.squelch == MaxSquelch then 
    rectTrans.pivot = Vector2.New(0.5, 0.5)
  else
    rectTrans.pivot = Vector2.New(0.5, 0.25)
  end
  rectTrans.localScale = Vector3.New(rectTrans.localScale.x, (self.squelch / MaxSquelch), rectTrans.localScale.z);
end

function FightRoleController:ResetSquelch()
  local rectTrans = self.roleController.transform;
  rectTrans.pivot = Vector2.New(0.5, 0.5);
  rectTrans.localScale = Vector3.New(rectTrans.localScale.x, 1, rectTrans.localScale.z);
  self.roleController.shadowEnabled = true;
end

function FightRoleController:UpdateShrink()
  local rectTrans = self.scaleRoot.transform;
  rectTrans.localScale = Vector3.New(self.shrink / DefShrink, self.shrink / DefShrink, rectTrans.localScale.z);
end

function FightRoleController:SetOverturn(isTurn)
  self.overturn = isTurn;
  local rectTrans = self.scaleRoot.transform;
  self:UpdateShrink();
  if self.overturn == false then 
    rectTrans.localPosition = Vector3.zero;    
  else    
    rectTrans.localPosition = Vector3.New(0, self.roleController.rawImage_Body.transform.localPosition.y * 2,0);
    rectTrans.localScale = Vector3.New(rectTrans.localScale.x, rectTrans.localScale.y * -1, rectTrans.localScale.z);    
  end
end

function FightRoleController:SetShrink(scale, extendMaxSize)
  local maxSize = MaxShrink;
  if extendMaxSize ~= nil then 
    maxSize = extendMaxSize;
  end
  local s = DefShrink;

  if scale <= MinShrink then 
    s = MinShrink;
  elseif scale >= maxSize then 
    s = maxSize;
  else
    s = scale;
  end

  self.shrink = s;

  self:UpdateShrink();
end

function FightRoleController:Update()
  if self.squelching then 
    self:UpdateSquelch();
  end
    
  local oriPos = Vector2.New(self.nowPos.x, self.nowPos.y);

  self:GetPosition();
  local tempPos = Vector2.New(self.nowPos.x, self.nowPos.y);

  if self.roleController:GetAttribute(EAttribute.Hp) <= 0 then 
    if self.beh_Kind ~= EFightBeh.Dead and self.beh_Kind ~= EFightBeh.FlyOut then 
      self:SetBeh(EFightBeh.Dead);
    else
      self:DoInBeh();  
    end
  else
    self:DoInBeh();      
  end

  if self.roleController == nil then  --防止在DoInbeh中離開戰鬥
    return;
  end
  self:UpdateJumpPos();
  self:PlantTrace();
  self:DivideTrace()
  self:UpdateResShadowTrace();
  self:DodgeTrace();    
  self:WhirelTrace();

  if oriPos ~= self.nowPos then
    self:SetPosition(self.nowPos)
  end
  self.nowPos = tempPos;
  self.roleController:UpdateShow(false, FightField.timeScale);

  for k, v in pairs(self.status) do
    if v ~= nil then 
      v:Update();
    end
  end

  for k, v in pairs(self.numberUp) do 
    if not v:Update() then 
      table.remove(self.numberUp, k);
    end
  end
end

function FightRoleController:DoInBeh()
  -- todo
  if self.beh_Kind == EFightBeh.Rotate then
    self:FRotate();
  elseif self.beh_Kind == EFightBeh.Quake then 
    self:FQuake(false);
  elseif self.beh_Kind == EFightBeh.Dodge then
    self:FDodge(false);
  elseif self.beh_Kind == EFightBeh.FlyOut then
    self:FFlyOut(false);
  elseif self.beh_Kind == EFightBeh.Residual then 
    self:FResidual(false);
  elseif self.beh_Kind == EFightBeh.MagicalEye then 
    self:FMagicalEye(false);
  elseif self.beh_Kind == EFightBeh.Divide then 
    self:FDivide(false);
  elseif self.beh_Kind == EFightBeh.Dead then
    self:FDead(false);
  end  
  --    Beh_Soul: FSoul;
end

function FightRoleController:UpdateJumpPos()
  local nowDist = 0
  -- 現在距離
  if self.isPlant then return; end   --種蒜中,不做進來

  if self.jumpStart == true then
    --if not self.roleController:GetAttribute(EAttribute.Seal) == EStatus.WhirlWind then
    nowDist =(self.goal - self.nowPos).magnitude;
    self.jumpHeight = math.round(360 *(0.5 - math.abs((nowDist /(self.totalDist + 0.001)) -0.5)));
    self.jumpHeight = math.round(self.jumpHeight - 0.003 * math.pow(self.jumpHeight, 2));
    self.nowPos = Vector2.New(self.nowPos.x, self.nowPos.y - self.jumpHeight);
      -- FantasY:=ShowY;
    --end
    if (self.beh_Kind == EFightBeh.Residual) then
      self.behMed[0].y = self.nowPos.y
    end
  end
end

function FightRoleController:PlantTrace()
  if self.isPlant == false then
    return 
  end

  self.nowPos.y = self.fantasY;
end

function FightRoleController:DivideTrace()
  if self.beh_Kind ~= EFightBeh.Divide then 
    return;
  end

  local idx  = self.beh_Repeat % 2  +1;
  
  self:ShowResShadow(idx, self.behMed[idx], 128);

  if idx == 1 then 
    idx = 2;
  else
    idx = 1;
  end
  self:CloseResShadow(idx);
end

function FightRoleController:UpdateResShadowTrace()
  if self.beh_Kind ~= EFightBeh.Residual and self.beh_Kind ~= EFightBeh.MagicalEye then 
    return;
  end

  local alphaStart = 240; --殘影Alpha起始值
  local alphaEnd;    --殘影Alpha結束值
  if self.beh_Kind == EFightBeh.Residual then 
    alphaEnd = 0;
  else
    alphaEnd = 10;
  end
  local alphaInteral = (alphaStart-alphaEnd) / Dodge_MaxBehMed;   --殘影衰減值

  local tempPos;
  local alpha;

  local tempPos = Vector2.New(self.nowPos.x, self.nowPos.y);
    
  local a;
  
  for k, v in pairs(self.resShadow) do      
    self:CloseResShadow(k);
  end    

  for i =0, Dodge_MaxBehMed do  
    if tempPos.y > self.behMed[Dodge_MaxBehMed].y then
      a = Dodge_MaxBehMed-i
    else
      a = i;
    end

    if a == 0 or self.behMed[a].x ~= self.behMed[0].x or self.behMed[a].y ~= self.behMed[0].y then 
      alpha = alphaStart - a * alphaInteral;      
      self:ShowResShadow(a, self.behMed[a], alpha);              
    end
  end
end

function FightRoleController:DodgeTrace()
  if self.beh_Kind ~= EFightBeh.Dodge then
    return 
  end

  local alphaStart = 240; --殘影Alpha起始值
  local alphaEnd = 0;     --殘影Alpha結束值
  local alphaInteral = (alphaStart-alphaEnd) /Dodge_MaxBehMed;   --殘影衰減值
  local resPos;
  local i, a, alpha;
  
  for i = 2, Dodge_MaxBehMed do  
     if self.behMed[1].y > self.behMed[Dodge_MaxBehMed].y then
        a = Dodge_MaxBehMed-i;
      else 
        a = i;
      end
    if (self.behMed[a].x ~= self.behMed[0].x) or (self.behMed[a].y ~= self.behMed[0].y) then      
      alpha = alphaStart - a * alphaInteral;

      resPos =Vector2.New(self.behMed[a].x, self.behMed[a].y);             

      if resPos ~= Vector2.zero then
        self:ShowResShadow(a, resPos, alpha)        
      end
    else
      self:CloseResShadow(a);      
    end
  end
    
  self.nowPos = Vector2.New(self.behMed[1].x, self.behMed[1].y);    
end

function FightRoleController:WhirelTrace()  
  if self.whirelStart == false then
    return;
  end

  local light = self:GetStatus(EFightStatusKind.Seal).lights[EEffectLightKind.Sky1];
  if light ~= nil then 
    self.nowPos.y = light.showPos.y    
  end
end

--[[
And Isaac answering said, But I have made him your master, and have given him all his brothers for servants; I have made him strong with grain and wine: what then am I to do for you, my son?
And Esau said to his father, Is that the only blessing you have, my father? give a blessing to me, even me! And Esau was overcome with weeping.
Then Isaac his father made answer and said to him, Far from the fertile places of the earth, and far from the dew of heaven on high will your living-place be:
By your sword will you get your living and you will be your brother's servant; but when your power is increased his yoke will be broken from off your neck.
So Esau was full of hate for Jacob because of his father's blessing; and he said in his heart, The days of weeping for my father are near; then I will put my brother Jacob to death.
Then Rebekah, hearing what Esau had said, sent for Jacob, her younger son, and said to him, It seems that your brother Esau is purposing to put you to death.
So now, my son, do what I say: go quickly to Haran, to my brother Laban;
And be there with him for a little time, till your brother's wrath is turned away;
Till the memory of what you have done to him is past and he is no longer angry: then I will send word for you to come back; are the two of you to be taken from me in one day?
Then Rebekah said to Isaac, My life is a weariness to me because of the daughters of Heth: if Jacob takes a wife from among the daughters of Heth, such as these, the women of this land, of what use will my life be to me?
--]]

function FightRoleController:SetSpeed(sp)
  self.speed = sp;
  self.totalMoveTime = self.totalDist / (self.speed * 1000 * FightField.timeScale);
end

function FightRoleController:GetPosition()
  if (self.nowPos.x == self.goal.x) and(self.nowPos.y == self.goal.y) then
    self.arrive = true;
    return;
  else
    self.arrive = false;
  end

  local nowTime = CGTimer.time - self.moveOldTime;
  local weight = nowTime / self.totalMoveTime;
             
  if (weight >= 1) then    
    self.nowPos.x = self.goal.x;
    self.nowPos.y = self.goal.y;
    self.arrive = true;
    self.jumpStart = false;
  else    
    self.arrive = false;    
    self.nowPos = Vector2.Lerp(self.startPos, self.goal, weight);
  end    
end

function FightRoleController:GetFightEffect(aColm, aRow)
  -- 取得打在別人身上的效果
  for k, v in pairs(self.effect) do
    if (v.dColm == aColm) and(v.dRow == aRow) then
      return v;
    end
  end
  return nil;
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

function FightRoleController:PlayEffect(aColm, aRow, aDefPose, aTotalCount)
  -- 播目標跳血
  if aTotalCount == nil then
    aTotalCount = 1;
  end
  -- 播放某Colm,Row攻擊後的結果,DefPose:預設Pose 為hit
  local i, idx;
  local aEffect;
  -- rFightEffEct;
  local target;
  -- TFightHum;   //目標者
--  log("PlayEffect")
--  log("aColm"  aColm)
--  log("aRow"  aRow)
  for i = table.Count(self.effect), 1, -1 do
    -- 攻方的攻擊記錄表(複數攻擊目標)
    aEffect = self.effect[i];
    -- Effect.items[i] List項次,server傳來的各行列的回合戰鬥結果
    if (aEffect.dColm == aColm) and(aEffect.dRow == aRow) then
      idx = FightField.GetFHumIdx(aColm, aRow);
      -- 找到被攻擊者的結果
      if idx ~= -1 and FightField.fightHum[idx] ~= nil then
        target = FightField.fightHum[idx];

        self:RunEffect(target, aEffect, aDefPose, aTotalCount);
        if aEffect.hitCount >= aTotalCount then
          -- 加 > 防錯
          aEffect = nil
          table.remove(self.effect, i);
        end
      else
        -- 例外處理
        aEffect = nil
        table.remove(self.effect, i);
      end
      break;
    end
  end
end

--被攻擊者的結果 
function FightRoleController:RunEffect(target, effct, aDefPose, aTotalCount)
  local aVal, i;
  local newPos = Vector2.zero;
  local aEffect = effct
  local alive =  target.roleController:GetAttribute(EAttribute.Hp) > 0; -- 當hp從大於0變成0才應該顯示訊息

  aEffect.hitCount = aEffect.hitCount + 1;
  
  -- MISS
  if Contains(aEffect.attack_Result, EAttackResult.Miss, EAttackResult.HeartEye) then
    -- 心眼
    if aEffect.attack_Result == EAttackResult.HeartEye then
      if target.beh_Kind ~= EFightBeh.MagicalEye then         
        target:SetBeh(EFightBeh.MagicalEye);
      end
    -- 逃走失敗
    elseif aEffect.skillID == 18002 then
      self:AddNumberUpDetail(string.Get(20328), EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y, target.nowPos.x, target.nowPos.y - 200)

    -- MISS
    else
      self:AddNumberUpDetail("Miss", EEffectLightTracer.Line, target.nowPos.x, target.nowPos.y, target.nowPos.x, target.nowPos.y - 200)
    end

  -- 命中
  elseif Contains(aEffect.attack_Result, EAttackResult.Hit, EAttackResult.Thounder) then
    for i = 1, aEffect.attr_Count do
      --log(string.Concat("Att Kind:", aEffect.attr_Kind[i]))

      if Contains(aEffect.attr_Kind[i], EAttribute.Seal, EAttribute.Vary, EAttribute.Faint, EAttribute.Spec, EAttribute.Strong, EAttribute.Passive) then 
        local statusKind = 0;
        if aEffect.attr_Kind[i] == EAttribute.Seal then 
          statusKind = EFightStatusKind.Seal;
        elseif aEffect.attr_Kind[i] == EAttribute.Faint then 
          statusKind = EFightStatusKind.Faint;
        elseif aEffect.attr_Kind[i] == EAttribute.Vary then 
          statusKind = EFightStatusKind.Vary;
        elseif aEffect.attr_Kind[i] == EAttribute.Spec then 
          statusKind = EFightStatusKind.Spec;
        elseif aEffect.attr_Kind[i] == EAttribute.Strong then 
          statusKind = EFightStatusKind.Strong;
        elseif aEffect.attr_Kind[i] == EAttribute.Passive then 
          statusKind = EFightStatusKind.Passive;
        end
        target:HandleStatus(statusKind, aEffect.skillID);
      -- 打幾下計數        總打幾下數
      else
        -- 打最後一下 //防扣錯值
        if aEffect.hitCount >= aTotalCount then
          aEffect.upValue[i] = aEffect.freeValue[i];
          aEffect.freeValue[i] = 0;

        -- 分批打    //防扣錯值
        elseif aEffect.hitCount < aTotalCount then
          aVal = aEffect.value[i] / aTotalCount;
          aVal = math.round(aVal * 0.8 + math.random(0, math.round(aVal * 0.4)));

          -- 誤差在20%之內
          if aEffect.freeValue[i] - aVal >= 0 then     
            aEffect.freeValue[i] = aEffect.freeValue[i] - aVal;
            aEffect.upValue[i] = aVal;

          -- 這次要跳的數值
          else
            aEffect.upValue[i] = aEffect.freeValue[i];
            aEffect.freeValue[i] = 0;
          end
        end
        
        if aEffect.skillID ~= 14055 then
          -- 天降神盾損血不扣玩家的血
          target:SetAttrEffect(aEffect.attr_Kind[i], aEffect.sign[i], aEffect.upValue[i]);
        end
      end
    end

    target:SetNumberUp(aEffect);
    -- 030725-1J 直線/曲線 跳血  
  end

  if target.roleController:GetAttribute(EAttribute.Hp) <= 0 then
  -- hp=0,設成躺姿
    if SceneManager.sceneId ~= 10991 then
    -- 團p不顯示
    -- todo 判斷
    -- Player.LifeScene_Kind=LifeScene_None then     //在生存不顯示
    -- RE_MigrantManageTools.IsArenaScene(Player.SceneNum)=False then //無界擂台場不顯示
    -- Player.SceneNum <> MR_Sky_SceneNum then       //仙豆擂台不顯示
      if alive then
      -- 自己被打死
        if (target.kind == EHuman.Players or target.kind == EHuman.Player) and target.id == Role.playerId and self.roleController.name ~= "" then
          local message = "";
          if self.id  == Role.playerId then --被buff打死
            message = string.Concat(string.Get(30166), string.Get(30170), string.Get(30167));
          else
            message = string.Concat(string.Get(30166), string.Get(30170), self.roleController.name, string.Get(30167));
          end

          Role.deadMsgData.playerMsg = message;

          Chat.AddMessage(EChannel.System, message, Role.playerId);
          ShowMarqueeMessage(message);

          MachineBox.Statistics(EMachineBoxStats.Death);
        end

        -- 自己的武將被打死
        if target.kind == EHuman.FollowNpc and target.masterID == Role.playerId and self.roleController.name ~= "" then
          local message = "";
          if self == target then  --武將被buff打死
            message = string.Concat(target.roleController.name, string.Get(30170), string.Get(30167));
          else
            message = string.Concat(target.roleController.name, string.Get(30170), self.roleController.name, string.Get(30167));
          end

          Role.deadMsgData.npcMsg = message;

          Chat.AddMessage(EChannel.System, message, Role.playerId);
          ShowMarqueeMessage(message);
        end
        
        target:SetBeh(EFightBeh.Dead);
      end
    end
  elseif aDefPose ~= nil then 
    -- 被攻擊者的姿勢
    if aEffect.beHitAct == 0 then
      -- 正常(挨 hit)
      if aDefPose == ERolePose.Prepare then 
        --不做動作
      else--elseif aDefPose == ERolePose.Hit then 
        target.roleController:Hit();
      end
      -- Hit();
    elseif aEffect.beHitAct == 1 then
      -- 擋
      target.roleController:Block();
    elseif aEffect.beHitAct == 2 then
      -- 閃
      if target.isPlant == false then       
        target:SetBeh(EFightBeh.Dodge);
      end          
    end

    local dis_Kind;
    -- 顯現 被攻擊者的狀態
    if FightField.attack[target.index] == nil then 
      FightField.attack[target.index] = Attack.New(target.index)
    end
    local varyKind = target:GetStatusKind(EFightStatusKind.Vary);
    if varyKind == EStatus.Avoid then --閃躲術      
      target:SetBeh(EFightBeh.Dodge);
    elseif varyKind == EStatus.Mirror then  --鏡            
      if target.party_Kind == EFightParty.Right then        
        newPos = Vector2.New(target.nowPos.x -20, target.nowPos.y +35);                   
        dis_Kind = EEffectLightDis.Ground;
      else
        newPos = Vector2.New(target.nowPos.x +15, target.nowPos.y +55);
        dis_Kind = EEffectLightDis.Sky;          
      end
      FightField.attack[target.index]:SetLightWithOrder(2, dis_Kind,10142,300,5,5,5, EEffectLightTracer.StandAni, newPos.x, newPos.y,255, true, 0);              
    elseif varyKind == EStatus.SoulMirror then --靈鏡     
      if target.party_Kind == EFightParty.Right then    
        newPos = Vector2.New(target.nowPos.x -30, target.nowPos.y +5);      
        dis_Kind = EEffectLightDis.Ground;          
      else        
        newPos = Vector2.New(target.nowPos.x +30, target.nowPos.y +30);      
        dis_Kind = EEffectLightDis.Sky;                    
      end
      FightField.attack[target.index]:SetLightWithOrder(2, dis_Kind,10284,40,16,16,16, EEffectLightTracer.StandAni, newPos.x, newPos.y,255, true, 0);        
    elseif varyKind == EStatus.FireAmulet then  -- 丹陽護體                
      newPos = Vector2.New(target.nowPos.x, target.nowPos.y + 30);
                  
      FightField.attack[target.index]:SetLightWithOrder(2,EEffectLightDis.Sky,10037,50,1,24,24,EEffectLightTracer.StandAni, newPos.x, newPos.y,30, true, 0);
      FightField.attack[target.index]:SetLightWithOrder(3,EEffectLightDis.Sky,10299,50,1,11,11,EEffectLightTracer.StandAni, newPos.x, newPos.y,30, true, 0);
    elseif Contains(varyKind, EStatus.TransferAttack, EStatus.DragonTransfer) then --斗轉星移
      newPos = Vector2.New(target.nowPos.x, target.nowPos.y + 30);     

      FightField.attack[target.index]:SetLightWithOrder(1,EEffectLightDis.Sky,10266,100,1,11,11,EEffectLightTracer.StandAni, newPos.x, newPos.y,30, true, 0);
    elseif varyKind == EStatus.DolphinGraud and skillDatas[aEffect.skillID].atkKind == 1 then --海豚守衛 只反擊戰士技
      newPos = Vector2.New(target.nowPos.x, target.nowPos.y + 30);     

      FightField.attack[target.index]:SetLightWithOrder(1,EEffectLightDis.Sky,10320,100,7,1,8,EEffectLightTracer.StandAni, newPos.x, newPos.y,30, true, 0);
    end
  end
end

function FightRoleController:HandleStatus(statusKind, skillId)
  --封印狀態
  if statusKind == EFightStatusKind.Seal then
    self:SealSkill(skillId);
  -- 變化狀態
  elseif statusKind == EFightStatusKind.Vary then
    self:VarySkill(skillId);
  -- 衰弱狀態
  elseif statusKind == EFightStatusKind.Faint then
    self:FaintSkill(skillId);
  -- 特殊狀態
  elseif statusKind == EFightStatusKind.Spec then
    self:SpecSkill(skillId);
  -- 強盛狀態
  elseif statusKind == EFightStatusKind.Strong then
    self:StrongSkill(skillId);
  --被動
  elseif statusKind == EFightStatusKind.Passive then
    self:PassiveSkill(skillId);
  end
end

function FightRoleController:SealSkill(skillId)
  local status = 0;
  local skill = ESkill_Kind.None;
  if Contains(skillId ,11014, 20026, 11027, 11039) then  --冰封, 三人冰封, 天迴冰舞, 專武冰封
    status = EStatus.IceBound;    
    skill = ESkill_Kind.IceBound;    
  elseif Contains(skillId, 10004, 20025, 20049) then  --樹精, 三人樹精 ,超級樹精
    status = EStatus.Clump;    
    skill = ESkill_Kind.Clump;    
  elseif Contains(skillId, 13002, 13015, 13016, 13017, 13018, 13046, 13050, 13052, 20027, 20048, 21042) then --旋風, 青龍, 三人旋風 ,超級旋風, 旋風卡, 無盡風暴,開派對囉, 諸葛狂龍咒
    status = EStatus.WhirlWind;    
    skill = ESkill_Kind.WhirlWind;    
  elseif Contains(skillId, 13007,20016,20020,13029, 23015, 23027,13041, 21033, 13044, 22041, 22043) then --暈擊,x,x,山嵐, 暈斬, 肉包衝鋒, 俺乃張翼德 憶母狂雷
    status = EStatus.DizzyAtk;    
    skill = ESkill_Kind.DizzyAtk;    
  elseif skillId == 10044 then --金鐘反制
    status = EStatus.EW_Counter;    
    skill = ESkill_Kind.EW_CounterDizzy;    
  elseif skillId == 14008 then --暈睡
    status = EStatus.Trance;    
    skill = ESkill_Kind.Trance;    
  elseif Contains(skillId, 14033,14036,14037,14042, 14099, 23005, 22004, 22018, 14064, 11041, 22032) then --震攝 、烈焰之光、袖裡箭、瞬詠穿心
    status = EStatus.ShakeTake;
    skill = ESkill_Kind.ShakeTake;        
  elseif Contains(skillId, 11028) then --霜雷拳
    status = EStatus.IceBound;    
    skill = ESkill_Kind.FreezePunch;    
  elseif skillId == 10033 then  --砂瀑擒
    status = EStatus.Clump;   
    skill = ESkill_Kind.GravelSeize;     
  elseif Contains(skillId, 22016, 22017) then  --瞳光之絆
    status = EStatus.IceBound; 
    skill = ESkill_Kind.SightCaptivity;           
  elseif Contains(skillId, 0,10009,10014,11012,11015,14007,11016, 11017, 11018, 11019,20015,20019,
      11025,11031,14056,20050, 10041, 11040, 11038, 20054) then --消除系 封印/變化的特技 水神 ,四人狀態解除
    status = EStatus.None;
    skill = ESkill_Kind.Dis;
  elseif skillId == 23028 then
    status = EStatus.Trance;
    skill = ESkill_Kind.EW_CounterTranceMe;
  elseif skillId == 22044 then  --冰晶守護(給冰封)
    status = EStatus.IceBound;
    skill = ESkill_Kind.IceCrystalsSeal;
  end
  self:SetStatusKind(EFightStatusKind.Seal, status);
  self:SetStatus(EFightStatusKind.Seal, skill);
end
--變化
function FightRoleController:VarySkill(skillId)  
  local status = 0;
  local skill = ESkill_Kind.None;
  if Contains(skillId, 10010, 10041) then --結界
    status = EStatus.Boundary;
    skill = ESkill_Kind.Boundary;
  elseif Contains(skillId, 11002, 11042) then --冰牆
    status = EStatus.IceWall;
    skill = ESkill_Kind.IceWall;    
  elseif Contains(skillId, 13005,13032, 13042, 13049) then  --隱身,隱分身,專武隱身, 棒棒
    status = EStatus.Limpid;
    skill = ESkill_Kind.Limpid;    
  elseif skillId == 13012 then --放大
    status = EStatus.Enlarge;
    skill = ESkill_Kind.Enlarge;    
  elseif skillId == 13003 then --閃躲
    status = EStatus.Avoid;
    skill = ESkill_Kind.Avoid;    
  elseif Contains(skillId, 10015, 10039) then --鏡, 專武鏡
    status = EStatus.Mirror;
    skill = ESkill_Kind.Mirror;    
  elseif Contains(skillId, 10026, 10040, 22024) then --靈鏡, 專武靈鏡, 太傅靈光鏡
    status = EStatus.SoulMirror;
    skill = ESkill_Kind.SoulMirror;    
  elseif skillId == 20005 then --福神附身
    status = EStatus.God;
    skill = ESkill_Kind.God;
  elseif skillId == 14012 then --同心
    status = EStatus.SameHeart;
  elseif skillId == 14013 then --鼓舞
    status = EStatus.Inspire;
  elseif skillId == 12024 then --丹陽護體
    status = EStatus.FireAmulet;
    skill = ESkill_Kind.FireAmulet;    
  elseif skillId == 13021 then  --斗轉星移
    status = EStatus.TransferAttack;
    skill = ESkill_Kind.TransferAttack;    
  elseif skillId == 13025 then  --無形無相
    status = EStatus.Invisible;
    skill = ESkill_Kind.Invisible;    
  elseif skillId == 10031 then  --金鐘罩
    status = EStatus.GoldShield;
    skill = ESkill_Kind.GoldShield;    
  elseif skillId == 10038 then  --2人鏡
    status = EStatus.Mirror;
    skill = ESkill_Kind.Mirror;    
  elseif skillId == 21037 then  --海豚守護
    status = EStatus.DolphinGraud;
    skill = ESkill_Kind.DolphinGraud;
  elseif skillId == 22031 then  --魔王領域
    status = EStatus.ImmunityShield;
    skill = ESkill_Kind.GroupImmunityShield;
  elseif skillId == 22044 then  --冰晶守護
    status = EStatus.IceCrystals;
    skill = ESkill_Kind.IceCrystalsShieldMe;
  elseif skillId == 13051 then --巴龍風障(反彈狀態)
    status = EStatus.DragonTransfer;
    skill = ESkill_Kind.DragonTransfer;
  elseif Contains(skillId, 0,10009,10014,11012,11015,11016, 11017, 11018, 11019,20015,20019,11025,11031,20050, 
    20054, 22011, 22012, 22013, 22014, 10041, 11040, 11038) then --消除系 封印/變化的特技     //解結界 解鏡 狀態解除 融冰
    status = EStatus.None;
    skill = ESkill_Kind.Dis;    
  end
  self:SetStatusKind(EFightStatusKind.Vary, status);
  self:SetStatus(EFightStatusKind.Vary, skill);
end

function FightRoleController:FaintSkill(skillId)
  local status = 0;
  local skill = ESkill_Kind.None;
  if Contains(skillId, 13011, 13040) then --縮小
    status = EStatus.Shrink;
    skill = ESkill_Kind.Shrink;    
  elseif Contains(skillId,14015,20023,21008, 20047, 23006, 23011,23012, 23013, 23014, 21032, 21039, 22042) then --施毒, 毒爪, 老薑
    status = EStatus.Poision;
    skill = ESkill_Kind.Poision;    
  elseif skillId == 14062 then --蝕魂詛咒
    status = EStatus.SoulCurse;
    skill = ESkill_Kind.SoulCurse;    
  elseif Contains(skillId, 11046, 14021, 20014,20020, 20055, 23009, 23007, 23022, 20051, 14065, 21041, 20058) then --混亂、迷惑毒針、真。迷惑毒針、九尾狐魅惑 霸王無雙斬、胖獸剁、專武混亂冰劍
    status = EStatus.Chaos;
    skill = ESkill_Kind.Chaos;    
  elseif skillId == 20004 then      --衰神附身
    status = EStatus.Poor;
    skill = ESkill_Kind.Poor;    
  elseif skillId == 14020 then      --內鬨
    status = EStatus.Traitor;    
  elseif Contains(skillId,10016, 10017, 10018, 10019, 11045, 14097, 21001, 21028, 23027) then  --岩神,震地槌,專武遲鈍冰劍
    status = EStatus.Tardy;
    skill = ESkill_Kind.Tardy;    
  elseif skillId == 14029 then  --大便
    status = EStatus.Stool1;
    skill = ESkill_Kind.Stool1;    
  elseif Contains(skillId, 10025)then  --土崩陣, 爆漿流沙
    status = EStatus.Landslip;
    skill = ESkill_Kind.Landslip;    
  elseif Contains(skillId, 12030,12031,12032,21014, 22021, 12016, 12017, 12018, 12019, 21035, 21043, 22026, 13048) then  --雷火召臨,陽炎,祝融焚野,火鐮,鳳凰,霸氣烈刃,一支一支
    status = EStatus.ThunderFire;
    skill = ESkill_Kind.ThunderFire;    
  elseif skillId == 23019 then  --萬毒穿心 Alen 20160303
    status = EStatus.ThunderFire;
    skill = ESkill_Kind.DarkFire;    
  elseif Contains(skillId, 13030, 12052) then  --式鬼吸魂, 專武式鬼吸魂
    status = EStatus.HealthDrawer;
    skill = ESkill_Kind.HealthDrawer;    
  elseif Contains(skillId, 11039, 13040, 14063, 14064, 14065) then --專武通用衰弱
    status = EStatus.EWCommonFaint;
    skill = ESkill_Kind.EWCommonFaint;
  elseif Contains(skillId,11039, 12046, 13040, 13041, 14063, 14064) then --專武通用衰弱
    status = EStatus.WeakPercent;
    skill = ESkill_Kind.EWCommonFaint;
  elseif Contains(skillId, 10042, 10045, 22030)  then --有客來, 仁巴無敵,雌雄流星斬
    status = EStatus.Taunt;
    skill = ESkill_Kind.Taunt;  
  elseif Contains(skillId, 0,11012,11015,14014,14022,11016, 11017, 11018, 11019,20015,20019,11025,11031,
    14056, 20050, 20054, 22005, 11040, 11038, 11040) then  --消除系 封印/變化的特技  光癒術
    status = EStatus.None;
    skill = ESkill_Kind.Dis;    
  end
  self:SetStatusKind(EFightStatusKind.Faint, status);
  self:SetStatus(EFightStatusKind.Faint, skill);
end

function FightRoleController.Prayer(mindless)
  if LuaHelper.CheckDefine("DemoCode") then
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      mindless = satan + haven;
    else
      mindless = satan - haven;
    end
  
    human = mindless;
  end
end

function FightRoleController:SpecSkill(skillId)
  local status = 0;
  local skill = ESkill_Kind.None;
  if skillId == 20006 then --護主
    status = EStatus.Protect;
    skill = ESkill_Kind.Protect;    
  elseif skillId == 20008 then --符咒
    status = EStatus.Spell;
    skill = ESkill_Kind.Spell;    
  elseif skillId == 14056 then 
    status = EStatus.MagicProtect;
    skill = ESkill_Kind.MagicProtect;    
  elseif Contains(skillId, 0,20007) then  --解護主
    status = EStatus.None;
    skill = ESkill_Kind.Dis;    
  end
  self:SetStatusKind(EFightStatusKind.Spec, status);
  self:SetStatus(EFightStatusKind.Spec, skill);
end

function FightRoleController:StrongSkill(skillId)
  --四人狀態解除	20015
  --六人狀態解除	20019
  --水神招喚      11016
  --召喚小中水	11017
  --招喚中水	11018
  --招喚大水	11019
  --進階狀解 	11025
  --解混亂       	14022
  --解毒		14014
  --解昏睡	14007
  --融冰		11015
  --狀態解除     	11012
  --解鏡		10014
  --解結界	10009
  local status = 0;
  local skill = ESkill_Kind.None;  
  if Contains(skillId, 11024, 11042) then --明鏡止水
    status = EStatus.BrightMirror;
    skill = ESkill_Kind.BrightMirror;    
  elseif skillId == 11032 then --冥河無想
    status = EStatus.WarStep;
    skill = ESkill_Kind.DarkMind;    
  elseif Contains(skillId, 12025, 12045) then  --狂熱戰魂
    status = EStatus.WildFightSoul;
    skill = ESkill_Kind.WildFightSoul;
  elseif skillId == 13020 then  --風之戰意
    status = EStatus.WildFightSoul;
    skill = ESkill_Kind.WindFaster;    
  elseif Contains(skillId, 14040, 23008) then  --霸意 妖術激化
    status = EStatus.AngryMind;
    skill = ESkill_Kind.AngryMind;    
  elseif skillId == 14044 then --天降神盾
    status = EStatus.MagicalShield;
    skill = ESkill_Kind.MagicalShield;    
  elseif skillId == 22006 then  --光之鏡
    status = EStatus.WarStep;
    skill = ESkill_Kind.LightShield;    
  elseif skillId == 14046 then  --凝氣護盾
    status = EStatus.WarStep;    
    skill = ESkill_Kind.AngerShield;    
  elseif skillId == 14053 then --聖靈暴衝
    status = EStatus.CrazySoul;    
    skill = ESkill_Kind.CrazySoul;    
  elseif skillId == 21026 then --仁者無敵
    status = EStatus.PitySoldier;
    skill = ESkill_Kind.PitySoldier;    
  elseif Contains(skillId, 10039, 10040, 13042) then --專武通用強化    
    if Contains(skillId, 10040, 10039)  then  --判斷不同隊不演出
      local playerIdx = FightField.GetPlayerIdx();
      if FightField.fightHum[playerIdx] == nil or self.party_Kind ~= FightField.fightHum[playerIdx].party_Kind then 
        return;
      end
    end
    status = EStatus.EWCommonFaint;
    skill = ESkill_Kind.EWCommonStrong;    
  elseif Contains(skillId, 0,11012,11016,11017,11018,11019,20015,20019,11025,11031,14056,20050, 20054, 11040, 11038) then --解
    status = EStatus.None;
    skill = ESkill_Kind.Dis;    
  end
  self:SetStatusKind(EFightStatusKind.Strong, status);
  self:SetStatus(EFightStatusKind.Strong, skill);
end

function FightRoleController:PassiveSkill(skillId)  
  local status = 0;
  local skill = ESkill_Kind.None;  
  if Contains(skillId, 14066, 14081) then --被動 知力
    status = EStatus.PassiveSkill;
    skill = ESkill_Kind.EW_Int;    
  elseif skillId == 14067 then --被動 攻擊
    status = EStatus.PassiveSkill;
    skill = ESkill_Kind.EW_Atk;   
  elseif skillId == 14068 then --被動防禦
    status = EStatus.PassiveSkill;
    skill = ESkill_Kind.EW_Def;     
  elseif skillId == 14069 then --被動 體質
    status = EStatus.PassiveSkill;
    skill = ESkill_Kind.EW_Hpx;     
  elseif skillId == 14070 then --被動能量
    status = EStatus.PassiveSkill;
    skill = ESkill_Kind.EW_Spx;     
  elseif skillId == 14071 then --被動敏捷
    status = EStatus.PassiveSkill;
    skill = ESkill_Kind.EW_Dex;     
  elseif skillId == 14072 then  --被動倍擊
    status = EStatus.PassiveSkill;
    skill = ESkill_Kind.EW_StrikeRate;     
  elseif skillId == 14073 then  --被動地屬
    status = EStatus.PassiveSkill;
    skill = ESkill_Kind.EW_Earth;     
  elseif skillId == 14074 then  --被動水屬
    status = EStatus.PassiveSkill;
    skill = ESkill_Kind.EW_Water;     
  elseif skillId == 14075 then  --被動火屬
    status = EStatus.PassiveSkill;
    skill = ESkill_Kind.EW_Fire;     
  elseif skillId == 14076 then  --被動風屬
    status = EStatus.PassiveSkill;
    skill = ESkill_Kind.EW_Wind;     
  elseif skillId == 14078 then  --隱忍不躁
    status = EStatus.PassiveGoldShield;
    skill = ESkill_Kind.PassiveGoldShield;     
  elseif skillId == 14079 then  --智變克敵
    status = EStatus.PassivePoisonShield;
    skill = ESkill_Kind.PoisonShield; 
  elseif Contains(skillId, 12051, 12057) then  --專武無視鏡
    status = EStatus.PassiveSkill;
    skill = ESkill_Kind.EW_MirrorIngore; 
  elseif skillId == 11043 then  --瀕死一閃
    status = EStatus.PassiveSkill;
    skill = ESkill_Kind.DodgeDead; 
  elseif skillId == 10044 then  --金鐘反制
    status = EStatus.PassiveSkill;
    skill = ESkill_Kind.EW_Counter;
  elseif skillId == 14083 then
    status = EStatus.PassiveSkill;
    skill = ESkill_Kind.EW_BaguaDex;
  elseif skillId == 23028 then--專武被動妖魂逆天
    status = EStatus.PassiveSkill;
    skill = ESkill_Kind.EW_CounterTrance;
  elseif skillId == 23029 then  --專武被動曜威奮武－指定狀態無視
    status = EStatus.Passive;
    skill = ESkill_Kind.EW_SpecifyStatusIngore;
  else
    status = EStatus.None;
    skill = ESkill_Kind.Dis;
  end  
  self:SetStatusKind(EFightStatusKind.Passive, status);
  self:SetStatus(EFightStatusKind.Passive, skill);
end

function FightRoleController:GetStatusKind(statusKind)
  return self.status_Kind[statusKind];
end

function FightRoleController.Prayer1(mindless)
  if LuaHelper.CheckDefine("DemoCode") then
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      mindless = satan + haven;
    else
      mindless = satan - haven;
    end
    
    human = mindless;
  end
end

function FightRoleController.Prayer2(mindless)
  if LuaHelper.CheckDefine("DemoCode") then
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      mindless = satan + haven;
    else
      mindless = satan - haven;
    end
    
    human = mindless;
  end
end

function FightRoleController:SetStatusKind(statusKind, kind)
  self.status_Kind[statusKind] = kind;
end

function FightRoleController:IsInSealStatus()
  return Between(self:GetStatusKind(EFightStatusKind.Seal) , 1, 100);
end

function FightRoleController.Prayer3(mindless)
  if LuaHelper.CheckDefine("DemoCode") then
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      mindless = satan + haven;
    else
      mindless = satan - haven;
    end
    
    human = mindless;
  end
end

function FightRoleController.Prayer4(mindless)
  if LuaHelper.CheckDefine("DemoCode") then
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      mindless = satan + haven;
    else
      mindless = satan - haven;
    end
    
    human = mindless;
  end
end


function FightRoleController.Prayer5(mindless)
  if LuaHelper.CheckDefine("DemoCode") then
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      mindless = satan + haven;
    else
      mindless = satan - haven;
    end
    
    human = mindless;
  end
end


-- 直線/曲線 跳血
function FightRoleController:SetNumberUp(aEffect)
--[[
  --戰鬥效果
  rFightEffect = packed record
    SkillID: Integer;           //用於Status上面
    DColm, DRow: Byte;          //對DColm目的行,DRow目的列
    Attack_Result: Byte;        //Attack_Result 施者結果(0:Miss 1:成功  2:天雷 3:心眼)
    BeHitAct: Byte;             //BeHitAct 被施者動作 (0:正常 1:擋 2:閃 3:不變)
    attr_Count: Byte;           //一共改變幾個屬性
    Attr_Kind:array[1  2] of Byte;            //Attr_Kind改變屬性種類 (Const Attr_xxx)
    Value:array[1  2] of Word;                //Value數值
    Sign:array[1  2] of Byte;                 //Value正負值 (0正 1負)
    FreeValue:array[1  2] of Word;            //還有多少數值可以扣
    UpValue:array[1  2] of  Word;             //這次跳出多少數值
    HitCount: Byte;             //己k了幾下
  end
]]--
  local newPos = Vector2.zero;
  local aTracer;  
  local aFontStyle;  --字體樣式 
  for i=1, aEffect.attr_Count do  
    if aEffect.sign[i] == 0 then --正
      newPos.x = self.nowPos.x;
      newPos.y = self.nowPos.y-200;
      aTracer = EEffectLightTracer.Line;
    elseif aEffect.sign[i] == 1 then --負      
      newPos = self:GetSpot(2 + (bit.lshift(math.random(0,1), 1)), 100+ math.random(0, 99));
      aTracer = EEffectLightTracer.Curve;
    end

  --===================== 依改變屬性決定字體樣式 92/7/10-1F ============
    if aEffect.attr_Kind[i] == EAttribute.Hp then 
      aFontStyle = 4;    --紅色大字
    elseif aEffect.attr_Kind[i] == EAttribute.Sp then 
      aFontStyle = 3;    --藍色大字
    else
      aFontStyle = 4;    --紅色大字
    end
  --====================================================================

    if aEffect.upValue[i] ~= 0 then --0,不跳血
      self:AddNumberUp(aEffect.upValue[i], aTracer, newPos.x, newPos.y, 0.24, aFontStyle);
    end
  end
end

--得到目標的前後左右位置
function FightRoleController:GetSpot(aSpotKind, aDist)
  local fixedW = Vector2.zero;
  local fixedH = Vector2.zero;
  local goal = Vector2.zero;  --移到下一個格子長和寬的x,y差值
  local aRj, faceDir;

  fixedW.x = math.round(aDist*FieldSinSitaW);
  fixedW.y = math.round(aDist*FieldCosSitaW);

  
  fixedH.x = math.round(aDist*FieldSinSitaH);
  fixedH.y = math.round(aDist*FieldCosSitaH);

  if Contains(self.roleController.direction, 0, 1, 2 ,3) then 
    faceDir = 1;
  else
    faceDir = 2;
  end

--  if DBKind in [16] then   //16:銅礦
--    FaceDir:=2;

  if faceDir == 1 then  --面向左方Screen side      
    if aSpotKind == EFightSpot.Front then --人的前面
      goal.x = self.nowPos.x - fixedW.x;
      goal.y = self.nowPos.y - fixedW.y;            
    elseif aSpotKind == EFightSpot.Back then  --人的後面            
      goal.x = self.nowPos.x + fixedW.x;
      goal.y = self.nowPos.y + fixedW.y;                                      
    elseif aSpotKind == EFightSpot.Left then  --人的左手邊
      goal.x = self.nowPos.x - fixedW.x;
      goal.y = self.nowPos.y + fixedW.y;                                  
    elseif aSpotKind == EFightSpot.Right then --人的右手邊            
      goal.x = self.nowPos.x + fixedW.x;
      goal.y = self.nowPos.y - fixedW.y;                                            
    end
  elseif faceDir == 2 then    
    if aSpotKind == EFightSpot.Front then --人的前面
      goal.x = self.nowPos.x + fixedW.x;
      goal.y = self.nowPos.y + fixedW.y;            
    elseif aSpotKind == EFightSpot.Back then  --人的後面            
      goal.x = self.nowPos.x - fixedW.x;
      goal.y = self.nowPos.y - fixedW.y;                                      
    elseif aSpotKind == EFightSpot.Left then  --人的左手邊
      goal.x = self.nowPos.x + fixedW.x;
      goal.y = self.nowPos.y - fixedW.y;                                  
    elseif aSpotKind == EFightSpot.Right then --人的右手邊            
      goal.x = self.nowPos.x - fixedW.x;
      goal.y = self.nowPos.y + fixedW.y;                                            
    end       
  end
  return goal;
end

function FightRoleController:AddEffect(aSkillID, aCount, attackData)
  local tempEff;
  -- rFightEffect;
  local i, j

  for i = 1, aCount do
    -- 複數攻擊對象
    local data = attackData[i];
    tempEff = FightEffect.New();
    tempEff.skillID = aSkillID;
    tempEff.dColm = data.dColm;
    tempEff.dRow = data.dRow;
    tempEff.attack_Result = data.attack_Result;
    tempEff.beHitAct = data.beHitAct;

    tempEff.hitCount = 0;

    tempEff.attr_Count = table.Count(data.attr);
    for j = 1, tempEff.attr_Count do
      -- 值會過大而error, 複數攻擊屬性
      tempEff.attr_Kind[j] = data.attr[j].kind;
      tempEff.value[j] = data.attr[j].value;
      tempEff.freeValue[j] = tempEff.value[j];
      tempEff.sign[j] = data.attr[j].sign;
    end

    table.insert(self.effect, tempEff);
  end
end

function FightRoleController.Prayer6(mindless)
  if LuaHelper.CheckDefine("DemoCode") then
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      mindless = satan + haven;
    else
      mindless = satan - haven;
    end
    
    human = mindless;
  end
end

function FightRoleController.Prayer7(mindless)
  if LuaHelper.CheckDefine("DemoCode") then
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      mindless = satan + haven;
    else
      mindless = satan - haven;
    end
    
    human = mindless;
  end
end

function FightRoleController:SetAttrEffect(aAttrKind, aSign, aValue)
  local gValue = aValue;
  if aSign == 1 then
    -- 負數
    gValue = - 1 * gValue;
  end
  local nowValue = self.roleController:GetAttribute(aAttrKind);
  local result = nowValue + gValue;

  if aAttrKind == EAttribute.Sp then  --上限檢查
    result = math.min(result, self.roleController:GetAttribute(EAttribute.MaxSp));
  elseif aAttrKind == EAttribute.Hp then 
    result = math.min(result, self.roleController:GetAttribute(EAttribute.MaxHp));
  end

  result = math.max(result, 0);
  self.roleController:SetAttribute(aAttrKind, result);
  self:UpdateUIInfo();
end

function FightRoleController:UpdateUIInfo()
  if self.kind == EHuman.SoulWarrior then
    --靈魂武將不顯示HUD
    self.roleController:UpdateHUDHpSp(false, false);
  else
    local playerIdx = FightField.GetPlayerIdx();
    if FightField.fightHum[playerIdx] ~= nil then
      self.roleController:UpdateHUDHpSp(true, self.party_Kind == FightField.fightHum[playerIdx].party_Kind);
    else
      self.roleController:UpdateHUDHpSp(true, false);
    end
  end

  if FightField.scoutVisible then
    FightField.UpdateScoutInfoSingle(self)
  end
end

function FightRoleController.Prayer8(mindless)
  if LuaHelper.CheckDefine("DemoCode") then
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      mindless = satan + haven;
    else
      mindless = satan - haven;
    end
    
    human = mindless;
  end
end

function FightRoleController.Prayer9(mindless)
  if LuaHelper.CheckDefine("DemoCode") then
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      mindless = satan + haven;
    else
      mindless = satan - haven;
    end
    
    human = mindless;
  end
end

function FightRoleController:CloseInfoUI()
  if LuaHelper.CheckDefine("DemoCode") then
    local meaningless = 45;
    local shift = 2;
    local result = 0;
    bit.rshift(meaningless, shift)
    bit.lshift(meaningless, shift)
    if bit.band(meaningless,45) == 45 then
      result = meaningless * shift;
    end
  
    local faith = 0;
    for i = 1, 3 do
      faith = faith + i;
    end
  
    if faith > 10 then
      faith = 10;
    else
      faith = faith + 10;
    end
  end
end

function FightRoleController:PlayerEffect(aTotalCount)
  if aTotalCount == nil then 
    aTotalCount = 1;
  end

  local i, idx, j;  
  local target; --//目標者

  --把所有的打鬥結果播放掉
  for k, v in pairs(self.effect) do      
    idx = FightField.GetFHumIdx(v.dColm, v.dRow);    
    --防止Server送錯Colm和Row
    if idx~=-1 and FightField.fightHum[idx] ~= nil then        
      target = FightField.fightHum[idx];
      if v.hitCount >= aTotalCount then  --防扣錯值,扣最後一次值          
        aTotalCount = v.hitCount + 1;
      end

      for j = v.hitCount, aTotalCount-1 do
        self:RunEffect(target, v, nil, aTotalCount);
      end
    else
      ShowCenterMessage(string.Get(23512), 5);
    end    
  end
  table.Clear(self.effect);
end

function FightRoleController:SetRoleController(role)
  if role == nil then
    return;
  end

  self.npcId = role.npcId;
  self.isTurtle = FightField.IsGiantBoss(self.npcId);

  self.roleController = role;

  self.roleController.event:ClearListener();
  self.roleController.event:SetListener(EventTriggerType.PointerClick, self.DoClick);
  self.roleController.event.parameter = self;
end

function FightRoleController:CheckSkillTargetLegal(target, skillId)
  --若使用技能的對象是自己或是隊友,則要檢查是否可以使用之
  if target.party_Kind == self.party_Kind then
    if Contains(skillDatas[skillId].fightWay, 1, 2, 3, 11, 15, 21) then
      ShowCenterMessage(string.Get(40033), 1.2);
      return false;
    end
  else  --不可對敵方施展,回復系特技
    if Contains(skillDatas[skillId].fightWay, 6, 7, 8, 14) then
      ShowCenterMessage(string.Get(60024), 1.2);
      return false;
    end
  end
  return true;
end

function FightRoleController.DoClick(event)
  local self;
  if event.parameter ~= nil then 
    self = event.parameter;   
  else
    self = event;
  end

  if FightField.conIdx == nil or FightField.conIdx == -1 then
    if FightManager.blnUseTout then
      return;
    end
  end

  local kind = 0;
  local useID = 0;
  FightField.idleCount = 0;
  FightField.focusIdx = self.index;
  if self.blnFirst == true then
    ShowCenterMessage(string.Get(40084), 2);
    return;
  end

  if FightField.fightHum[FightField.conIdx] == nil then 
    return 
  end

  local fightRole = FightField.fightHum[FightField.conIdx]; --發招者

  if fightRole.useSkID ~= 0 then
    useID = fightRole.useSkID;
    local humKind = fightRole.kind;
    if humKind == EHuman.Players then
      if fightRole.roleController:GetAttribute(EAttribute.Sp) < skillDatas[useID].requireSp then
        ShowCenterMessage(string.Get(40032), 1.2);
        return;
      end
      --因為分身的Hum_kind還是Hum_Player,所以暫代用法
      if useID == 14054 and fightRole.masterID ~= 0 then
        ShowCenterMessage(string.Get(40450), 1.2);
        return;
      end
    elseif humKind == EHuman.FollowNpc then
       if fightRole.roleController:GetAttribute(EAttribute.Sp) < skillDatas[useID].requireSp then
        ShowCenterMessage(string.Get(40032), 1.2);
        return;
      end
    elseif humKind == EHuman.Divide then    --分身者
      if useID == 14054 then
        ShowCenterMessage(string.Get(40450), 1.2);
        return;
      end
    end

    if Contains(useID, 13008, 14002, 20006) then
      if FightField.conIdx ~= self.index then
        ShowCenterMessage(string.Get(60030), 1.2);
        return;
      end
    elseif useID == 15002 then
      if Contains(self.npcId, 35029, 35030, 35031, 35032, 35033, 35034, 35054, 35055, 35056)  then
        ShowCenterMessage(string.Get(40398), 1.2);
        return;
      end
    end

    if not fightRole:CheckSkillTargetLegal(self, useID) then 
      return;
    end

    --生存戰鬥,逃和遁逃無效;
    if Contains(FightField.ffWar_Style, EFFWar_Style.LifePK, EFFWar_Style.WorldBoss) then
      if skillDatas[useID].fightWay == 12 then
       ShowCenterMessage(string.Get(40094), 1.2);
       return;
      end
    elseif Contains(FightField.ffWar_Style, EFFWar_Style.NewChaos5to5, EFFWar_Style.NewMix5to5, EFFWar_Style.NewChaos5to5_100LV) then  --新無界亂鬥 
      if Contains(useID, 10016, 11016, 12016, 13015, 22011, 23011) then
        ShowCenterMessage(string.Get(40094), 1.2);
        return;
      end
    end

    if useID == 15002 then 
      if self.kind == EHuman.Players or self.kind == EHuman.FollowNpc then --玩家 玩家武將不可捕捉
        ShowCenterMessage(string.Get(20130), 1.2);
        return;
      else
        if SceneManager.CheckLimit(SceneManager.sceneId, ESceneLimit.NoCatch) then --檢查場景是否可以捕捉
          ShowCenterMessage(string.Get(21778), 1.2);
          return;                            
        end

        if npcDatas[self.npcId].canBeCatch then  
          ShowCenterMessage(string.Get(20130), 1.2);
          return;
        end

        if npcDatas[self.npcId].level - fightRole.roleController:GetAttribute(EAttribute.Lv) > 5 then
          ShowCenterMessage(string.Get(71186), 1.2);
          return;
        end

        if Role.GetFollowNpc(Role.playerId, self.npcId) ~= nil then  --您的身上已經有相同的武將了
          ShowCenterMessage(string.Get(90016), 1.2);
          return;
        end

        if Inn.HaveNpc(self.npcId) then   --您的客棧裡已經有相同的武將了
          ShowCenterMessage(string.Get(90014), 1.2);
          return;
        end

        if npcDatas[self.npcId].kind == ENpc.Elephant and Role.player:GetSkillLv(14034) == 0 then
          ShowCenterMessage(string.Get(71185), 1.2);  --要學過騎乘術才可以抓象
          return;
        end

        if self:IsInSealStatus() then 
          ShowCenterMessage(string.Get(20130), 1.2);
          return;           
        end
      end
    end

    if useID ~= SK_HandFight and useID ~= 17001 and useID ~= 20500 then 
      if FightField.CheckMineral() and FightField.HaveHoe(FightField.conIdx) then 
        if skillDatas[useID].fightWay ~= 1 then
          ShowCenterMessage(string.Get(21595));
        end
      end
    end

    fightRole.blnChoose = true;  --030707-2J
    kind = 1  --使用特技
  elseif fightRole.useItemID ~= 0 then
    local itemID = fightRole.useItemID;
    
    if Contains(itemDatas[itemID].specialAbility, EItemUseKind.ItemUse_25, EItemUseKind.ItemUse_54, EItemUseKind.ItemUse_165) then       
      if Contains(FightField.ffWar_Style, EFFWar_Style.Chaos5to5, EFFWar_Style.Mix5to5, EFFWar_Style.NewChaos5to5, 
                                                                      EFFWar_Style.NewMix5to5, EFFWar_Style.NewChaos5to5_100LV) then 
        if FightField.pvpItemCount >= 3 then 
          ShowCenterMessage(string.Get(22969));
          return;
        end      
      end
    end

    if itemDatas[itemID].kind == 64 then    --BUFF
      if not self:GetCanUseBuffItem(itemDatas[itemID].specialAbility) then
        return;
      end
    end

    --符類
    if itemDatas[itemID].kind == 16 then
      if SceneManager.CheckLimit(SceneManager.sceneId, ESceneLimit.NoUseCharm) then
        ShowCenterMessage(string.Get(40138));
        return;
      end

      if not fightRole:CheckSkillTargetLegal(self, itemDatas[itemID].skillLink) then 
        return;
      end
       
      --[[
      //無界Server不可用符
      if RE_MigrantManageTools.IsGalaxyServer(ServerID) then
      begin
        AC_shortMsgForm.showMsg(string.Get(40138), 1200);   //該地禁止使用符
        exit;
      end

      //天雷符限定世界Boss戰用
      if fightRole.UseItemID = Item_Thunder then
      begin
        if (not (FightField.FFwar_Style in [FWS_WorldBoss])) or  //限定戰場
          (self.ID <> ItemData.Item[aItemIdx].Spare3) then      //限定對像
        begin
          AC_shortMsgForm.showMsg(string.Get(40468), 1200);   //'無法對該目標使用';
          exit;
        end
      end
      --]]

      --退敵符
      if itemID == 25084 then
        if City.GetCityId(SceneManager.sceneId) == 0 then
          ShowCenterMessage(string.Get(40265), 1.2);
          return;
        end

        if self.kind ~= EHuman.FollowNpc then
          ShowCenterMessage(string.Get(40468), 1.2);
          return;
        end

        if self.party_Kind == fightRole.party_Kind then
          ShowCenterMessage(string.Get(40468), 1.2);
          return;
        end
      end
    end

    if not self:GetCanUseHealThing(itemID) then
      ShowCenterMessage(string.Get(40468), 1.2);
      return;
    end

--    例外判斷
    if itemID == 25053 then
      if fightRole.kind ~= EHuman.Players and fightRole.kind ~= EHuman.Player then
        ShowCenterMessage(string.Get(60031), 1.2);
        return;
      end

      if self.index ~= FightField.conIdx then
        ShowCenterMessage(string.Get(60030), 1.2);
        return;
      end
    elseif itemID == 25085 then  --桃太郎飯糰
      if SceneManager.CheckLimit(SceneManager.sceneId, ESceneLimit.NoCatch) then --檢查場景是否可以捕捉
        ShowCenterMessage(string.Get(21778), 1.2);
        return;                            
      end

      if fightRole.kind ~= EHuman.Players and fightRole.kind ~= EHuman.Player then
        ShowCenterMessage(string.Get(60031), 1.2);
        return;
      end

      if npcDatas[self.npcId].level - fightRole.roleController:GetAttribute(EAttribute.Lv) > MR_CatchLv then
        ShowCenterMessage(string.Get(71186), 1.2);
        return;
      end

      if Contains(self.kind, EHuman.Players, EHuman.FollowNpc, EHuman.AutoFollow, EHuman.Divide) then
        ShowCenterMessage(string.Get(40398), 1.2);
        return;
      end

      if npcDatas[self.npcId].canBeCatch then
        ShowCenterMessage(string.Get(40398), 1.2);
        return;
      end

      if Role.GetFollowNpc(Role.playerId, self.npcId) ~= nil then  --您的身上已經有相同的武將了
        ShowCenterMessage(string.Get(90016), 1.2);
        return;
      end

      if Inn.HaveNpc(self.npcId) then   --您的客棧裡已經有相同的武將了
        ShowCenterMessage(string.Get(90014), 1.2);
        return;
      end

      if table.Count(Role.GetFollowNpcs(Role.playerId)) >= Role.maxFollowNpc then
        ShowCenterMessage(string.Get(20500), 1.2);
        return;
      end

      if npcDatas[self.npcId].kind == ENpc.Elephant and Role.player:GetSkillLv(14034) == 0 then
        ShowCenterMessage(string.Get(71185), 1.2);  --要學過騎乘術才可以抓象
        return;
      end

      if self:IsInSealStatus() then 
        ShowCenterMessage(string.Get(20130), 1.2);
        return;           
      end
--          if WF_CartManage.FindCartDataNpc(Self.ID)<>0 then
--          begin
--            AC_shortMsgForm.showMsg(string.Get(90015),1200);      //您的馬車裡已經有相同的武將了
--            exit;
--          end

--          if Player.FindEmptyFNpc=0 then   //跟隨Npc小於4個才抓得到
--          begin
--            AC_shortMsgForm.showMsg(string.Get(71184),1200);      //武將欄位已滿
--            exit;
--          end

--          if NpcData.GetKind(Self.ID)=22 then  //要學過騎乘術才可以抓象
--          if Player.FindIDSkill(14034) = 0 then
--          begin
--            AC_shortMsgForm.showMsg(string.Get(71185),1200);   //需先學過騎乘術才可以補抓象
--            exit;
--          end
      if self.npcId == 38022 then  -- 捕捉玉兔需要玉兔的狀態是放大而且玩家要大於等於10等
        if not Role.CheckPlayerLv(10) then
          ShowCenterMessage(string.Get(71186), 1.2);
          return;
        end

        if self:GetStatusKind(EFightStatusKind.Vary) ~= 107 then
          ShowCenterMessage(string.Get(40398), 1.2);
          return;
        end

        --define tw   //大陸版蔡文姬不能抓
--        elseif self.npcId == 14101  then
--          ShowCenterMessage(string.Get(40398), 1.2);
--          return;
      end
    end
      
    if fightRole.party_Kind ~= self.party_Kind then    --不可對敵方使用食物(17)、補品(18)、外掛功能(38)、復活(50)、修鍊物品(52)類
      if Contains(itemDatas[itemID].kind, 17, 18, 38, 50, 52) then
        ShowCenterMessage(string.Get(90070), 1200);
        return;
      end
    else
      if itemDatas[itemID].kind == 19 then    --不能對我方使用毒藥
        ShowCenterMessage(string.Get(40488), 1200);
        return;
      end
    end

    fightRole.blnChoose = true;  --030707-2J
    useID = itemID;
    kind = 2; --使用道具
  end

  if kind == 0 then
    return;
  end

  local checkByte = math.random(220);
  sendBuffer:Clear()
  sendBuffer:WriteByte(fightRole.colm);
  sendBuffer:WriteByte(fightRole.row);
  sendBuffer:WriteByte(self.colm);
  sendBuffer:WriteByte(self.row);
  sendBuffer:WriteUInt16(useID);
  sendBuffer:WriteByte(checkByte);
  sendBuffer:WriteByte(math.random(256));
  Network.Send(50, kind, sendBuffer);

  AudioManager.PlayOnce("AudioClip_WA0018",0);

  fightRole.useSkID = 0; --SK_HandFight;  
  fightRole.useItemID = 0;
  FightField.NextControlMan();
end

function FightRoleController.Prayer10(mindless)
  if LuaHelper.CheckDefine("DemoCode") then
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      mindless = satan + haven;
    else
      mindless = satan - haven;
    end
    
    human = mindless;
  end
end

function FightRoleController.Prayer11(mindless)
  if LuaHelper.CheckDefine("DemoCode") then
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      mindless = satan + haven;
    else
      mindless = satan - haven;
    end
    
    human = mindless;
  end
end

function FightRoleController.Prayer12(mindless)
  if LuaHelper.CheckDefine("DemoCode") then
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      mindless = satan + haven;
    else
      mindless = satan - haven;
    end
    
    human = mindless;
  end
end

function FightRoleController.Prayer13(mindless)
  if LuaHelper.CheckDefine("DemoCode") then
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      mindless = satan + haven;
    else
      mindless = satan - haven;
    end
    
    human = mindless;
  end
end

function FightRoleController:AddNumberUp(aText, aTracerStyle, aObjX, aObjY, aSpeed, aFontStyle)
  if aSpeed == nil then 
    aSpeed = 0.24;
  end

  if aFontStyle == nil then 
    aFontStyle = 4;
  end
  self:AddNumberUpDetail(aText, aTracerStyle, self.nowPos.x, self.nowPos.y - self.roleController.height / 2, aObjX, aObjY, aSpeed, aFontStyle);
end

function FightRoleController:AddNumberUpDetail(aText, aTracerStyle, scrX, scrY, aObjX, aObjY, aSpeed, aFontStyle)
  if aSpeed == nil then 
    aSpeed = 0.24;
  end

  if aFontStyle == nil then 
    aFontStyle = 4;
  end

  local delayTick = 0 ;

  if table.Count(self.numberUp) >0 then
    local num = self.numberUp[#self.numberUp];    
    if num.nowPos.y == scrY then
      delayTick = num.delayTick + Num_DelayTick;
    end
  end

  local number = FightNumber.New(aText, aTracerStyle, scrX, scrY, aObjX, aObjY, aSpeed, aFontStyle);
  number.delayTick = delayTick;  
  table.insert(self.numberUp, number);
end

function FightRoleController:SetStatus(kind, skillId)  
  if skillId == ESkill_Kind.None then 
    return 
  end

  if self.status[kind] == nil then 
    if skillId == ESkill_Kind.Dis then 
      return;
    else
      self.status[kind] = FightStatus.New(self.index, kind);
    end
  end

  self.status[kind]:SetKind(skillId);
end

function FightRoleController:GetStatus(kind)
  if self.status[kind] == nil then 
    self.status[kind] = FightStatus.New(self.index, kind);
  end

  return self.status[kind];
end

function FightRoleController.Prayer14(mindless)
  if LuaHelper.CheckDefine("DemoCode") then
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      mindless = satan + haven;
    else
      mindless = satan - haven;
    end
    
    human = mindless;
  end
end

function FightRoleController:PlaySound(aColm, aRow, aKind, aSoundKind)
  if aColm == nil then 
    aColm = 255;
  end

  if aRow == nil then
    aRow = 255;
  end

  if aKind == nil then
    aKind = Attack_Hit;
  end

  if aSoundKind == nil then
    aSoundKind = 1;
  end

  if aColm ~= 255 and aRow ~= 255 then
    local idx = FightField.GetFHumIdx(aColm, aRow);
    local aEffect = self:GetFightEffect(aColm, aRow);
    if aEffect ~= nil then
      if aEffect.beHitAct == 0 then            --正常(挨 hit)
        if aEffect.attack_Result == EAttackResult.Hit then
          if idx ~= -1 and FightField.fightHum[idx] ~= nil then
            if self:SkillAttackSound(aEffect.skillID, aKind, aSoundKind) then 
              return;
            end

            if Contains(FightField.fightHum[idx]:GetStatusKind(EFightStatusKind.Vary), EStatus.FireAmulet, EStatus.TransferAttack) then
              AudioManager.PlayOnce("AudioClip_WB0016");
              return;
            end
          end

          if aEffect.skillID == 10000 then     -- 肉搏
            if idx ~= -1 and FightField.fightHum[idx] ~= nil then
              local hp = FightField.fightHum[idx].roleController:GetAttribute(EAttribute.Hp);
              local maxHp = FightField.fightHum[idx].roleController:GetAttribute(EAttribute.MaxHp);
              local damage = aEffect.value[1];
              local wpKind = 0;
              if self.kind == EHuman.Players or self.kind ~= EHuman.Player then
                local itemSave = Item.GetBagItem(EThings.Equip, EItemFitType.Equip_Hand, 0);

                if itemSave ~= nil and itemDatas[itemSave.Id] ~= nil then
                  wpKind = itemDatas[itemSave.Id].kind;
                end
              elseif self.kind == EHuman.FollowNpc then
                local itemSave = Item.GetBagItem(EThings.Equip, EItemFitType.Equip_Hand, self.index);

                if itemSave ~= nil and itemDatas[itemSave.Id] ~= nil then
                  wpKind = itemDatas[itemSave.Id].kind;
                end
              else
                if npcDatas[self.npcId] ~= nil then
                  wpKind = npcDatas[self.npcId].weaponKind;
                end
              end
              self:HandFightSound(hp, maxHp, damage, wpKind);
            else
              AudioManager.PlayOnce("AudioClip_WB0011");
            end
          else
            self:SkillAttackSound(aEffect.skillID, aKind, aSoundKind);
          end
        else
          if aKind == Attack_Start then
            self:SkillAttackSound(aEffect.skillID, aKind, aSoundKind);
          else
            AudioManager.PlayOnce("AudioClip_WB0011");
          end
        end
      elseif aEffect.beHitAct == 1 then       --擋
        if idx ~= -1 and FightField.fightHum[idx] ~= nil then
          if  self:SkillAttackSound(aEffect.skillID, aKind, aSoundKind) == false then           
            if Contains(FightField.fightHum[idx]:GetStatusKind(EFightStatusKind.Vary), EStatus.Boundary, EStatus.Mirror) then
              AudioManager.PlayOnce("AudioClip_WB0014");
            else
              AudioManager.PlayOnce("AudioClip_WB0016");
            end
          end
        end
      elseif aEffect.beHitAct == 2 then       --閃
        if self:SkillAttackSound(aEffect.skillID, aKind, aSoundKind) == false then 
          AudioManager.PlayOnce("AudioClip_WB0019");
        end
      end
    end

    return;
  end

  AudioManager.PlayOnce("AudioClip_WB0011");        --通用攻擊音效
end

function FightRoleController:SkillAttackSound(id, aKind, aSoundKind)
  if id == 10005 then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WB0018");
    else
      AudioManager.PlayOnce("AudioClip_WB0011");
    end
  elseif id == 10013 then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WA0061");
    else
      AudioManager.PlayOnce("AudioClip_WB0011");
    end
  elseif Between(id, 10016, 10019) then
    AudioManager.PlayOnce("AudioClip_WA0066");
  elseif id == 10021 then
    AudioManager.PlayOnce("AudioClip_WB0003");
  elseif id == 10022  then
    if aSoundKind == 1 then
      AudioManager.PlayOnce("AudioClip_WB0020");
    elseif aSoundKind == 2 then
      AudioManager.PlayOnce("AudioClip_WB0009");
    end
  elseif id == 10023 then
    AudioManager.PlayOnce("AudioClip_WA0061");
  elseif Contains(id , 10024, 22043) then
    AudioManager.PlayOnce("AudioClip_WA0066");
  elseif Contains(id, 10025, 10043) then
    AudioManager.PlayOnce("AudioClip_WB0020");
  elseif Contains(id, 10026, 10040, 22024) then
    AudioManager.PlayOnce("AudioClip_WB0016");
  elseif id == 10028 then
    AudioManager.PlayOnce("AudioClip_WA0068");
  elseif Contains(id, 10029, 10030) then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WA0084");
    else
      AudioManager.PlayOnce("AudioClip_WA0066");
    end
  elseif id == 10031 then
    AudioManager.PlayOnce("AudioClip_WA0091");
  elseif id == 10032  then
    if aSoundKind == 1 then
      AudioManager.PlayOnce("AudioClip_WA0089");
    elseif aSoundKind == 2 then
      AudioManager.PlayOnce("AudioClip_WA0088");
    end
  elseif id == 10033 then
    AudioManager.PlayOnce("AudioClip_WB0020");
  elseif id == 10034 then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WA0065");
    else
      AudioManager.PlayOnce("AudioClip_WA0066");
    end
  elseif Between(id, 11016, 11019)  then
     AudioManager.PlayOnce("AudioClip_WA0069");
  elseif Contains(id, 22010, 11021, 11027, 14096, 22034, 22015) then
    if aSoundKind == 1 then
      AudioManager.PlayOnce("AudioClip_WA0072");
    elseif aSoundKind == 2 then
      AudioManager.PlayOnce("AudioClip_WB0002");
    end
  elseif id == 11022  then
    if aSoundKind == 1 then
      AudioManager.PlayOnce("AudioClip_WA0072");
    elseif aSoundKind == 2 then
      AudioManager.PlayOnce("AudioClip_WA0069");
    elseif aSoundKind == 3 then
      AudioManager.PlayOnce("AudioClip_WB0002");
    end
  elseif id == 11026 then
    AudioManager.PlayOnce("AudioClip_WA0070");
  elseif id == 11028  then
    if aSoundKind == 1 then
      AudioManager.PlayOnce("AudioClip_WA0060");
    elseif aSoundKind == 2 then
      AudioManager.PlayOnce("AudioClip_WA0072");
    end
  elseif Contains(id, 11029, 11030) then
      AudioManager.PlayOnce("AudioClip_WA0070");
  elseif Contains(id, 11031, 11032) then
      AudioManager.PlayOnce("AudioClip_WA0069");
  elseif id == 11033 then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WB0015");
    else
      AudioManager.PlayOnce("AudioClip_WB0003");
    end
  elseif id == 10042 then 
    AudioManager.PlayOnce("AudioClip_WA0079");
  elseif Contains(id, 11048, 12003, 22001, 23001, 23017, 23025) then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WB0008");
    else
      AudioManager.PlayOnce("AudioClip_WB0006");
    end
  elseif id == 12006 then
    AudioManager.PlayOnce("AudioClip_WB0010");
  elseif id == 12009 or id == 21031 then
    AudioManager.PlayOnce("AudioClip_WB0002");
  elseif Between(id, 12016, 12019)  then
    if aSoundKind == 1 then
      AudioManager.PlayOnce("AudioClip_WA0067");
    elseif aSoundKind == 2 then
      AudioManager.PlayOnce("AudioClip_WA0078");
    end
  elseif id == 12021 then
    AudioManager.PlayOnce("AudioClip_WB0002");
  elseif Contains(id, 12022, 12047,23002, 23021, 23026) then
    AudioManager.PlayOnce("AudioClip_WA0065");
  elseif Contains(id, 12023, 12048) then
    AudioManager.PlayOnce("AudioClip_WA0069");
  elseif id == 12024 then
    AudioManager.PlayOnce("AudioClip_WB0016");
  elseif id == Contains(12025, 12043) then
    AudioManager.PlayOnce("AudioClip_WA0036");
  elseif id == 12027 then
    if aSoundKind == 1 then
      AudioManager.PlayOnce("AudioClip_WB0009");
    elseif aSoundKind == 2 then
      AudioManager.PlayOnce("AudioClip_WB0010");
    elseif aSoundKind == 3 then
      AudioManager.PlayOnce("AudioClip_WB0011");
    end
  elseif Contains(id, 12028, 12029) then
    AudioManager.PlayOnce("AudioClip_WA0080");
  elseif id == 12030 then
    AudioManager.PlayOnce("AudioClip_WA0087");
  elseif id == 12031  then
    if aSoundKind == 1 then
      AudioManager.PlayOnce("AudioClip_WB0021");
    elseif aSoundKind == 2 then
      AudioManager.PlayOnce("AudioClip_WB0022");
    end
  elseif Contains(id, 12032, 23019, 21043)  then
    if aSoundKind == 1 then
      AudioManager.PlayOnce("AudioClip_WA0081");
    elseif aSoundKind == 2 then
      AudioManager.PlayOnce("AudioClip_WA0087");
    end
  elseif Contains(id, 12033, 12037)  then
    AudioManager.PlayOnce("AudioClip_WA0064");
  elseif id == 12034 then
    if aSoundKind == 1 then
      AudioManager.PlayOnce("AudioClip_51");
    elseif aSoundKind == 2 then
      AudioManager.PlayOnce("AudioClip_WA0081");
    end
  elseif Contains(id, 13001, 13002, 13004, 13006, 13009, 13046, 13052, 20027) then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WA0059");
    else
      AudioManager.PlayOnce("AudioClip_WB0011");
    end
  elseif Contains(id, 13013, 23003) then
    AudioManager.PlayOnce("AudioClip_WB0009");
  elseif Contains(id, 13015, 13016, 13017, 13018, 21042) then
    if aSoundKind == 1 then
      AudioManager.PlayOnce("AudioClip_WA0065");
    elseif aSoundKind == 2 then
      AudioManager.PlayOnce("AudioClip_WA0059");
    end
  elseif Contains(id, 13022, 13038, 13039) then
    if aSoundKind == 1 then
      AudioManager.PlayOnce("AudioClip_WA0059");
    elseif aSoundKind == 2 then
      AudioManager.PlayOnce("AudioClip_WB0012");
    end
  elseif id == 13023 then
    AudioManager.PlayOnce("AudioClip_WA0059");
  elseif id == 13024 then
    if aSoundKind == 1 then
      AudioManager.PlayOnce("AudioClip_WB0015");
    elseif aSoundKind == 2 then
      AudioManager.PlayOnce("AudioClip_WB0002");
    end
  elseif id == 13026 then
    if aSoundKind == 1 then
      AudioManager.PlayOnce("AudioClip_WB0015");
    elseif aSoundKind == 2 then
      AudioManager.PlayOnce("AudioClip_WB0003");
    end
  elseif id == 13027 then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WA0059");
    else
      AudioManager.PlayOnce("AudioClip_WB0012");
    end
  elseif id == 13028 then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WB0007");
    else
      AudioManager.PlayOnce("AudioClip_WB0002");
    end
  elseif Contains(id, 23015, 13029, 23027) then
    AudioManager.PlayOnce("AudioClip_WB0021");
  elseif Contains(id, 13030, 12052) then    
    AudioManager.PlayOnce("AudioClip_WA0051");
  elseif id == 13031 then
    if aSoundKind == 1 then
      AudioManager.PlayOnce("AudioClip_WA0087");
    elseif aSoundKind == 2 then
      AudioManager.PlayOnce("AudioClip_WB0012");
    end
  elseif Contains(id, 13033, 13043, 11044, 12050) then
    AudioManager.PlayOnce("AudioClip_WB0002");
  elseif id == 13044 then 
    AudioManager.PlayOnce("AudioClip_WB0012");
  elseif Contains(id, 14006, 23004, 23018) then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WA0064");
    else
      AudioManager.PlayOnce("AudioClip_WB0011");
    end
  elseif Contains(id, 14033, 22032) then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WA0078");
    else
      AudioManager.PlayOnce("AudioClip_WA0076");
    end
  elseif Contains(id, 14036, 14064) then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WA0076");
    else
      AudioManager.PlayOnce("AudioClip_WA0077");
    end
  elseif Contains(id, 14040, 23008) then
    AudioManager.PlayOnce("AudioClip_WA0069");
  elseif Contains(id, 14042, 12041, 12042, 14099) then
    AudioManager.PlayOnce("AudioClip_WA0069");
  elseif id == 20011 then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WB0008");
    else
      AudioManager.PlayOnce("AudioClip_WB0006");
    end
  elseif id == 20012 then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WB0018");
    else
      AudioManager.PlayOnce("AudioClip_WB0011");
    end
  elseif id == 20029  then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WA0069");
    else
      if aSoundKind == 1 then
        AudioManager.PlayOnce("AudioClip_WA0064");
      elseif aSoundKind == 2 then
        AudioManager.PlayOnce("AudioClip_WB0023");
      end
    end
  elseif id == 20045  then
    if aKind == Attack_Start then
      if aSoundKind == 1 then
        AudioManager.PlayOnce("AudioClip_WB0023");
      elseif aSoundKind == 2 then
        AudioManager.PlayOnce("AudioClip_WA0066");
      end
    else
      AudioManager.PlayOnce("AudioClip_WB0020");
    end
  elseif id == 20056 then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WB0023");
    elseif aKind == Attack_Hit then
      AudioManager.PlayOnce("AudioClip_WA0080");
    end
  elseif id == 20057 then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WA0068");
    elseif aKind == Attack_Hit then
      AudioManager.PlayOnce("AudioClip_WB0011");
    end
  elseif id == 20058 then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WA0073");
    elseif aKind == Attack_Hit then
      AudioManager.PlayOnce("AudioClip_WB0011");
    end
  elseif id == 21009 then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WB0023");
    else
      AudioManager.PlayOnce("AudioClip_WB0020");
    end
  elseif id == 21010 then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WA0064");
    else
      AudioManager.PlayOnce("AudioClip_WB0009");
    end
  elseif id == 21011 then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WA0067");
    else
      AudioManager.PlayOnce("AudioClip_WA0081");
    end
  elseif id == 21012 then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WB0015");
    else
      AudioManager.PlayOnce("AudioClip_WB0003");
    end
  elseif id == 21013 then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WA0065");
    else
      AudioManager.PlayOnce("AudioClip_WB0005");
    end
  elseif Contains(id, 21014, 21035) then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WA0059");
    else
      AudioManager.PlayOnce("AudioClip_WB0005");
    end
  elseif id == 21017 then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WB0019");
    else
      AudioManager.PlayOnce("AudioClip_WB0020");
    end
  elseif id == 21018 then
    if aSoundKind == 1 then
      AudioManager.PlayOnce("AudioClip_WB0023");
    elseif aSoundKind == 2 then
      AudioManager.PlayOnce("AudioClip_WB0002");
    elseif aSoundKind == 3 then
      AudioManager.PlayOnce("AudioClip_WB0003");
    end
  elseif id == 21020 then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WB0023");
    else
      AudioManager.PlayOnce("AudioClip_WB0003");
    end
  elseif id == 21021 then
    if aKind == Attack_Hit then
      AudioManager.PlayOnce("AudioClip_WA0072");
    end
  elseif id == 21022 then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WA0081");
    elseif aKind == Attack_Hit then
      AudioManager.PlayOnce("AudioClip_WA0080");
    end
  elseif id == 21023 then
    if aKind == Attack_Start then
      if aSoundKind == 1 then
        AudioManager.PlayOnce("AudioClip_WA0060");
      elseif aSoundKind == 2 then
        AudioManager.PlayOnce("AudioClip_WA0059");
      elseif aSoundKind == 3 then
        AudioManager.PlayOnce("AudioClip_WA0087");
      end
    elseif aKind == Attack_Hit then
      AudioManager.PlayOnce("AudioClip_WA0080");
    end
  elseif Contains(id, 21024, 21038) then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WB0005");
    elseif aKind == Attack_Hit then
      AudioManager.PlayOnce("AudioClip_WA0073");
    end
  elseif id == 21025 then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WA0064");
    elseif aKind == Attack_Hit then
      if aSoundKind == 1 then
        AudioManager.PlayOnce("AudioClip_WA0069");
      elseif aSoundKind == 2 then
        AudioManager.PlayOnce("AudioClip_WB0005");
      elseif aSoundKind == 3 then
        AudioManager.PlayOnce("AudioClip_WB020");
      elseif aSoundKind == 4 then
        AudioManager.PlayOnce("AudioClip_WA0090");
      end
    end
  elseif id == 21026 then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WA0064");
    else
      if aSoundKind == 1 then
        AudioManager.PlayOnce("AudioClip_WA0071");
      end
    end
  elseif id == 21027 then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WA0079");
    else
      if aSoundKind == 1 then
        AudioManager.PlayOnce("AudioClip_WB0017");
        AudioManager.PlayOnce("AudioClip_WB0018");
        AudioManager.PlayOnce("AudioClip_WB0019");
      elseif aSoundKind == 2 then
        AudioManager.PlayOnce("AudioClip_WB0002");
      elseif aSoundKind == 3 then
        AudioManager.PlayOnce("AudioClip_WB0003");
      elseif aSoundKind == 4 then
        AudioManager.PlayOnce("AudioClip_WB0007");
      elseif aSoundKind == 5 then
        AudioManager.PlayOnce("AudioClip_WB0016");
      elseif aSoundKind == 6 then
        AudioManager.PlayOnce("AudioClip_WB0015");
      elseif aSoundKind == 7 then
        AudioManager.PlayOnce("AudioClip_WA0080");
      elseif aSoundKind == 8 then
        AudioManager.PlayOnce("AudioClip_WA0069");
      end
    end
  elseif id == 21028 then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WA0064");
    else
      if aSoundKind == 1 then
        AudioManager.PlayOnce("AudioClip_WA0071");
      elseif aSoundKind == 2 then
        AudioManager.PlayOnce("AudioClip_WA0073");
      end
    end
  elseif Contains(id, 21029, 21030, 23023) then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WA0070");
    else
      if aSoundKind == 1 then
        AudioManager.PlayOnce("AudioClip_WB0023");
      end
    end
  elseif Between(id, 22011, 22014) then
    if aSoundKind == 1 then
      AudioManager.PlayOnce("AudioClip_WE0001");
    elseif aSoundKind == 2 then
      AudioManager.PlayOnce("AudioClip_WE0002");
    end
  elseif Between(id, 23011, 23014) then
    if aSoundKind == 1 then
      AudioManager.PlayOnce("AudioClip_WE0003");
    elseif aSoundKind == 2 then
      AudioManager.PlayOnce("AudioClip_WE0004");
    end
  elseif id == 21032 then 
    if aKind == 1 then 
      AudioManager.PlayOnce("AudioClip_WA0068");
    elseif aKind == 2 then       
      AudioManager.PlayOnce("AudioClip_WB0019");
    else
      AudioManager.PlayOnce("AudioClip_WB0020");
    end
  elseif id == 21036 then 
    if aSoundKind == 1 then 
      AudioManager.PlayOnce("AudioClip_WA0069");
    elseif aSoundKind == 2 then 
      AudioManager.PlayOnce("AudioClip_WA0066");
    end
  elseif id == 21037 then 
    AudioManager.PlayOnce("AudioClip_WA0086");
  elseif id == 21040 then 
    if aSoundKind == 1 then
      AudioManager.PlayOnce("AudioClip_WA0079");
    elseif aSoundKind == 2 then
      AudioManager.PlayOnce("AudioClip_WA0088");
    end
  elseif id == 21039 then 
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WA0066");
    else
      AudioManager.PlayOnce("AudioClip_WA0048");
    end
  elseif id == 21041 then 
    if aKind == Attack_Start then 
      AudioManager.PlayOnce("AudioClip_WA0081");
    elseif aKind == Attack_Hit then 
      AudioManager.PlayOnce("AudioClip_WA0080");
    else
      AudioManager.PlayOnce("AudioClip_WB0024");
    end
  elseif id == 20052 then 
    AudioManager.PlayOnce("AudioClip_WB0020");
  elseif id == 20053 then 
    AudioManager.PlayOnce("AudioClip_WA0087");
  elseif id == 14062 then 
    AudioManager.PlayOnce("AudioClip_WA0069");
  elseif id == 22025 then
    if aKind == Attack_Start then
      AudioManager.PlayOnce("AudioClip_WB0015");
    else
      AudioManager.PlayOnce("AudioClip_WB0011");
    end
  else
    return false;
  end 
  return true;
end

function FightRoleController.Prayer15(mindless)
  if LuaHelper.CheckDefine("DemoCode") then
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      mindless = satan + haven;
    else
      mindless = satan - haven;
    end
    
    human = mindless;
  end
end

function FightRoleController.Prayer16(mindless)
  if LuaHelper.CheckDefine("DemoCode") then
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      mindless = satan + haven;
    else
      mindless = satan - haven;
    end
    
    human = mindless;
  end
end

function FightRoleController:HandFightSound(aHP, aMaxHP, aValue, aWeaponKind)
  if Between(aWeaponKind, 1, 6) then
    if aValue >= aMaxHP then
      AudioManager.PlayOnce("AudioClip_WB0005");
      return;
    end
  elseif aWeaponKind == 7 then
    AudioManager.PlayOnce("AudioClip_WA0077");
    return;
  end

  if aValue >= aHP then
    AudioManager.PlayOnce("AudioClip_WB0010");
    return;
  end
  
  if aValue <= aMaxHP / 2 then
    AudioManager.PlayOnce("AudioClip_WB0011");
  else
    AudioManager.PlayOnce("AudioClip_WB0009");
  end
end

function FightRoleController:GetCatchStep(bodyStyle)
  if Between(bodyStyle, 35, 40) or Contains(bodyStyle, 95, 96, 102, 118, 127, 128, 129, 131) then
    return 0;
  elseif Between(bodyStyle, 91, 94) then
    return 1;
  else
    return 3;
  end
end

function FightRoleController:GetCatchDeltaXY(bodyStyle)
  local deltaX = 10;
  local deltaY = -5;

  if bodyStyle == 10 then
    deltaX = -15;
  elseif Contains(bodyStyle, 35, 36, 39, 40, 95, 96, 102, 124, 127, 128, 129) then
    deltaX = 0;
    deltaY = -20;
  elseif Contains(bodyStyle, 37, 38, 131) then
    deltaX = 5;
    deltaY = -20;
  elseif Contains(bodyStyle, 132, 133) then
    deltaX = -10;
    deltaY = -20;
  end  

  return deltaX, deltaY;
end

function FightRoleController:GetCanUseBuffItem(buffKind)
  if buffKind == EFightBuff.Def then
    --不可對敵方使用
    if FightField.fightHum[FightField.conIdx].party_Kind ~= self.party_Kind then
      ShowCenterMessage(string.Get(90070), 1.2);
      return false;
    end
  elseif buffKind == EFightBuff.Atk then
    --不可對敵方使用
    if FightField.fightHum[FightField.conIdx].party_Kind ~= self.party_Kind then
      ShowCenterMessage(string.Get(90070), 1.2);
      return false;
    end
  elseif buffKind == EFightBuff.Int then
    --不可對敵方使用
    if FightField.fightHum[FightField.conIdx].party_Kind ~= self.party_Kind then
      ShowCenterMessage(string.Get(90070), 1.2);
      return false;
    end
  elseif buffKind == EFightBuff.Eff then
    --不可對敵方使用
    if FightField.fightHum[FightField.conIdx].party_Kind ~= self.party_Kind then
      ShowCenterMessage(string.Get(90070), 1.2);
      return false;
    end
  elseif buffKind == EFightBuff.Imm then
    --不可對敵方使用
    if FightField.fightHum[FightField.conIdx].party_Kind ~= self.party_Kind then
      ShowCenterMessage(string.Get(90070), 1.2);
      return false;
    end
  elseif buffKind == EFightBuff.Cur then
    --不可對敵方使用
    if FightField.fightHum[FightField.conIdx].party_Kind ~= self.party_Kind then
      ShowCenterMessage(string.Get(40033), 1.2);
      return false;
    end
  end

  return true;
end

function FightRoleController:GetCanUseHealThing(itemID)
  if itemDatas[itemID] == nil then 
    return false;
  end

  --修補木頭類63才能修20城牆, 28攻城器械  
  if self.kind == EHuman.Divide then 
    return false;
  end

  if not Contains(self.kind, EHuman.Player, EHuman.Players) then
    if itemDatas[itemID] == 63 then
      if Contains(npcDatas[self.npcId].kind, 20, 28) then
        if not Between(self.npcId, 3708, 37015) then
          return true;
        end
      end
      
      return false;
    else
      if not Contains(npcDatas[self.npcId].kind, 20, 28) then
        return true;
      end
    end
  end

  return true;
end

--[[
Now Abraham was old and far on in years: and the Lord had given him everything in full measure.
And Abraham said to his chief servant, the manager of all his property, Come now, put your hand under my leg:
And take an oath by the Lord, the God of heaven and the God of the earth, that you will not get a wife for my son Isaac from the daughters of the Canaanites among whom I am living;
But that you will go into my country and to my relations and get a wife there for my son Isaac.
And the servant said, If by chance the woman will not come with me into this land, am I to take your son back again to the land from which you came?
And Abraham said, Take care that you do not let my son go back to that land.
The Lord God of heaven, who took me from my father's house and from the land of my birth, and made an oath to me, saying, To your seed I will give this land: he will send his angel before you and give you a wife for my son in that land.
And if the woman will not come with you, then you are free from this oath; only do not take my son back there.
And the servant put his hand under Abraham's leg, and gave him his oath about this thing.
And the servant took ten of his master's camels, and all sorts of good things of his master's, and went to Mesopotamia, to the town of Nahor.
And he made the camels take their rest outside the town by the water-spring in the evening, at the time when the women came to get water.
And he said, O Lord, the God of my master Abraham, let me do well in what I have undertaken this day, and give your mercy to my master Abraham.
See, I am waiting here by the water-spring; and the daughters of the town are coming out to get water:
Now, may the girl to whom I say, Let down your vessel and give me a drink, and who says in answer, Here is a drink for you and let me give water to your camels: may she be the one marked out by you for your servant Isaac: so may I be certain that you have been good to my master Abraham.
And even before his words were ended, Rebekah, the daughter of Bethuel, the son of Milcah, who was the wife of Nahor, Abraham's brother, came out with her water-vessel on her arm.
She was a very beautiful girl, a virgin, who had never been touched by a man: and she went down to the spring to get water in her vessel.
And the servant came running to her and said, Give me a little water from your vessel.
And she said, Take a drink, my lord: and quickly letting down her vessel onto her hand, she gave him a drink.
And having done so, she said, I will get water for your camels till they have had enough.
And after putting the water from her vessel into the animals' drinking-place, she went quickly back to the spring and got water for all the camels.
And the man, looking at her, said nothing, waiting to see if the Lord had given his journey a good outcome.
And when the camels had had enough, the man took a gold nose-ring, half a shekel in weight, and two ornaments for her arms of ten shekels weight of gold;
And said to her, Whose daughter are you? is there room in your father's house for us?
And she said to him, I am the daughter of Bethuel, the son of Milcah, Nahor's wife.
And she said, We have a great store of dry grass and cattle-food, and there is room for you.
And with bent head the man gave worship to the Lord;
And said, Praise be to the Lord, the God of my master Abraham, who has given a sign that he is good and true to my master, by guiding me straight to the house of my master's family.
]]--

function FightRoleController:ClearAllStatus()
  for k,v in pairs(self.status)do
    if v ~= nil then 
      v:SetKind(ESkill_Kind.Dis);
    end
  end
end

--ResShadow
ResShadow  = {};
ResShadow.__index = ResShadow;

function ResShadow.Trash()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function ResShadow.New(idx, fightRole)
  local self = {};
  setmetatable(self, ResShadow);

  local gameObject = poolMgr:Get("BaseRole");
  gameObject.name = string.Concat("FightRole", fightRole.index, " Shadow", idx);
  gameObject.transform:SetParent(FightField.fightResShadowRoot.transform);
  gameObject.transform.localPosition = Vector3.zero;
  gameObject.transform.localScale = fightRole.scaleRoot.transform.localScale; -- Vector3.one;

  self.gameObject = gameObject;
  self.canvas = self.gameObject:GetComponent("Canvas");

  local bodyTransform = self.gameObject.transform:Find("Body").transform;
  
  self.rawImage = bodyTransform:Find("RawImage_Body"):GetComponent(typeof(RawImage));
  self.rawImage.enabled = true;

  local image = bodyTransform:Find("RawImage_Ghost");
  image.gameObject:SetActive(false);

  self.horseMask = bodyTransform:Find("RawImage_HorseMask").gameObject;
  self.horseMask:SetActive(false);

  self.hud = self.gameObject.transform:Find("HUD").gameObject;
  self.hud:SetActive(false);

  self.material = poolMgr:Get("RoleMaterial");
  self.rawImage.material = self.material;
  self.material:SetInt("_Invisible", 1)
  self.rawImage.texture = fightRole.roleController.rawImage_Body.texture;
  self.alpha = 255;

  self.rawImage.rectTransform.sizeDelta = fightRole.roleController.rawImage_Body.rectTransform.sizeDelta;
  self.rawImage.uvRect = fightRole.roleController.rawImage_Body.uvRect;

  return self;
end  

function ResShadow:Free()
  self.horseMask:SetActive(true);
  self.hud:SetActive(true);
  poolMgr:Release("RoleMaterial", self.material);  
  poolMgr:Release("BaseRole", self.gameObject);
end

function ResShadow:SetPosition(pos, role)
  self.gameObject.transform.localPosition = Vector3.New(pos.x, -pos.y, 0);
  self.rawImage.transform.localPosition = role.rawImage_Body.transform.localPosition;
  self.rawImage.uvRect = role.rawImage_Body.uvRect;
  self.canvas.sortingOrder = FightField.FIGHT_BODY_ORDER  + pos.y;
end

function ResShadow.Trash1()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function ResShadow.Trash2()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function ResShadow.Trash3()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function ResShadow:SetAlpha(alpha)
  if self.alpha == alpha then 
    return;
  end
  self.alpha = alpha;
  self.material:SetFloat("_InvisibleAlpha", self.alpha / 255);
end

function FightRoleController:FreeResShadow()
  for k, v in pairs(self.resShadow) do
    if v ~= nil then 
      v:Free();
    end
  end
  table.Clear(self.resShadow);
end

function FightRoleController:CreateShadaowRes(idx)
  local shadowUnit = ResShadow.New(idx, self);
  
  return shadowUnit;
end

function FightRoleController:ShowResShadow(idx, pos, alpha)
  if self.roleController == nil or self.roleController.jmpDrawer_Body == nil or self.roleController.jmpDrawer_Body.active == false then 
    return 
  end

  if self.resShadow[idx] == nil then 
    self.resShadow[idx] = self:CreateShadaowRes(idx, pos);
  end

  self.resShadow[idx].gameObject:SetActive(true);
  self.resShadow[idx]:SetPosition(pos, self.roleController);
  self.resShadow[idx]:SetAlpha(alpha);
end

function FightRoleController:CloseResShadow(idx)
  if self.resShadow[idx] == nil then 
    return;
  end
  self.resShadow[idx].gameObject:SetActive(false);
end

--[[
Now Rachel, because she had no children, was full of envy of her sister; and she said to Jacob, If you do not give me children I will not go on living.
But Jacob was angry with Rachel, and said, Am I in the place of God, who has kept your body from having fruit?
Then she said, Here is my servant Bilhah, go in to her, so that she may have a child on my knees, and I may have a family by her.
So she gave him her servant Bilhah as a wife, and Jacob went in to her.
And Bilhah became with child, and gave birth to a son.
Then Rachel said, God has been my judge, and has given ear to my voice, and has given me a son; so he was named Dan.
And again Bilhah, Rachel's servant, was with child, and gave birth to a second son.
And Rachel said, I have had a great fight with my sister, and I have overcome her: and she gave the child the name Naphtali.
When it was clear to Leah that she would have no more children for a time, she gave Zilpah, her servant, to Jacob as a wife.
And Zilpah, Leah's servant, gave birth to a son.
And Leah said, It has gone well for me: and she gave him the name Gad.
And Zilpah, Leah's servant, gave birth to a second son.
And Leah said, Happy am I! and all women will give witness to my joy: and she gave him the name Asher.
Now at the time of the grain-cutting, Reuben saw some love-fruits in the field, and took them to his mother Leah. And Rachel said to her, Let me have some of your son's love-fruits.
But Leah said to her, Is it a small thing that you have taken my husband from me? and now would you take my son's love-fruits? Then Rachel said, You may have him tonight in exchange for your son's love-fruits.
In the evening, when Jacob came in from the field, Leah went out to him and said, Tonight you are to come to me, for I have given my son's love-fruits as a price for you. And he went in to her that night.
And God gave ear to her and she became with child, and gave Jacob a fifth son.
Then Leah said, God has made payment to me for giving my servant-girl to my husband: so she gave her son the name Issachar.
And again Leah became with child, and she gave Jacob a sixth son.
--]]

function FightRoleController:CloseAllResShadow()
  for k, v in pairs(self.resShadow)do
    self:CloseResShadow(k);
  end
end

function FightRoleController:ThrowTreasure()  
  for k, v in pairs(FightField.flyTreasureData)do
    if v.sColm == self.colm and v.sRow == self.row then       
      FightField.AddFlyTreasure(self.colm, self.row, v.dColm, v.dRow, v.thingID);
      table.remove(FightField.flyTreasureData, k);
    end
  end
end
