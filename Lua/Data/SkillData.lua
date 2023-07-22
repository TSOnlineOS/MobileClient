SkillData = {};
SkillData.__index = SkillData;

function SkillData.New(reader)
  local self = {};
  setmetatable(self, SkillData);

  self.name = LuaHelper.BytesToString(DataManager.encoding_Unicode, reader:ReadBytes(reader:ReadUInt16())); --技能名稱
  self.kind = reader:ReadByte(); --種類
  self.id = reader:ReadUInt16(); --編號
  self.requireSp = reader:ReadUInt16(); --扣SP
  self.element = reader:ReadByte(); --元素 (1地  2水  3火  4風)
  self.numerical = reader:ReadUInt32(); --數值 (影響屬性)
  self.attribute = reader:ReadByte(); --種類 (屬性種類)
  self.level = reader:ReadByte(); --等級
  self.fightWay = reader:ReadByte(); --打法 (0單體無位移 1打多位  2有位移)
  self.fightArea = reader:ReadByte(); --範圍 (1 一人, 2同列二人, 3行三人, 4跳三人, 5十字五人, 6六人, 7同行五人, 8全體 )

  self.round = reader:ReadByte(); --回合 (0: none 1:定住一回合 2:定住二回合 3:定住三回合 4:持續三回合)
  self.spendSecond = reader:ReadByte(); --秒數
  self.hitStatus = reader:ReadByte(); --狀態 (0正常 1冰封 2旋風 3樹精)
  self.howMuchTimes = reader:ReadByte(); --幾下 (攻擊最多分幾下)

  self.limitLv = reader:ReadByte(); --限制等級(0~200)含以上才可學會
  self.learnPoint = reader:ReadByte(); --初學所需點數(第一級)
  self.levelUpPoint = reader:ReadByte(); --每級所需點數(第二級以後)
  self.maxLv = reader:ReadByte(); --特技最高等級(目前設定10級)

  self.preSkills = {};
  local preSkillId = reader:ReadUInt16();
  if preSkillId > 0 then
    table.insert(self.preSkills, preSkillId);
  end

  self.atkKind = reader:ReadUInt16(); --備用1
  self.turnKind = reader:ReadByte(); --轉生類型(0:未轉生 1:已轉生)

  preSkillId = reader:ReadUInt16(); --上一階特技2
  if preSkillId > 0 then
    table.insert(self.preSkills, preSkillId);
  end
  
  self.learnLimit = reader:ReadByte(); --備用3
  self.useLimit = reader:ReadUInt16(); --備用4
  self.fightWayGrowType = reader:ReadUInt16(); --備用5

  self.description = LuaHelper.BytesToString(DataManager.encoding_Unicode, reader:ReadBytes(reader:ReadUInt16())); --說明
  self.description = string.ReomveSymbol(self.description, " ");

  if Define.TextCount then
    DataManager.textCount = DataManager.textCount + string.Count(self.name) + string.Count(self.description);
  end

  if self.id == 13014 then
    table.insert(self.preSkills, 13012);
  elseif self.id == 14038 then
    table.insert(self.preSkills, 10020);
    table.insert(self.preSkills, 11020);
    table.insert(self.preSkills, 12020);
    table.insert(self.preSkills, 13019);
  end

  return self.id, self;
end

function SkillData.Random()
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

function SkillData.Random1()
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

function SkillData.Random2()
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

function SkillData.Random3()
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

function SkillData:SetIcon(rawImage)
  TextureManager.SetPng(ETextureUseType.UI, string.Concat("icon_sk", self.id), rawImage);
end

function SkillData.Random4()
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

function SkillData.Random5()
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

