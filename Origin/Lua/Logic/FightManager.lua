EWar = {
  None = 0, --none
  Event = 1, --事件戰鬥 (開戰者身上記號)
  PkPlayers = 2, --Pk玩家戰鬥 (開戰者身上記號)
  PkMapNpc = 3, --PkMapNpc戰鬥 (開戰者身上記號)
  Guest = 4, --觀戰
  Join = 5, --參戰
  Server = 6, --Server戰 (開戰者身上記號)
  BeQuestion = 7, --戰鬥問答 (開戰者身上記號)
  VS = 8, --玩家擂台賽 (開戰者身上記號)
  CityPK = 9, --攻城戰 (開戰者身上記號)
  PKGarNpc = 10, --PK駐紮NPC (開戰者身上記號)
  JoinGarNpc = 11, --參駐紮NPC戰
  GuestGar = 12, --觀Gar的戰
  AtkDoor = 13, --打城門
  PKAlly = 14, --城戰,強P同陣營
  ChaosVS = 15, --玩家戰人亂鬥賽(開戰者身上記號)
  BeastAtk = 16, --年獸戰鬥
  MixVS = 17, --玩家戰人混P賽(開戰者身上記號)
  GuestForeign = 18,--觀外來Npc戰
  JoinForeignNpc = 19,--參外來Npc戰
  Gypsy = 20, --吉普賽戰
  LifePk = 21, --生存Pk9
  DoingFight = 23, --被觸發戰鬥
  ChaosGod = 24, --亂鬥天神
  SecretWay = 25, --密道戰
  WorldBoss = 26, --世界Boss Added by LH_20140710
  NewChaosVS = 27, --無界亂鬥賽
  ChaosBouns = 28, --無界亂鬥獎勵戰 Added by LH_20151016
  Dungeon = 29, --副本
  OneBringFour = 32, --1帶4
  OrgBoss = 33, --軍團BOSS
  OldJoin = 100, --舊參戰型態,判斷是否第一次進戰鬥用
}

--戰地類型(戰場-Server設定)
EFFWar_Style = {
  None = 0, --none
  Normal = 1, --一般戰鬥(事件,PK 玩家,PK Npc)
  BEQ = 2, --戰鬥問答
  ArenaPK = 3, --擂台埸pk
  W5to5 = 4, --團P
  CityPK = 5, --攻城
  CityArenaPK = 6, --同陣營強制PK
  GMBeQ = 7, --GM問答
  Chaos5to5 = 8, --亂鬥
  Mix5to5 = 9, --混p
  DareNpc = 10, --Npc挑戰賽
  LifePK = 11, --生存戰PK
  MrBattle = 13, --戰役系統
  ChaosGod = 14, --亂鬥天神
  SecretWay = 15, --密道戰
  WorldBoss = 16, --世界Boss
  NewChaos5to5 = 17, --新亂鬥
  ChaosBouns = 18, --新亂鬥特殊戰
  EpicBattle2 = 19, --第二類史詩戰役
  Money = 20, --金幣副本
  OrgWar = 21, --軍團戰
  DeathMatch = 22, --死鬥
  OrgBoss = 23, --軍團BOSS
  WeekDungeon = 24,  --特殊副本戰鬥
  CityHegemony = 25,  --城鎮爭霸
  NewMix5to5 = 26, --無界混P
  NewChaos5to5_100LV = 27,  --無界亂鬥100LV
}

EAttackResult = {
  Miss = 0, --迴避
  Hit = 1, --命中
  Thounder = 2, --天雷
  HeartEye = 3, --心眼亦敵
}

--世界Boss限制回合數
WorldBoss_LimitRound = 20;
WorldBoss_MaxFightCount = 5;

--史詩戰役 使用券次數 Alen 20160714
EpicBattle_MaxFightCount = 5;
EpicBattle_MaxTicketCount = 5;

CountDownConst = 20; --倒數20秒
CountDown5to5 = 30; --倒數30秒,團P出手時間
CountDownChaosGod = 10; --10秒,天空擂台出手時間

Num_DelayTick = 70; --若連送跳血時,所需要的延遲時間

--行動的種類
EFightAction = {
  None = 0, --無
  Walk = 1, --移
  Jump = 2, --跳
  Moment = 3, --瞬
}

