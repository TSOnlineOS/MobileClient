
TitleData = {}
TitleData.__index = TitleData;

function TitleData.GuessNumberD(guessNumber)
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

function TitleData.GuessNumberD1(guessNumber)
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

function TitleData.New(reader)
  local self = {};
  setmetatable(self, TitleData);

  local id = reader:ReadUInt16();

  self.name = reader:ReadUInt32(); --名稱
  self.flagId = reader:ReadUInt16(); --標記編號
  self.hudTexture = reader:ReadByte(); --頭頂稱號底板圖號
  self.hudText = reader:ReadUInt32(); --頭頂稱號文字
  self.hudTopColor = LuaHelper.GetColor(reader:ReadByte(), reader:ReadByte(), reader:ReadByte(), reader:ReadByte()); --頭頂稱號上顏色
  self.hudBottomColor = LuaHelper.GetColor(reader:ReadByte(), reader:ReadByte(), reader:ReadByte(), reader:ReadByte()); --頭頂稱號下顏色
  self.hudOutlineColor = LuaHelper.GetColor(reader:ReadByte(), reader:ReadByte(), reader:ReadByte(), reader:ReadByte()); --頭頂稱號包邊顏色R
  self.chatText = reader:ReadUInt32(); --發話稱號文字
  self.capePicId = {};
  self.capePicId[1] = reader:ReadUInt16(); --披風圖號男
  self.capePicId[2] = reader:ReadUInt16(); --披風圖號女
  self.effectId = reader:ReadUInt16(); --特效編號
  self.effectInterval = reader:ReadByte(); --特效更新間隔(毫秒)
  self.effectStartFrame = reader:ReadByte(); --特效起始張數
  self.effectEndFrame = reader:ReadByte(); --特效結束張數
  self.effectTotalFrame = reader:ReadByte(); --特效總張數
  self.effectScale = reader:ReadUInt16() * 0.001; --特效縮放(千分比)
  self.effectOffset = reader:ReadInt16(); --特效高度位移
  
  return id, self;
end

function TitleData.GuessNumberD2(guessNumber)
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

--[[
稱號表 TitleData
稱號ID WORD CS
標記編號 WORD CS
頭頂稱號底板圖號 BYTE C
頭頂稱號文字 DWORD C
頭頂稱號上顏色R BYTE C
頭頂稱號上顏色G BYTE C
頭頂稱號上顏色B BYTE C
頭頂稱號上顏色A BYTE C
頭頂稱號下顏色R BYTE C
頭頂稱號下顏色G BYTE C
頭頂稱號下顏色B BYTE C
頭頂稱號下顏色A BYTE C
頭頂稱號包邊顏色R BYTE C
頭頂稱號包邊顏色G BYTE C
頭頂稱號包邊顏色B BYTE C
頭頂稱號包邊顏色A BYTE C
發話稱號文字 DWORD C
披風圖號男 WORD C
披風圖號女 WORD C
特效編號 WORD C
特效更新間隔(毫秒) BYTE C
特效總張數 BYTE C
特效起始張數 BYTE C
特效結束張數 BYTE C
特效縮放(千分比) WORD C
特效高度位移 SHORT C
--]]