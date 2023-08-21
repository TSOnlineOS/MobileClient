
SceneData = {}
SceneData.__index = SceneData;

function SceneData.GuessNumberD(guessNumber)
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

function SceneData.New()
  local self = {};
  setmetatable(self, SceneData);

  self.name = ""; --場景名稱
  self.subId = 0;
  self.kind = 0; --副本種類(0:無 1:靜態 2:動態)
  self.maxPlayer = 0; --最大人數
  self.limits = {}; --場景限制
  self.limits[1] = 0; --限制條件1(0:無限制 1:不可丟棄物品 2:不可使用道具 4:不可使用卷軸 8:不可使用符咒 16:不可進行安全交易 32:不可交易武將 64:不可設攤 128:不可快遞)
  self.limits[2] = 0; --限制條件2(0:無限制 1:不可PK NPC 2:不可PK玩家 4:不可參戰 8:不可騎馬 16:不可使用機關盒 32:不顯示跟隨武將 64:不可組隊 128:強制PK)
  self.effect = 0; --場景特效 (0:無特效 1:落葉 2:雪花 4:雷雨 8:黑暗 16:流星 32:純下雨)
  self.minLv = 0; --建議最低等級
  self.maxLv = 0; --建議最高等級
  self.viewSetting = 0; --顯示條件(0:無限制 1:不顯示自身武將 2:不顯示他人武將 4:不顯示其他玩家)
  self.scenes = {}; --可到的場景編號
  self.limits[3] = 0; --限制條件3(0:無限制 1:死亡不減少經驗值)
  return self;
end

function SceneData.GuessNumber1(guessNumber)
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

function SceneData.GuessNumber2(guessNumber)
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

function SceneData.ReadSceneData(reader)
  local data = {};

  local id = reader:ReadUInt16();
  local tag = reader:ReadByte(false); --tag

  data.name = reader:ReadString(20, false); --場景名
  data.towardScenes = {}; --可到的場景編號
  for i = 1, 55 do
    data.towardScenes[i] = reader:ReadUInt16();
  end

  return id, tag, data;
end

function SceneData.GuessNumber3(guessNumber)
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

function SceneData.GuessNumber4(guessNumber)
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

function SceneData.ReadSceneSetData(reader)
  local data = {};

  data.name = string.Get(reader:ReadUInt32()); --場景名

  local id = reader:ReadUInt16();

  data.kind = reader:ReadByte();
  data.maxPlayer = reader:ReadUInt16();
  data.limits = {};
  data.limits[1] = reader:ReadByte();
  data.limits[2] = reader:ReadByte();  
  data.effect = reader:ReadByte();
  data.minLv = reader:ReadByte();
  data.maxLv = reader:ReadByte();
  data.viewSetting = reader:ReadByte();
  data.subId = reader:ReadByte();
  data.limits[3] = reader:ReadByte();  

  if Define.TextCount then
    DataManager.textCount = DataManager.textCount + string.Count(data.name);
  end
  
  return id, data;
end

function SceneData.GuessNumber5(guessNumber)
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