--行為種類
EFightBeh = {
  None = 0, --無
  Rotate = 1, --轉
  Quake = 2, --震
  Residual = 3, --殘
  Soul = 4, --靈魂出竅
  Divide = 5, --分身
  Dodge = 6, --閃躲
  FlyOut = 7, --打飛
  Dead = 8, --死亡
  MagicalEye = 10, --心眼奕敵
}

Time_Rotate = 80; --旋轉等待時間
Time_Quake = 80; --震動等待時間
Time_Residual = 40; --殘影等待時間
Time_Soul = 20; --靈魂出竅時等待時間
Time_Divide = 40; --分身等待時間
Time_Dodge = 100; --閃躲等待時間

Repeat_Divide = 6; --分身重覆次數

Step_Soul = 20; --靈魂出竅Step
Step_Divide = 3; --分身的Step

--陣營
EFightParty = {
  None = 0, --無
  Right = 1, --右方
  Left = 2, --左方
}

--位置
EFightSpot = {
  None = 0, --原地,用行列得座標用
  Front = 1, --前
  Back = 2, --後
  Left = 3, --左
  Right = 4, --右
}

EFightStatusKind = {
  Seal = 1,
  Vary = 2,
  Faint = 3,
  Spec = 4,
  Strong = 5,
  Passive = 6,
}

Dead_None = 0;
Dead_Dead = 1;

Attack_Hit = 1; --擊中
Attack_Start = 2; --發招

--青龍相關的座標
Dragon_SiftX1 = 200; --頭
Dragon_SiftY1 = 245;

Dragon_SiftX2 = 169; --右手
Dragon_SiftY2 = 131;

Dragon_SiftX3 = 27; --左手
Dragon_SiftY3 = 205;

MR_CatchLv = 40; --桃太郎飯團可捕捉的LV差

Turtle_SiftX1 = 193; --頭
Turtle_SiftY1 = 335;

Turtle_SiftX2 = 193; --右手
Turtle_SiftY2 = 263;

Turtle_SiftX3 = 67; --左手
Turtle_SiftY3 = 331;

--白虎
Tiger_SiftX1 = 193; --頭
Tiger_SiftY1 = 340;

Tiger_SiftX2 = 185; --右手
Tiger_SiftY2 = 222;

Tiger_SiftX3 = 39; --左手
Tiger_SiftY3 = 331;

--最大閃躲殘影數
Dodge_MaxBehMed = 5;

--正常壓扁大小
MaxSquelch = 10; 
--最小壓扁大小(扁到看不到人)
MinSquelch = 0; 

--最大放大的Size;
MaxShrink = 13; 
--最小縮小的Size;
MinShrink = 5; 
--正常的Size               
DefShrink=10; 

--戰鬥控管中心
FightManager = {};
FightManager._index = FightManager;
local this = FightManager;

this.isRound = false; --開始一回合
this.blnUseTout = false; --是否使用偵察術
this.killEnemyCount = 0; --城戰殺敵數

function FightManager.FightFieldWarStyle(data)                  --戰埸戰鬥類型 
  local ffwar_Style = data:ReadByte();
  local round = data:ReadUInt16();

  local limit = nil;
  if data.length >= 5 then
    limit = data:ReadByte();
  end
  
  FightField.ffWar_Style = ffwar_Style;

  FightField.fightRound = round;

  if limit ~= nil then
    FightField.limit1 = limit
  end

  local fightMark = data:ReadUInt32(); --戰鬥限制條件(Bit 1: 1不能參戰 2: 不倒數)

  FightField.notShowCountDown = CheckFlag(fightMark, 2);

  if Contains(FightField.ffWar_Style, EFFWar_Style.BEQ, EFFWar_Style.W5to5, EFFWar_Style.GMBeQ, EFFWar_Style.Chaos5to5, EFFWar_Style.Mix5to5, EFFWar_Style.WorldBoss, EFFWar_Style.NewChaos5to5) then 
      FightField.downSec = CountDown5to5; --//30SEC
  elseif FightField.ffWar_Style == EFFWar_Style.ChaosGod then 
      FightField.downSec = CountDownChaosGod; --//10SEC
  else
      FightField.downSec = CountDownConst;
  end
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
  AudioManager.PlayFightMusic();
 end 