function SkillData:GetDescription(role, withoutCondition, addLv)
  if addLv == nil then 
    addLv = 0;
  end

  local pointRate = 1;
  if role ~= nil then
    if Between(self.element, 1, 4) and self.element ~= role:GetAttribute(EAttribute.Element) then
      pointRate = 2;
    end
  end

  local description = self.description;

  local skillLv;
  if role == nil then 
    skillLv = 1;
  else
    skillLv = role:GetSkillLv(self.id) + addLv;
  end
  skillLv = math.clamp(skillLv, 1, 10);

  local fightArea = self:GetFightArea(skillLv);

  if self.fightWay > 0 then
    description = string.Concat(description, ",", string.Get(20564), string.GetFightWay(self.fightWay), string.GetFightArea(fightArea));
  end

  if self.requireSp > 0 then 
    if self.requireSp == 1 then 
      --規則 若填消耗1點SP=消耗全部
      description = string.Concat(description, ",", string.Get(23285));
    else 
      description = string.Concat(description, ",", string.Get(20565), tostring(self.requireSp), string.Get(20562));
    end
  end
  
  if withoutCondition ~= true then
    local showLearn = true;
    if Contains(self.element, 7, 8) then  --玩家光暗不秀學習資訊
      if (role ~= nil and role.kind ~= EHuman.FollowNpc) then 
        showLearn = false;
      end    
    end  

    if Contains(self.id, 14026, 14077) or Skill.IsSummonSkill(self.id) then --招喚不秀技能學習點數資訊
      showLearn = false;
    end

    if showLearn then 
      description = string.Concat(description, ",", string.Get(20561), tostring(self.learnPoint * pointRate), string.Get(20562));
      description = string.Concat(description, ",", string.Get(20563), tostring(self.levelUpPoint), string.Get(20562));
    end
  
    if role ~= nil and role.kind ~= EHuman.FollowNpc then
      local checkMessage = nil;
      for k, preSkillId in pairs(self.preSkills) do
        if skillDatas[preSkillId] ~= nil then
          if checkMessage == nil then
            checkMessage = string.Get(20566);
          else
            checkMessage = string.Concat(checkMessage, string.Get(20568));
          end
  
          checkMessage = string.Concat(checkMessage, skillDatas[preSkillId].name);
        end
      end
  
      if checkMessage ~= nil then
        description = string.Concat(description, ",", checkMessage);
      end
    end
  end

  return description;
end

function SkillData:CanUse()
  return not (self.useLimit == 0 or self.fightWay == 0);
end

function SkillData.Random6()
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

function SkillData.Random7()
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

function SkillData.Random8()
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

--機關盒不可設定強化技能的例外技能
function SkillData:Except()
  return not (self.id == 21026);
end

function SkillData:GetFightArea(skillLv)
  --(1 一人, 2同列二人, 3行三人, 4跳三人, 5十字五人, 6六人, 7同行五人, 8全體, 255敵我雙方全體 )
  if self.fightWayGrowType == 1 then --招換隨等級增加範圍會變大
    if skillLv == 1 then 
      return 1;
    elseif Between(skillLv, 2, 3) then 
      return 2;
    elseif Between(skillLv, 4, 6) then 
      return 5;
    elseif Between(skillLv, 7, 9) then 
      return 6;
    elseif skillLv == 10 then 
      return 8;
    else
      return self.fightArea;
    end
  elseif self.fightWayGrowType == 2 then 
    if Between(skillLv, 1, 3) then 
      return 3
    elseif Between(skillLv, 4, 6) then 
      return 5;
    elseif Between(skillLv, 7, 9) then 
      return 6;
    elseif skillLv == 10 then
      return 8;
    else
      return self.fightArea;
    end
  else
    return self.fightArea;
  end
end

function SkillData.Random9()
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

function SkillData.Random10()
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

function SkillData.Random11()
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

--[[
  SkillID1:Array [0~15] of word=(10001,10003,10005,10008,10013,
                                  10012,10007,10011,10002,10004,
                                  10006,10010,10015,10014,10009,
                                  14026);


  SkillID2:Array [0~15] of word=(11001,11003,11005,11008,11011,
                                  11015,11014,11002,11004,11007,
                                  11010,11013,11006,11009,11012,
                                  14026);

  SkillID3:Array [0~15] of word=(12001,12003,12006,12009,12012,
                                  12015,12002,12005,12008,12011,
                                  12014,12004,12007,12010,12013,
                                  14026);

  SkillID4:Array [0~14] of word=(13001,13003,13005,13008,13012,
                                  13011,13014,13002,13004,13007,
                                  13010,13013,13006,13009,14026);

  SkillID5:Array [0~15] of word=(14001,
                                  14005,14011,14019,14002,0,
                                  14004,14010,14019,14006,0,
                                  14003,20006,20007,14012,0);

SetBtn(1, 10020,125,120,1);
SetBtn(2, 10022,100,160,2);
SetBtn(3, 10024,100,200,3);
SetBtn(4, 10023,100,240,4);
SetBtn(5, 10021,148,160,5);
SetBtn(6, 10025,148,200,6);
SetBtn(7, 10026,148,240,7);

SetBtn(8, 11020,237,120,8);
SetBtn(9, 11021,213,160,9);
SetBtn(10, 11022,213,200,10);
SetBtn(11, 11023,213,240,11);
SetBtn(12, 11024,262,160,12);
SetBtn(13, 11025,262,200,13);
SetBtn(14, 11026,262,240,14);

SetBtn(15, 12020,350,120,15);
SetBtn(16, 12023,326,160,16);
SetBtn(17, 12026,326,200,17);
SetBtn(18, 12025,326,240,18);
SetBtn(19, 12021,375,160,19);
SetBtn(20, 12024,375,200,20);
SetBtn(21, 12022,375,240,21);

SetBtn(22, 13019,464,120,22);
SetBtn(23, 13022,440,160,23);
SetBtn(24, 13024,440,200,24);
SetBtn(25, 13023,440,240,25);
SetBtn(26, 13021,487,160,26);
SetBtn(27, 13020,487,200,27);
SetBtn(28, 13025,487,240,28);
]]--

