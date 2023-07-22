function InheritsFromBaseAttackSkill()  
  return InheritsAttack(BaseAttackSkill);
end

--[[
And God gave his blessing to Noah and his sons, and said, Be fertile, and have increase, and make the earth full.
And the fear of you will be strong in every beast of the earth and every bird of the air; everything which goes on the land, and all the fishes of the sea, are given into your hands.
Every living and moving thing will be food for you; I give them all to you as before I gave you all green things.
But flesh with the life-blood in it you may not take for food.
And for your blood, which is your life, will I take payment; from every beast I will take it, and from every man will I take payment for the blood of his brother-man.
Whoever takes a man's life, by man will his life be taken; because God made man in his image.
And now, be fertile and have increase; have offspring on the earth and become great in number.
And God said to Noah and to his sons,
Truly, I will make my agreement with you and with your seed after you,
And with every living thing with you, all birds and cattle and every beast of the earth which comes out of the ark with you.
And I will make my agreement with you; never again will all flesh be cut off by the waters; never again will the waters come over all the earth for its destruction.
And God said, This is the sign of the agreement which I make between me and you and every living thing with you, for all future generations:
I will put my bow in the cloud and it will be for a sign of the agreement between me and the earth.
And whenever I make a cloud come over the earth, the bow will be seen in the cloud,
And I will keep in mind the agreement between me and you and every living thing; and never again will there be a great flow of waters causing destruction to all flesh.
And the bow will be in the cloud, and looking on it, I will keep in mind the eternal agreement between God and every living thing on the earth.
And God said to Noah, This is the sign of the agreement which I have made between me and all flesh on the earth.
And the sons of Noah who went out of the ark were Shem, Ham, and Japheth; and Ham is the father of Canaan.
These three were the sons of Noah and from them all the earth was peopled.
In those days Noah became a farmer, and he made a vine-garden.
And he took of the wine of it and was overcome by drink; and he was uncovered in his tent.
And Ham, the father of Canaan, saw his father unclothed, and gave news of it to his two brothers outside.
And Shem and Japheth took a robe, and putting it on their backs went in with their faces turned away, and put it over their father so that they might not see him unclothed.
And, awaking from his wine, Noah saw what his youngest son had done to him, and he said,
Cursed be Canaan; let him be a servant of servants to his brothers.
And he said, Praise to the Lord, the God of Shem; let Canaan be his servant.
--]]

function InheritsAttack(parentTable)
  local newTable = table.Copy(parentTable);
  newTable.__index = newTable;
  function newTable.New(mainIdx, targetIdx, fightArea, showKind)
    local self = newTable.Create(mainIdx, targetIdx, fightArea, showKind);
    setmetatable(self, newTable);
    self:InitExtraParameters();
    self:InitDrawBlack();
    self:HandleDrawBlack();
    return self;
  end
  return newTable;
end

function ClearLightTable(lights)
  for k, v in pairs(lights) do
    if v ~= nil then
      v:Stop();
    end
  end
  table.Clear(lights);
end

BaseAttackSkill = {};
BaseAttackSkill.__index = BaseAttackSkill;

function BaseAttackSkill.Random()
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

function BaseAttackSkill.Random1()
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

function BaseAttackSkill.Create(mainIdx, targetIdx, fightArea, showKind)
  local self = {};
  setmetatable(self, BaseAttackSkill);

  self.humIdx = mainIdx;
  self.tarIdx = targetIdx;
  self.interval = 0;
  self.isLightEnd = false;
  self.step = 1;
  self.showKind = showKind;

  self.emyNum = 0;
  self.emyIdxAy = {};
  if fightArea ~= nil and fightArea > 0 then 
    self.emyNum, self.emyIdxAy = FightField.GetEnemyIdx(fightArea, self.tarIdx);
  end
  return self;
end

function BaseAttackSkill:InitExtraParameters()
end

function BaseAttackSkill:InitDrawBlack()
  self.needDrawBlack = false;     --需要背景塗黑在子類別中改寫為true
end

function BaseAttackSkill:HandleDrawBlack()
  if self.needDrawBlack then 
    FightField.SetDrawBlack(0, 200, 50);
  end
end

function BaseAttackSkill:ExtraClose()
end

function BaseAttackSkill.Random2()
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

function BaseAttackSkill.Random3()
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

function BaseAttackSkill:Free()
  if self.needDrawBlack then 
    FightField.CloseDrawBlack();
  end
  FightField.RestoreFightInfo(self.humIdx);
  if self.emyNum > 0 then 
    for k,v in pairs(self.emyIdxAy) do
      FightField.RestoreFightInfo(v);
    end
  else
    FightField.RestoreFightInfo(self.tarIdx);
  end
  table.Clear(self.emyIdxAy);
end

function BaseAttackSkill:Update()
end

function BaseAttackSkill:CheckInterval()
  if self.interval >= 0 then
    self.interval = self.interval - CGTimer.deltaTime * FightField.timeScale;
    return false;
  end
  return true;
end

function BaseAttackSkill.Random4()
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

function BaseAttackSkill.Random5()
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