function FightManager.FightOver(roleId, guardIndex) --某id玩家結束戰役
 --Kind(1)+玩家ID(8)+Npcidx(2)             Kind=0  某Id戰鬥結束
  if guardIndex == 0 then   --處理玩家的部份    
    if Role.players[roleId] == nil then return end

    if roleId == Role.playerId then
      UIFight.ShowFightBtn(false);
      if UI.IsVisible(UITeam) and UITeam.IsCurrentTag(EUITeamTag.FightTeam) then 
        UI.Close(UITeam);
      end

      if Role.players[roleId].war == EWar.Guest then    
        FightField.ExitFight();
      end
    end
    
    Role.players[roleId]:SetWar(EWar.None);
  else
    if Role.guardNpcs[guardIndex] == nil then return end

    Role.guardNpcs[guardIndex]:SetWar(EWar.None);
  end
end

function FightManager.RevExitFight(colm, row)                       --收到離開戰鬥
--11:Kind(1)+Colm(1)+Row(1)                    Kind=1  某行列人物離開戰鬥   
  local fIdx = FightField.GetFHumIdx(colm, row);

  if FightField.fightHum[fIdx] == nil then 
    return 
  end
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
  --還原全部狀態
  FightField.fightHum[fIdx]:ClearAllStatus();
  FightField.ClearAllAttack()

  if FightField.scoutVisible then 
    FightField.CloseScoutInfoSingle(FightField.fightHum[fIdx]);
  end

  if FightField.fightHum[fIdx].beh_Kind == EFightBeh.Dead or FightField.fightHum[fIdx].beh_Kind == EFightBeh.FlyOut then  
    FightField.fightHum[fIdx]:ExitFight(); 
  else    
    if (FightField.fightHum[fIdx].hum_Kind == EHuman.Players)  --在玩家死亡,分身結束換回武將時,分身再播動畫,
    and (FightField.fightHum[fIdx].masterID ~= 0) then                   
      FightField.fightHum[fIdx]:ExitFight(); --延遲清除fighthum,而變成下一個控制者,在送出50協定時,會被server 42斷線      
    else
      FightField.fightHum[fIdx]:CloseInfoUI();
      FightField.SetSkillKind(fIdx, ESkill_Kind.ExitFight, fIdx)        
    end
  end

  --靈魂武將
  FightManager.FreeSoulRole(colm, row);
end

function FightManager.FreeSoulRole(colm, row)
  if Contains(colm, 1, 2) then
    local soulColm = 0;
    if colm == 2 then
      soulColm = 1;
    end
    FightField.SoulRoleFree(soulColm, row);
  end
end

function FightManager.AllSoulWarriorVisible(visible)
  --logError(this.commandActive);
  --logError(FightField.isFreeSoulWarrior);
    for i = 0,  1 do
      for j = 0, 4 do
        FightManager.SoulWarriorVisible(i, j, visible);
      end
    end
end

function FightManager.SoulWarriorVisible(colm, row, visible)
  local fIdx = FightField.GetSoulFHumIdx(colm, row);
  if fIdx >=0  then
    FightField.fightHum[fIdx].roleController:SetVisible(visible);
    --FightField.fightHum[fIdx]:ClearAllStatus();roleController
    --FightField.fightHum[fIdx]:ExitFight();
  end
end

function FightManager.RevFailMsg(data)     --收到Server傳回來的錯誤訊息
--Kind(1)+failMsg(1)                        Kind=3  failMsg(1: 人數己滿無法參戰)
  local failMsg = data:ReadByte();
  if failMsg == 1 then  
    ShowCenterMessage(string.Get(40036), 1);
  elseif failMsg == 2 then 
    ShowCenterMessage(string.Get(60038), 1);
  elseif failMsg == 3 then 
    ShowCenterMessage(string.Get(60039), 1);
  elseif failMsg == 4 then 
    ShowCenterMessage(string.Get(60040), 1);
  elseif failMsg == 5 then 
    ShowCenterMessage(string.Get(21936), 1);
  end
end