SkillTree = {}

for i = 1, 4 do
  SkillTree[i] = {};

  for j = 0, 21 do
    SkillTree[i][j] = { skillId = 0, childs = {} };
  end
end

--1
SkillTree[1][0].skillId = 10001;
SkillTree[1][0].childs[0] = 1;
SkillTree[1][0].childs[1] = 8;

SkillTree[1][1].skillId = 10003;
SkillTree[1][1].parent = 0;
SkillTree[1][1].childs[0] = 2;

SkillTree[1][2].skillId = 10005;
SkillTree[1][2].parent = 1;
SkillTree[1][2].childs[0] = 3;
SkillTree[1][2].childs[1] = 6;

SkillTree[1][3].skillId = 10008;
SkillTree[1][3].parent = 2;
SkillTree[1][3].childs[0] = 4;
SkillTree[1][3].childs[1] = 5;

SkillTree[1][4].skillId = 10013;
SkillTree[1][4].parent = 3;
SkillTree[1][4].childs[0] = 15;

SkillTree[1][5].skillId = 10012;
SkillTree[1][5].parent = 3;
SkillTree[1][5].childs[0] = 15;

SkillTree[1][6].skillId = 10007;
SkillTree[1][6].parent = 2;
SkillTree[1][6].childs[0] = 7;

SkillTree[1][7].skillId = 10011;
SkillTree[1][7].parent = 6;
SkillTree[1][7].childs[0] = 15;

SkillTree[1][8].skillId = 10002;
SkillTree[1][8].parent = 0;
SkillTree[1][8].childs[0] = 9;

SkillTree[1][9].skillId = 10004;
SkillTree[1][9].parent = 8;
SkillTree[1][9].childs[0] = 10;

SkillTree[1][10].skillId = 10006;
SkillTree[1][10].parent = 9;
SkillTree[1][10].childs[0] = 11;
SkillTree[1][10].childs[1] = 14;

SkillTree[1][11].skillId = 10010;
SkillTree[1][11].parent = 10;
SkillTree[1][11].childs[0] = 12;
SkillTree[1][11].childs[1] = 13;

SkillTree[1][12].skillId = 10015;
SkillTree[1][12].parent = 11;
SkillTree[1][12].childs[0] = 15;

SkillTree[1][13].skillId = 10014;
SkillTree[1][13].parent = 11;
SkillTree[1][13].childs[0] = 15;

SkillTree[1][14].skillId = 10009;
SkillTree[1][14].parent = 10;
SkillTree[1][14].childs[0] = 15;

SkillTree[1][15].skillId = 10020;
SkillTree[1][15].childs[0] = 16;
SkillTree[1][15].childs[1] = 19;

SkillTree[1][16].skillId = 10022;
SkillTree[1][16].parent = 15;
SkillTree[1][16].childs[0] = 17;

SkillTree[1][17].skillId = 10024;
SkillTree[1][17].parent = 16;
SkillTree[1][17].childs[0] = 18;

SkillTree[1][18].skillId = 10023;
SkillTree[1][18].parent = 17;

SkillTree[1][19].skillId = 10021;
SkillTree[1][19].parent = 15;
SkillTree[1][19].childs[0] = 20;

SkillTree[1][20].skillId = 10025;
SkillTree[1][20].parent = 19;
SkillTree[1][20].childs[0] = 21;

SkillTree[1][21].skillId = 10026;
SkillTree[1][21].parent = 20;

--2
SkillTree[2][0].skillId = 11001;
SkillTree[2][0].childs[0] = 1;
SkillTree[2][0].childs[1] = 7;

SkillTree[2][1].skillId = 11003;
SkillTree[2][1].parent = 0;
SkillTree[2][1].childs[0] = 2;

SkillTree[2][2].skillId = 11005;
SkillTree[2][2].parent = 1;
SkillTree[2][2].childs[0] = 3;

SkillTree[2][3].skillId = 11008;
SkillTree[2][3].parent = 2;
SkillTree[2][3].childs[0] = 4;

SkillTree[2][4].skillId = 11011;
SkillTree[2][4].parent = 3;
SkillTree[2][4].childs[0] = 5;
SkillTree[2][4].childs[1] = 6;

SkillTree[2][5].skillId = 11015;
SkillTree[2][5].parent = 4;
SkillTree[2][5].childs[0] = 15;

SkillTree[2][6].skillId = 11014;
SkillTree[2][6].parent = 4;
SkillTree[2][6].childs[0] = 15;

SkillTree[2][7].skillId = 11002;
SkillTree[2][7].parent = 0;
SkillTree[2][7].childs[1] = 8;

SkillTree[2][8].skillId = 11004;
SkillTree[2][8].parent = 7;
SkillTree[2][8].childs[0] = 9;
SkillTree[2][8].childs[1] = 12;

SkillTree[2][9].skillId = 11007;
SkillTree[2][9].parent = 8;
SkillTree[2][9].childs[0] = 10;

SkillTree[2][10].skillId = 11010;
SkillTree[2][10].parent = 9;
SkillTree[2][10].childs[0] = 11;

SkillTree[2][11].skillId = 11013;
SkillTree[2][11].parent = 10;
SkillTree[2][11].childs[0] = 15;

SkillTree[2][12].skillId = 11006;
SkillTree[2][12].parent = 8;
SkillTree[2][12].childs[0] = 13;

SkillTree[2][13].skillId = 11009;
SkillTree[2][13].parent = 12;
SkillTree[2][13].childs[0] = 14;

SkillTree[2][14].skillId = 11012;
SkillTree[2][14].parent = 13;
SkillTree[2][14].childs[0] = 15;

SkillTree[2][15].skillId = 11020;
SkillTree[2][15].childs[0] = 16;
SkillTree[2][15].childs[1] = 19;

SkillTree[2][16].skillId = 11021;
SkillTree[2][16].parent = 15;
SkillTree[2][16].childs[0] = 17;

SkillTree[2][17].skillId = 11022;
SkillTree[2][17].parent = 16;
SkillTree[2][17].childs[0] = 18;

SkillTree[2][18].skillId = 11023;
SkillTree[2][18].parent = 17;

SkillTree[2][19].skillId = 11024;
SkillTree[2][19].parent = 15;
SkillTree[2][19].childs[0] = 20;

SkillTree[2][20].skillId = 11025;
SkillTree[2][20].parent = 19;
SkillTree[2][20].childs[0] = 21;

SkillTree[2][21].skillId = 11026;
SkillTree[2][21].parent = 20;

--3
SkillTree[3][0].skillId = 12001;
SkillTree[3][0].childs[0] = 1;
SkillTree[3][0].childs[1] = 6;

SkillTree[3][1].skillId = 12003;
SkillTree[3][1].parent = 0;
SkillTree[3][1].childs[0] = 2;

SkillTree[3][2].skillId = 12006;
SkillTree[3][2].parent = 1;
SkillTree[3][2].childs[0] = 3;

SkillTree[3][3].skillId = 12009;
SkillTree[3][3].parent = 2;
SkillTree[3][3].childs[0] = 4;

SkillTree[3][4].skillId = 12012;
SkillTree[3][4].parent = 3;
SkillTree[3][4].childs[0] = 5;

SkillTree[3][5].skillId = 12015;
SkillTree[3][5].parent = 4;
SkillTree[3][5].childs[0] = 15;

SkillTree[3][6].skillId = 12002;
SkillTree[3][6].parent = 0;
SkillTree[3][6].childs[0] = 7;
SkillTree[3][6].childs[1] = 11;

SkillTree[3][7].skillId = 12005;
SkillTree[3][7].parent = 6;
SkillTree[3][7].childs[0] = 8;

SkillTree[3][8].skillId = 12008;
SkillTree[3][8].parent = 7;
SkillTree[3][8].childs[0] = 9;

SkillTree[3][9].skillId = 12011;
SkillTree[3][9].parent = 8;
SkillTree[3][9].childs[0] = 10;

SkillTree[3][10].skillId = 12014;
SkillTree[3][10].parent = 9;
SkillTree[3][10].childs[0] = 15;