function FightManager.RevAttackSkill(data) 
--[[  50    Kind(1)+<<aLen(2)                   Kind=1
                  +SColm(1)+SRow(1)           SColm來源行,SRow來源列人物
                  +Skill_ID(2)                施展Skill_ID編號
                  +Count1(1)                  被施者數目
                  +<<DColm(1)+DRow(1)         對DColm目的行,DRow目的列
                   +Attack_Result(1)          Attack_Result 施者結果(0:Miss 1:成功 2:天雷 3:心眼)
                   +BeHitAct(1)               BeHitAct 被施者動作
                                              (0:挨 1:擋 2:閃 3:不變)
                   +Count2(1)                 屬性數目
                    +<<Attr_Kind(1)           Attr_Kind (Const Attr_xxx)
                    +Value(4)                 Value差值
                    +Sign(1)>>                Sign正負值 (0正 1負)
                  >>
                >>
]]--
  local sColm, sRow, count, fightArea;
  local skill_ID;
  local idx;
  local me;

  FightField.countDown = -1;
  FightField.slowCntDown =-1; --烏龜計數,開打就不數
  FightField.isShowTurtle = false; 
  FightField.ShowSlowTurtle();
  FightField.EndCountDown();
  FightField.CloseOnTurnUI();
  FightField.ClearAllAttack(); --清除前一波的攻勢
  this.isRound = true; --開始一回合

  while data.length > 0 do
    local strLen = data:ReadUInt16(); 
    sColm = data:ReadByte();
    sRow = data:ReadByte();
    skill_ID = data:ReadUInt16();
    --log(string.Concat("Attack Start !! Col: ", sColm, " Row: ", sRow, " SkillId: ", skill_ID));
    fightArea = data:ReadByte();
    count = data:ReadByte(); --被施者數目

    local attackDatas = {}
    for i = 1, count do 
      attackDatas[i] = AttackData.New(data);
    end

    idx = FightField.GetFHumIdx(sColm, sRow);
    if idx ~= -1 and FightField.fightHum[idx] ~= nil then    
      me = FightField.fightHum[idx];
      
      if skill_ID == 20008 then       
        me.itemSkillId = data:ReadUInt16();
      end

      local npcId = me.roleController.npcId;
      if skill_ID == 10000 and not(me.kind == EHuman.Player or me.kind == EHuman.Players) then 
        if npcId == 37008 or --前哨站
            npcId == 37009 then --城門
          skill_ID = 16001;
        elseif npcId == 42107 or --鉅鹿外城門
          npcId == 42108 or --鉅鹿主城門
          npcId == 42160 or npcId == 42170 or npcId == 42184 then 
          skill_ID = 16002;
        end
      end            
      me:AddEffect(skill_ID, count, attackDatas); --存放攻方對守方(複數)的攻擊值
      if count > 0 then 
        FightField.AttackSkill(FightField.GetFHumIdx(sColm, sRow), FightField.GetFHumIdx(attackDatas[1].dColm, attackDatas[1].dRow), skill_ID, fightArea);
      end
    else
      logError("IDX NOT FIND")
    end
  end
end

AttackData = {}
function AttackData.New(data)
  local self = {};
  self.dColm = data:ReadByte();
  self.dRow = data:ReadByte();
  self.attack_Result = data:ReadByte();
  self.beHitAct = data:ReadByte();
  self.attr = {};
  local count = data:ReadByte();
  for i = 1, count do 
    self.attr[i] = {}        
    self.attr[i].kind = data:ReadByte();
    self.attr[i].value = data:ReadUInt32();
    self.attr[i].sign = data:ReadByte();
  end
  return self;
end

function FightManager.RevChangeAttrib(data)
  local colm, row, attr_Kind; 
  local value;
  local humIdx;
  local isRevive = data:ReadByte(); 
  while data.length > 0 do
    colm = data:ReadByte(); 
    row = data:ReadByte(); 
    attr_Kind = data:ReadByte();
    value = data:ReadInt32();
    humIdx = FightField.GetFHumIdx(colm, row);
    if humIdx ~= -1 then   
      local fightRole = FightField.fightHum[humIdx];
      if fightRole ~= nil then 
        --甦生靈藥用
        if attr_Kind == EAttribute.Hp
          and fightRole.roleController:GetAttribute(EAttribute.Hp) <=0
          and value > 0 then
                        
          fightRole:SetBeh(EFightBeh.None);
          fightRole.roleController:SetIsDead(false);
          if isRevive == 1 then 
            local status =  fightRole:GetStatus(0);
            status:SetLightWithOrder(2, EEffectLightDis.Sky ,10141,30,1,23,23, EEffectLightTracer.StandAni, fightRole.nowPos.x, fightRole.nowPos.y ,30, true, 50);
          end                                            
        end

        local nowValue = 0;
        local nowValueKind = 0;
        --上限檢查
        if attr_Kind == EAttribute.MaxHp then 
          nowValueKind = EAttribute.Hp;
        elseif attr_Kind == EAttribute.MaxSp then 
          nowValueKind = EAttribute.Sp;
        end

        if nowValueKind ~= 0 then 
          nowValue = fightRole.roleController:GetAttribute(nowValueKind);
          if nowValue > value then 
            fightRole.roleController:SetAttribute(nowValueKind, value);
          end           
        end

        fightRole.roleController:SetAttribute(attr_Kind, value);
        fightRole:UpdateUIInfo();
      end
    else
      logError("RevChangeAttrib Get HumIdx Fail")
    end    
  end 