SkillTree[3][11].skillId = 12004;
SkillTree[3][11].parent = 6;
SkillTree[3][11].childs[0] = 12;

SkillTree[3][12].skillId = 12007;
SkillTree[3][12].parent = 11;
SkillTree[3][12].childs[0] = 13;

SkillTree[3][13].skillId = 12010;
SkillTree[3][13].parent = 12;
SkillTree[3][13].childs[0] = 14;

SkillTree[3][14].skillId = 12013;
SkillTree[3][14].parent = 13;
SkillTree[3][14].childs[0] = 15;

SkillTree[3][15].skillId = 12020;
SkillTree[3][15].childs[0] = 16;
SkillTree[3][15].childs[1] = 19;

SkillTree[3][16].skillId = 12023;
SkillTree[3][16].parent = 15;
SkillTree[3][16].childs[0] = 17;

SkillTree[3][17].skillId = 12026;
SkillTree[3][17].parent = 16;
SkillTree[3][17].childs[0] = 18;

SkillTree[3][18].skillId = 12025;
SkillTree[3][18].parent = 17;

SkillTree[3][19].skillId = 12021;
SkillTree[3][19].parent = 15;
SkillTree[3][19].childs[0] = 20;

SkillTree[3][20].skillId = 12024;
SkillTree[3][20].parent = 19;
SkillTree[3][20].childs[0] = 21;

SkillTree[3][21].skillId = 12022;
SkillTree[3][21].parent = 20;

--4
SkillTree[4][0].skillId = 13001;
SkillTree[4][0].childs[0] = 1;
SkillTree[4][0].childs[1] = 7;

SkillTree[4][1].skillId = 13003;
SkillTree[4][1].parent = 0;
SkillTree[4][1].childs[0] = 2;

SkillTree[4][2].skillId = 13005;
SkillTree[4][2].parent = 1;
SkillTree[4][2].childs[0] = 3;

SkillTree[4][3].skillId = 13008;
SkillTree[4][3].parent = 2;
SkillTree[4][3].childs[0] = 4;
SkillTree[4][3].childs[1] = 5;

SkillTree[4][4].skillId = 13012;
SkillTree[4][4].parent = 3;
SkillTree[4][4].childs[0] = 6;

SkillTree[4][5].skillId = 13011;
SkillTree[4][5].parent = 3;
SkillTree[4][5].childs[0] = 6;

SkillTree[4][6].skillId = 13014;
SkillTree[4][6].parent = 5;
SkillTree[4][6].parentB = 4;
SkillTree[4][6].childs[0] = 14;

SkillTree[4][7].skillId = 13002;
SkillTree[4][7].parent = 0;
SkillTree[4][7].childs[0] = 8;

SkillTree[4][8].skillId = 13004;
SkillTree[4][8].parent = 7;
SkillTree[4][8].childs[0] = 9;
SkillTree[4][8].childs[1] = 12;

SkillTree[4][9].skillId = 13007;
SkillTree[4][9].parent = 8;
SkillTree[4][9].childs[0] = 10;

SkillTree[4][10].skillId = 13010;
SkillTree[4][10].parent = 9;
SkillTree[4][10].childs[0] = 11;

SkillTree[4][11].skillId = 13013;
SkillTree[4][11].parent = 10;
SkillTree[4][11].childs[0] = 14;

SkillTree[4][12].skillId = 13006;
SkillTree[4][12].parent = 8;
SkillTree[4][12].childs[0] = 13;

SkillTree[4][13].skillId = 13009;
SkillTree[4][13].parent = 12;
SkillTree[4][13].childs[0] = 14;

SkillTree[4][14].skillId = 14026;
SkillTree[4][14].childs[1] = 18;
SkillTree[4][14].childs[0] = 15;

SkillTree[4][15].skillId = 13019;
SkillTree[4][15].parent = 14;
SkillTree[4][15].childs[0] = 16;

SkillTree[4][16].skillId = 13022;
SkillTree[4][16].parent = 15;
SkillTree[4][16].childs[0] = 17;

SkillTree[4][17].skillId = 13024;
SkillTree[4][17].parent = 16;

SkillTree[4][18].skillId = 13023;
SkillTree[4][18].parent = 14;
SkillTree[4][18].childs[0] = 19;

SkillTree[4][19].skillId = 13021;
SkillTree[4][19].parent = 18;
SkillTree[4][19].childs[0] = 20;

SkillTree[4][20].skillId = 13020;
SkillTree[4][20].parent = 19;

SkillTree[4][21].skillId = 13025;