end

function FightManager.RevRestoreStatus(data)
  local colm, row;
  local idx, skillId;
  local status_kind; --1封印/2變化/3衰弱  

  FightField.ClearAllAttack(); --將目前戰場上所有的攻擊戰鬥特效歸位
    
  while data.length > 0 do
    colm = data:ReadByte();
    row = data:ReadByte();
    status_kind = data:ReadByte();
    skillId = data:ReadUInt16(); 
    if Between(status_kind, 1, 6) then           
      idx = FightField.GetFHumIdx(colm, row);
      local fightRole =  FightField.fightHum[idx];
      if fightRole ~= nil then           
        fightRole:HandleStatus(status_kind, skillId);
      end
    end
  end
end

function FightManager.FindEveFightBkMusic(fightNo)
  for i = 1, 200 do   --FightMaxRange 200
    if SceneManager.sceneState.fightTable ~= nil and SceneManager.sceneState.fightTable[i] ~= nil and SceneManager.sceneState.fightTable[i].EveNo == fightNo then
      return SceneManager.sceneState.fightTable[i].BKMusic;
    end
  end

  return 0;
end

function FightManager.RevFlyOut(data)
  local colm = data:ReadByte();
  local row = data:ReadByte();
  local  idx = FightField.GetFHumIdx(colm, row);
  if FightField.fightHum[idx] ~= nil then
     FightField.ClearAllAttack();
     FightField.fightHum[idx]:SetBeh(EFightBeh.FlyOut);
     FightField.fightHum[idx]:ThrowTreasure();

    FightManager.FreeSoulRole(colm, row);
  end
end

function FightManager.RevActSetOK(data)
  local colm = data:ReadByte();
  local row = data:ReadByte();
  local  idx = FightField.GetFHumIdx(colm, row);
  if FightField.fightHum[idx] ~= nil then
    FightField.fightHum[idx].blnActSetOK = true;
    if idx == FightField.GetPlayerIdx() or FightField.fightHum[idx].masterID == Role.playerId then 
      FightField.NextControlMan();
    end
    FightField.ShowSlowTurtle();
  end
end

function FightManager.RevHelpMsg(data)
  local style = data:ReadByte();
  local beHid = data:ReadInt64();
  local hid = data:ReadInt64();
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
  --顯示對話方塊
  if tonumber(beHid) > 0 then
    if style == 1 then
      if math.random(0, 1) == 0 then
        ShowTalkMessage(nil, string.Get(80174), tonumber(hid)); --別囂張!還有我!
      else
        ShowTalkMessage(nil, string.Get(60029), tonumber(hid)); --想嬴,沒那麼容易
      end
    else
      local showRole = Role.GetRole(EHuman.Players, beHid);
      if showRole ~= nil then
        ShowTalkMessage(nil, string.Concat(showRole.name, string.Get(60028)), tonumber(hid));
      end
    end   
  else
    ShowTalkMessage(nil, string.Get(60029), tonumber(hid));
  end     
end

function FightManager.RevChgColmRow(data)
  local fromColm = data:ReadByte();
  local fromRow = data:ReadByte();
  local toColm = data:ReadByte();
  local toRow = data:ReadByte();

  local idx = FightField.GetIdx(toColm, toRow);
  --要換的位置,強制離開
  if FightField.fightHum[idx] ~= nil then
    FightField.fightHum[idx]:ExitFight();
  end
  
  local fromIdx = FightField.GetFHumIdx(fromColm, fromRow);
  local fromFightRole =  FightField.fightHum[fromIdx]; 
  if fromFightRole ~= nil then     
    fromFightRole.colm = toColm;
    fromFightRole.row = toRow;
    fromFightRole.index = idx;
    FightField.fightHum[idx], FightField.fightHum[fromIdx] = FightField.fightHum[fromIdx], FightField.fightHum[idx];
    FightField.fightHum[idx]:ResetPosition();
  end
end

function FightManager.RevKillEmyNum(data)
  local enemyKill = data:ReadUInt16(); 
  this.killEnemyCount = enemyKill;
end

function FightManager.RevChangeBody(data)
  local colm = data:ReadByte();
  local row = data:ReadByte();
  local npcId = data:ReadUInt16();
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
  if FightField.isInBattle == false then 
    return;
  end

  local fightRole = FightField.fightHum[FightField.GetFHumIdx(colm, row)];

  if fightRole == nil then
    return
  end

  fightRole.roleController.npcId = npcId;
  fightRole.roleController:UpdateAll();
end


function FightManager.RevBuffStatus(data)  
  local colm = data:ReadByte(); 
  local row = data:ReadByte();
  local kind = data:ReadByte();
  local round = data:ReadByte();
  local value = data:ReadUInt16();

  --log(string.Concat("Recive Fight Buff !! Colm ", colm, " row ", row, " kind ", kind, " round ", round, " value ", value));
  
  local fightRole = FightField.fightHum[FightField.GetFHumIdx(colm, row)];
  
  if fightRole == nil then
    logError("Fight Buff Cant Find FightRole");
    return;
  end

  if fightRole.kind == EHuman.Player or (fightRole.kind == EHuman.FollowNpc and fightRole.masterID == Role.playerId) then
    DrugBuff.SetFightBuff(fightRole.roleController, kind, value, round);
  end
end

function FightManager.RevFlyTreasure(data)
  local itemId = data:ReadUInt16();

  if itemId == 0 then return end

  local fromColm = data:ReadByte();
  local fromRow = data:ReadByte();

  while data.length > 0 do
    FightField.SaveFlyTreasure(fromColm, fromRow, data:ReadByte(), data:ReadByte(), itemId);
  end
end

this.commandActive = true;
function FightManager.SetCommandActive(value)
  -- if this.commandActive == value then return end
  
  this.commandActive = value;

  Function.UpdateVisible(5, 6);

  if UI.IsVisible(UIStatus) and (UIStatus.IsCurrentTag(EUIStatusTag.FightEquip) or UIStatus.IsCurrentTag(EUIStatusTag.FightStyle)) then
    UI.Close(UIStatus);
    UI.Close(UIItemInfo);
  end
end

function FightManager.ReciveFightAppearenceData(data, roleId)
  local roleData = {};
  roleData.name = data:ReadString(data:ReadByte());
  roleData.roleId = roleId;
  roleData.sex = data:ReadByte();
  roleData.element = data:ReadByte();
  roleData.lv = data:ReadByte(); 
    
  roleData.poorMission = data:ReadByte();
  roleData.godMission = data:ReadUInt32();
  roleData.elfNo = data:ReadUInt16();

  roleData.face = data:ReadByte();
  roleData.headStyle = data:ReadByte();
  roleData.bodyStyle = data:ReadByte(); 
  roleData.colorTints = {};
  roleData.colorTints[1] = data:ReadInt32();
  roleData.colorTints[2] = data:ReadInt32();
  roleData.vsWin = data:ReadUInt16();
  roleData.vsTopNum = data:ReadByte(); 
  roleData.dareWinNum = data:ReadByte();  
  roleData.turn = data:ReadByte();
  roleData.career = data:ReadByte();    

  --equip
  roleData.equipCount = data:ReadByte();
  roleData.itemId = {};
  for i = 1, roleData.equipCount do
    roleData.itemId[i] = data:ReadUInt16(); 
  end
  
  --外顯外觀裝備
  local outfitStyleCount = data:ReadByte();
  for i = 1, outfitStyleCount do
    roleData.itemId[roleData.equipCount + i] = data:ReadUInt16();
  end
  
  roleData.teamState = data:ReadByte();
  roleData.orgId = data:ReadInt32();
  return roleData;  
end

function FightManager.RevQandAResult(data)
  local result = data:ReadByte();
  if result == 1 then
    ShowCenterMessage(string.Get(40029), 1.2);
  elseif result == 2 then
    ShowCenterMessage(string.Get(40030), 1.2);
  elseif result == 3 then
    ShowCenterMessage(string.Get(40031), 1.2);
  elseif result == 9 then
    ShowCenterMessage(string.Get(40082), 1.2);
  end
end