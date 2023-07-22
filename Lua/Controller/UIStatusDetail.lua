UIStatusDetail = {}
UIStatusDetail.__index = UIStatusDetail;

function UIStatusDetail.New(parent)
  local self = {};
  setmetatable(self, UIStatusDetail);

  self.gameObject = poolMgr:Get("BaseUIStatusDetail");
  self.transform = self.gameObject.transform;
  self.rectTransform = self.gameObject:GetComponent("RectTransform");
  self.rectTransform:SetParent(parent.transform);
  self.rectTransform:SetSiblingIndex(0);
  self.rectTransform.localScale = Vector3.one;
  self.rectTransform.anchoredPosition = Vector2.zero;
  self.rectTransform.sizeDelta = Vector2.New(365, 405);

  local tempTransform = self.transform:Find("Image_"):Find("Scroll View"):Find("DetailContent");
  self.text_DetailAttr = tempTransform:Find("Text_DetailAttr"):GetComponent("Text");
  self.text_DetailDrug = tempTransform:Find("Text_DetailDrug"):GetComponent("Text");
  self.text_Info = tempTransform:Find("Text_Info"):GetComponent("Text");
  self.text_Pill = tempTransform:Find("Text_Pill"):GetComponent("Text");
  self.text_Info.text = string.Get(20825);
  self.text_Pill.text = string.Get(20826);
  self.sizeFitter_DetailAttr = self.text_DetailAttr.transform:GetComponent("ContentSizeFitter");
  self.sizeFitter_DetailDrug = self.text_DetailDrug.transform:GetComponent("ContentSizeFitter");
  self.detailArrow = self.transform:Find("DetailArrow").gameObject;
  
  return self;
end

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

function UIStatusDetail:Destroy()
  poolMgr:Release("BaseUIStatusDetail", self.gameObject);
end

function UIStatusDetail:ShowInfo(currentRole, attComponents)
  local turn = currentRole:GetAttribute(EAttribute.Turn);
  local career = currentRole:GetAttribute(EAttribute.Career);
  local level = currentRole:GetAttribute(EAttribute.Lv);
  local turn3Lv = 0;
  
  if turn >= 3 then
    turn3Lv = level - Role.playerMaxLv;
    level = Role.playerMaxLv;
  end
  
  if LuaHelper.CheckDefine("DemoCode") then
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      human = satan + haven;
    else
      human = satan - haven;
    end
  
    local folk = 69;
    local dog = 27;
    local stupid = 0;
    if stupid ~= nil then
      stupid = folk + dog;
    else
      stupid = stupid + 1;
    end
  end
  
  local baseValue = 0;
  local equipAdd = 0;
  local equipMaxValue = 0;
  local extraValue = 0;
  local otherAdd = 0;
  local content = "";
  local shineAtts = Calc.GetCollectNFT();
  
  --hp
  baseValue = currentRole:GetAttribute(EAttribute.Hpx);
  equipAdd = currentRole:GetAttribute(EAttribute.EquipHpx);
  equipMaxValue = currentRole:GetAttribute(EAttribute.EquipMaxHp);
  extraValue = currentRole.data.hpPillCount * Role.hpPillAdd;
  otherAdd = 0;
  if currentRole == Role.player then
    --BUFF加成
    otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Buff, EAttribute.EquipHpx);
    --增益狀態加成
    otherAdd = otherAdd + DrugBuff.GetAttribute(EDrugAttribute.Hpx);
    --七星命盤加成
    otherAdd = otherAdd + math.round(Astrolabe.GetAttribute(EAstrolabeAttribute.Hpx));
    --三轉加成
    if turn == 3 then
      otherAdd = otherAdd + math.min(turn3Lv, 70);
    end
    otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Turn3Hpx);
    --官階加成
    equipMaxValue = equipMaxValue + RankData.GetAttribute(currentRole:GetAttribute(EAttribute.BattleHonor), EAttribute.EquipMaxHp);
    --座騎加成
    extraValue = extraValue + math.floor((Mounts.GetAttribute(EAttribute.ExtraHp) + Mounts.GetAttribute(EAttribute.EquipMaxHp)) * Mounts.collectionBonus);
    --NFT收集加成
    if shineAtts[EAttribute.Hpx] ~= nil then
      otherAdd = otherAdd + shineAtts[EAttribute.Hpx];
    end
  elseif currentRole == Role.fightNpc then
    --增益狀態加成
    otherAdd = otherAdd + DrugBuff.GetAttribute(EDrugAttribute.Hpx);
  end
  --收集加成
  otherAdd = otherAdd + CollectStyle.GetAttribute(EAttribute.Hpx);
  otherAdd = otherAdd + CollectCard.GetAttribute(EAttribute.Hpx);
  
  content = string.Concat(content, string.Get(20403), " ", Calc.GetMaxHp(currentRole, level, baseValue + equipAdd + otherAdd, equipMaxValue, extraValue, turn, career, turn3Lv, currentRole.kind == EHuman.FollowNpc));
  if attComponents ~= nil and attComponents[4].add > 0 then
    content = string.Concat(content, string.GetColorText(string.Concat("(", Calc.GetMaxHp(currentRole, level, baseValue + equipAdd + otherAdd + attComponents[4].add, equipMaxValue, extraValue, turn, career, turn3Lv, currentRole.kind == EHuman.FollowNpc), ")"), Color.DarkGreen));
  end
  content = string.Concat(content, "\n");
  
  --sp
  baseValue = currentRole:GetAttribute(EAttribute.Spx);
  equipAdd = currentRole:GetAttribute(EAttribute.EquipSpx);
  equipMaxValue = currentRole:GetAttribute(EAttribute.EquipMaxSp);
  extraValue = currentRole.data.spPillCount * Role.spPillAdd;
  otherAdd = 0;
  if currentRole == Role.player then
    --BUFF加成
    otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Buff, EAttribute.EquipSpx);
    --增益狀態加成
    otherAdd = otherAdd + DrugBuff.GetAttribute(EDrugAttribute.Spx);
    --七星命盤加成
    otherAdd = otherAdd + math.round(Astrolabe.GetAttribute(EAstrolabeAttribute.Spx));
    --三轉加成
    if turn == 3 then
      otherAdd = otherAdd + turn3Lv;
    end
    otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Turn3Spx);
    --官階加成
    equipMaxValue = equipMaxValue + RankData.GetAttribute(currentRole:GetAttribute(EAttribute.BattleHonor), EAttribute.EquipMaxSp);
    --座騎加成
    extraValue = extraValue + math.floor((Mounts.GetAttribute(EAttribute.ExtraSp) + Mounts.GetAttribute(EAttribute.EquipMaxSp)) * Mounts.collectionBonus);
    --NFT收集加成
    if shineAtts[EAttribute.Spx] ~= nil then
      otherAdd = otherAdd + shineAtts[EAttribute.Spx];
    end
  elseif currentRole == Role.fightNpc then
    --增益狀態加成
    otherAdd = otherAdd + DrugBuff.GetAttribute(EDrugAttribute.Spx);
  end
  --收集加成
  otherAdd = otherAdd + CollectStyle.GetAttribute(EAttribute.Spx);
  otherAdd = otherAdd + CollectCard.GetAttribute(EAttribute.Spx);
  
  content = string.Concat(content, string.Get(20404), " ", Calc.GetMaxSp(currentRole, level, baseValue + equipAdd + otherAdd, equipMaxValue, extraValue, turn, career, turn3Lv, currentRole.kind == EHuman.FollowNpc));
  if attComponents ~= nil and attComponents[5].add > 0 then
    content = string.Concat(content, string.GetColorText(string.Concat("(", Calc.GetMaxSp(currentRole, level, baseValue + equipAdd + otherAdd + attComponents[5].add, equipMaxValue, extraValue, turn, career, turn3Lv, currentRole.kind == EHuman.FollowNpc), ")"), Color.DarkGreen));
  end
  content = string.Concat(content, "\n");
  
  --exp
  if currentRole ~= Role.player then
    if turn == 2 then
      turn = 1;
    else
      turn = 0;
    end
  end
  
  if turn >= 3 then
    if turn3Lv == Role.playerMaxLv + Role.playerTurn3MaxLv then
      content = string.Concat(content, string.Get(20185), " ", string.Get(40475), "\n");
    else
      content = string.Concat(content, string.Get(20185), " ", (currentRole:GetAttribute(EAttribute.Turn3Exp) - Calc.GetNeedTExp(turn3Lv, turn)), "/", Calc.GetUpExp(turn3Lv + 1, turn), "\n");
    end
  else
    if level == Role.playerMaxLv then
      content = string.Concat(content, string.Get(20185), " ", string.Get(40475), "\n");
    else
      content = string.Concat(content, string.Get(20185), " ", (currentRole:GetAttribute(EAttribute.Exp) - Calc.GetNeedTExp(level, turn)), "/", Calc.GetUpExp(level + 1, turn), "\n");
    end
  end
  
  --Int
  baseValue = currentRole:GetAttribute(EAttribute.Int);
  equipAdd = currentRole:GetAttribute(EAttribute.EquipInt) + math.round(currentRole:GetAttribute(EAttribute.Int) * (currentRole:GetAttribute(EAttribute.IntPercent) * 0.01));
  otherAdd = 0;
  if currentRole == Role.player then
    otherAdd = otherAdd + DrugBuff.GetAttribute(EDrugAttribute.Int);
    otherAdd = otherAdd + DrugBuff.timeBuffs[ETimeBuff.IntUp].value;
    otherAdd = otherAdd + Astrolabe.GetAttribute(EAstrolabeAttribute.Int);
    otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Buff, EAttribute.Int);
    otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Turn3Int);
    otherAdd = otherAdd + math.floor((Mounts.GetAttribute(EAttribute.Int) + Mounts.GetAttribute(EAttribute.EquipInt)) * Mounts.collectionBonus);
    --NFT收集加成
    if shineAtts[EAttribute.Int] ~= nil then
      otherAdd = otherAdd + shineAtts[EAttribute.Int];
    end
  elseif currentRole == Role.fightNpc then
    otherAdd = otherAdd + DrugBuff.GetAttribute(EDrugAttribute.Int);
  end
  otherAdd = otherAdd + CollectStyle.GetAttribute(EAttribute.Int);
  otherAdd = otherAdd + CollectCard.GetAttribute(EAttribute.Int);
  
  content = string.Concat(content, string.Get(20037), " ", baseValue);
  if equipAdd >= 0 then content = string.Concat(content, "+", equipAdd) else content = string.Concat(content, equipAdd) end
  if otherAdd >= 0 then content = string.Concat(content, "+", otherAdd) else content = string.Concat(content, otherAdd) end
  content = string.Concat(content, "=", (baseValue + equipAdd + otherAdd));
  
  if attComponents ~= nil and attComponents[1].add > 0 then
    content = string.Concat(content, string.GetColorText(string.Concat("(", (baseValue + equipAdd + otherAdd + attComponents[1].add), ")"), Color.DarkGreen));
  end
  content = string.Concat(content, "\n");
  
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
  
  --Atk
  baseValue = currentRole:GetAttribute(EAttribute.Atk);
  equipAdd = currentRole:GetAttribute(EAttribute.EquipAtk) + math.round(currentRole:GetAttribute(EAttribute.Atk) * (currentRole:GetAttribute(EAttribute.AtkPercent) * 0.01));
  
  otherAdd = 0;
  if currentRole == Role.player then
    otherAdd = otherAdd + DrugBuff.GetAttribute(EDrugAttribute.Atk);
    otherAdd = otherAdd + DrugBuff.timeBuffs[ETimeBuff.AtkUp].value;
    otherAdd = otherAdd + Astrolabe.GetAttribute(EAstrolabeAttribute.Atk);
    otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Buff, EAttribute.Atk);
    otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Turn3Atk);
    otherAdd = otherAdd + math.floor((Mounts.GetAttribute(EAttribute.Atk) + Mounts.GetAttribute(EAttribute.EquipAtk)) * Mounts.collectionBonus);
    --NFT收集加成
    if shineAtts[EAttribute.Atk] ~= nil then
      otherAdd = otherAdd + shineAtts[EAttribute.Atk];
    end
  elseif currentRole == Role.fightNpc then
    otherAdd = otherAdd + DrugBuff.GetAttribute(EDrugAttribute.Atk);
  end
  otherAdd = otherAdd + CollectStyle.GetAttribute(EAttribute.Atk);
  otherAdd = otherAdd + CollectCard.GetAttribute(EAttribute.Atk);
  
  content = string.Concat(content, string.Get(20038), " ", baseValue);
  if equipAdd >= 0 then content = string.Concat(content, "+", equipAdd) else content = string.Concat(content, equipAdd) end
  if otherAdd >= 0 then content = string.Concat(content, "+", otherAdd) else content = string.Concat(content, otherAdd) end
  content = string.Concat(content, "=", (baseValue + equipAdd + otherAdd));
  if attComponents ~= nil and attComponents[2].add > 0 then
    content = string.Concat(content, string.GetColorText(string.Concat("(", (baseValue + equipAdd + otherAdd + attComponents[2].add), ")"), Color.DarkGreen));
  end
  content = string.Concat(content, "\n");
  
  --Def
  baseValue = currentRole:GetAttribute(EAttribute.Def);
  equipAdd = currentRole:GetAttribute(EAttribute.EquipDef) + math.round(currentRole:GetAttribute(EAttribute.Def) * (currentRole:GetAttribute(EAttribute.DefPercent) * 0.01));
  otherAdd = 0;
  if currentRole == Role.player then
    otherAdd = otherAdd + DrugBuff.GetAttribute(EDrugAttribute.Def);
    otherAdd = otherAdd + DrugBuff.timeBuffs[ETimeBuff.DefUp].value;
    otherAdd = otherAdd + Astrolabe.GetAttribute(EAstrolabeAttribute.Def);
    otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Buff, EAttribute.Def);
    otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Turn3Def);
    otherAdd = otherAdd + math.floor((Mounts.GetAttribute(EAttribute.Def) + Mounts.GetAttribute(EAttribute.EquipDef)) * Mounts.collectionBonus);
    --NFT收集加成
    if shineAtts[EAttribute.Def] ~= nil then
      otherAdd = otherAdd + shineAtts[EAttribute.Def];
    end
  elseif currentRole == Role.fightNpc then
    otherAdd = otherAdd + DrugBuff.GetAttribute(EDrugAttribute.Def);
  end
  otherAdd = otherAdd + CollectStyle.GetAttribute(EAttribute.Def);
  otherAdd = otherAdd + CollectCard.GetAttribute(EAttribute.Def);
  
  content = string.Concat(content, string.Get(20039), " ", baseValue);
  if equipAdd >= 0 then content = string.Concat(content, "+", equipAdd) else content = string.Concat(content, equipAdd) end
  if otherAdd >= 0 then content = string.Concat(content, "+", otherAdd) else content = string.Concat(content, otherAdd) end
  content = string.Concat(content, "=", (baseValue + equipAdd + otherAdd));
  if attComponents ~= nil and attComponents[3].add > 0 then
    content = string.Concat(content, string.GetColorText(string.Concat("(", (baseValue + equipAdd + otherAdd + attComponents[3].add), ")"), Color.DarkGreen));
  end
  content = string.Concat(content, "\n");
  
  --Hpx
  baseValue = currentRole:GetAttribute(EAttribute.Hpx);
  equipAdd = currentRole:GetAttribute(EAttribute.EquipHpx);
  otherAdd = 0;
  if currentRole == Role.player then
    otherAdd = otherAdd + DrugBuff.GetAttribute(EDrugAttribute.Hpx);
    otherAdd = otherAdd + DrugBuff.timeBuffs[ETimeBuff.HpxUp].value;
    otherAdd = otherAdd + Astrolabe.GetAttribute(EAstrolabeAttribute.Hpx);
    otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Buff, EAttribute.Hpx);
    otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Turn3Hpx);
    --NFT收集加成
    if shineAtts[EAttribute.Hpx] ~= nil then
      otherAdd = otherAdd + shineAtts[EAttribute.Hpx];
    end
  elseif currentRole == Role.fightNpc then
    otherAdd = otherAdd + DrugBuff.GetAttribute(EDrugAttribute.Hpx);
  end
  otherAdd = otherAdd + CollectStyle.GetAttribute(EAttribute.Hpx);
  otherAdd = otherAdd + CollectCard.GetAttribute(EAttribute.Hpx);
  
  content = string.Concat(content, string.Get(20040), " ", baseValue);
  if equipAdd >= 0 then content = string.Concat(content, "+", equipAdd) else content = string.Concat(content, equipAdd) end
  if otherAdd >= 0 then content = string.Concat(content, "+", otherAdd) else content = string.Concat(content, otherAdd) end
  content = string.Concat(content, "=", (baseValue + equipAdd + otherAdd));
  if attComponents ~= nil and attComponents[4].add > 0 then
    content = string.Concat(content, string.GetColorText(string.Concat("(", (baseValue + equipAdd + otherAdd + attComponents[4].add), ")"), Color.DarkGreen));
  end
  content = string.Concat(content, "\n");
  
  --Spx
  baseValue = currentRole:GetAttribute(EAttribute.Spx);
  equipAdd = currentRole:GetAttribute(EAttribute.EquipSpx);
  otherAdd = 0;
  if currentRole == Role.player then
    otherAdd = otherAdd + DrugBuff.GetAttribute(EDrugAttribute.Spx);
    otherAdd = otherAdd + DrugBuff.timeBuffs[ETimeBuff.SpxUp].value;
    otherAdd = otherAdd + Astrolabe.GetAttribute(EAstrolabeAttribute.Spx);
    otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Buff, EAttribute.Spx);
    otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Turn3Spx);
    --NFT收集加成
    if shineAtts[EAttribute.Spx] ~= nil then
      otherAdd = otherAdd + shineAtts[EAttribute.Spx];
    end
  elseif currentRole == Role.fightNpc then
    otherAdd = otherAdd + DrugBuff.GetAttribute(EDrugAttribute.Spx);
  end
  otherAdd = otherAdd + CollectStyle.GetAttribute(EAttribute.Spx);
  otherAdd = otherAdd + CollectCard.GetAttribute(EAttribute.Spx);
  
  content = string.Concat(content, string.Get(20041), " ", baseValue);
  if equipAdd >= 0 then content = string.Concat(content, "+", equipAdd) else content = string.Concat(content, equipAdd) end
  if otherAdd >= 0 then content = string.Concat(content, "+", otherAdd) else content = string.Concat(content, otherAdd) end
  content = string.Concat(content, "=", (baseValue + equipAdd + otherAdd));
  if attComponents ~= nil and attComponents[5].add > 0 then
    content = string.Concat(content, string.GetColorText(string.Concat("(", (baseValue + equipAdd + otherAdd + attComponents[5].add), ")"), Color.DarkGreen));
  end
  content = string.Concat(content, "\n");
  
  --Agi
  baseValue = currentRole:GetAttribute(EAttribute.Agi);
  equipAdd = currentRole:GetAttribute(EAttribute.EquipAgi);
  otherAdd = 0;
  if currentRole == Role.player then
    otherAdd = otherAdd + DrugBuff.GetAttribute(EDrugAttribute.Agi);
    otherAdd = otherAdd + DrugBuff.timeBuffs[ETimeBuff.AgiUp].value;
    otherAdd = otherAdd + Astrolabe.GetAttribute(EAstrolabeAttribute.Agi);
    otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Buff, EAttribute.Agi);
    otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Turn3Agi);
    --NFT收集加成
    if shineAtts[EAttribute.Agi] ~= nil then
      otherAdd = otherAdd + shineAtts[EAttribute.Agi];
    end
  elseif currentRole == Role.fightNpc then
    otherAdd = otherAdd + DrugBuff.GetAttribute(EDrugAttribute.Agi);
  end
  otherAdd = otherAdd + CollectStyle.GetAttribute(EAttribute.Agi);
  otherAdd = otherAdd + CollectCard.GetAttribute(EAttribute.Agi);
  
  content = string.Concat(content, string.Get(20042), " ", baseValue);
  if equipAdd >= 0 then content = string.Concat(content, "+", equipAdd) else content = string.Concat(content, equipAdd) end
  if otherAdd >= 0 then content = string.Concat(content, "+", otherAdd) else content = string.Concat(content, otherAdd) end
  content = string.Concat(content, "=", (baseValue + equipAdd + otherAdd));
  if attComponents ~= nil and attComponents[6].add > 0 then
    content = string.Concat(content, string.GetColorText(string.Concat("(", (baseValue + equipAdd + otherAdd + attComponents[6].add), ")"), Color.DarkGreen));
  end
  
  --Crit 暴擊率(%)
  content = string.Concat(content, "\n");
  baseValue = 0;
  equipAdd = currentRole:GetAttribute(EAttribute.Crit);
  otherAdd = 0;
  otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Buff, EAttribute.Crit);
  content = string.Concat(content, string.Get(80318), " ", baseValue);
  if equipAdd >= 0 then content = string.Concat(content, "+", equipAdd) else content = string.Concat(content, equipAdd) end
  if otherAdd >= 0 then content = string.Concat(content, "+", otherAdd) else content = string.Concat(content, otherAdd) end
  content = string.Concat(content, "=", (baseValue + equipAdd + otherAdd));
  
  --CritDamage 暴擊傷害(%)
  content = string.Concat(content, "\n");
  baseValue = 50;  --初始值
  equipAdd = currentRole:GetAttribute(EAttribute.CritDamage);
  otherAdd = 0;
  otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Buff, EAttribute.CritDamage);
  content = string.Concat(content, string.Get(23658), " ", baseValue);
  if equipAdd >= 0 then content = string.Concat(content, "+", equipAdd) else content = string.Concat(content, equipAdd) end
  if otherAdd >= 0 then content = string.Concat(content, "+", otherAdd) else content = string.Concat(content, otherAdd) end
  content = string.Concat(content, "=", (baseValue + equipAdd + otherAdd));
  
  --Dodge 閃躲(1~30%)
  content = string.Concat(content, "\n");
  baseValue = 0;
  equipAdd = currentRole:GetAttribute(EAttribute.Dodge);
  otherAdd = 0;
  otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Buff, EAttribute.Dodge);
  content = string.Concat(content, string.Get(23665), " ", baseValue);
  if equipAdd >= 0 then content = string.Concat(content, "+", equipAdd) else content = string.Concat(content, equipAdd) end
  if otherAdd >= 0 then content = string.Concat(content, "+", otherAdd) else content = string.Concat(content, otherAdd) end
  content = string.Concat(content, "=", (baseValue + equipAdd + otherAdd));
  
  --Hit 命中(1~30%)
  content = string.Concat(content, "\n");
  baseValue = 0;
  equipAdd = currentRole:GetAttribute(EAttribute.Hit);
  otherAdd = 0;
  otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Buff, EAttribute.Hit);
  content = string.Concat(content, string.Get(23666), " ", baseValue);
  if equipAdd >= 0 then content = string.Concat(content, "+", equipAdd) else content = string.Concat(content, equipAdd) end
  if otherAdd >= 0 then content = string.Concat(content, "+", otherAdd) else content = string.Concat(content, otherAdd) end
  content = string.Concat(content, "=", (baseValue + equipAdd + otherAdd));
  
  --AtkPercent 攻擊力(%)
  content = string.Concat(content, "\n");
  baseValue = 0;
  equipAdd = currentRole:GetAttribute(EAttribute.AtkPercent);
  otherAdd = 0;
  otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Buff, EAttribute.AtkPercent);
  content = string.Concat(content, string.Get(23661), " ", baseValue);
  if equipAdd >= 0 then content = string.Concat(content, "+", equipAdd) else content = string.Concat(content, equipAdd) end
  if otherAdd >= 0 then content = string.Concat(content, "+", otherAdd) else content = string.Concat(content, otherAdd) end
  content = string.Concat(content, "=", (baseValue + equipAdd + otherAdd));
  
  --DefPercent 防禦力(%)
  content = string.Concat(content, "\n");
  baseValue = 0;
  equipAdd = currentRole:GetAttribute(EAttribute.DefPercent);
  otherAdd = 0;
  otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Buff, EAttribute.DefPercent);
  content = string.Concat(content, string.Get(23662), " ", baseValue);
  if equipAdd >= 0 then content = string.Concat(content, "+", equipAdd) else content = string.Concat(content, equipAdd) end
  if otherAdd >= 0 then content = string.Concat(content, "+", otherAdd) else content = string.Concat(content, otherAdd) end
  content = string.Concat(content, "=", (baseValue + equipAdd + otherAdd));
  
  --HpPercent 最大HP(%)
  content = string.Concat(content, "\n");
  baseValue = 0;
  equipAdd = currentRole:GetAttribute(EAttribute.HpPercent);
  otherAdd = 0;
  otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Buff, EAttribute.HpPercent);
  content = string.Concat(content, string.Get(23663), " ", baseValue);
  if equipAdd >= 0 then content = string.Concat(content, "+", equipAdd) else content = string.Concat(content, equipAdd) end
  if otherAdd >= 0 then content = string.Concat(content, "+", otherAdd) else content = string.Concat(content, otherAdd) end
  content = string.Concat(content, "=", (baseValue + equipAdd + otherAdd));
  
  --SpPercent 最大SP(%)
  content = string.Concat(content, "\n");
  baseValue = 0;
  equipAdd = currentRole:GetAttribute(EAttribute.SpPercent);
  otherAdd = 0;
  otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Buff, EAttribute.SpPercent);
  content = string.Concat(content, string.Get(23664), " ", baseValue);
  if equipAdd >= 0 then content = string.Concat(content, "+", equipAdd) else content = string.Concat(content, equipAdd) end
  if otherAdd >= 0 then content = string.Concat(content, "+", otherAdd) else content = string.Concat(content, otherAdd) end
  content = string.Concat(content, "=", (baseValue + equipAdd + otherAdd));
  
  --知力(%)
  content = string.Concat(content, "\n");
  baseValue = 0;
  equipAdd = currentRole:GetAttribute(EAttribute.IntPercent);
  otherAdd = 0;
  otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Buff, EAttribute.IntPercent);
  content = string.Concat(content, string.Get(23660), " ", baseValue);
  if equipAdd >= 0 then content = string.Concat(content, "+", equipAdd) else content = string.Concat(content, equipAdd) end
  if otherAdd >= 0 then content = string.Concat(content, "+", otherAdd) else content = string.Concat(content, otherAdd) end
  content = string.Concat(content, "=", (baseValue + equipAdd + otherAdd));
  
  --攻擊時HP回復
  content = string.Concat(content, "\n");
  baseValue = 0;
  equipAdd = currentRole:GetAttribute(EAttribute.StealHp);
  otherAdd = 0;
  otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Buff, EAttribute.StealHp);
  content = string.Concat(content, string.Get(23090), " ", baseValue);
  if equipAdd >= 0 then content = string.Concat(content, "+", equipAdd) else content = string.Concat(content, equipAdd) end
  if otherAdd >= 0 then content = string.Concat(content, "+", otherAdd) else content = string.Concat(content, otherAdd) end
  content = string.Concat(content, "=", (baseValue + equipAdd + otherAdd));
  
  --攻擊時SP回復
  content = string.Concat(content, "\n");
  baseValue = 0;
  equipAdd = currentRole:GetAttribute(EAttribute.StealSp);
  otherAdd = 0;
  otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Buff, EAttribute.StealSp);
  content = string.Concat(content, string.Get(23091), " ", baseValue);
  if equipAdd >= 0 then content = string.Concat(content, "+", equipAdd) else content = string.Concat(content, equipAdd) end
  if otherAdd >= 0 then content = string.Concat(content, "+", otherAdd) else content = string.Concat(content, otherAdd) end
  content = string.Concat(content, "=", (baseValue + equipAdd + otherAdd));
  
  if LuaHelper.CheckDefine("DemoCode") then
    local meaningless = 45;
    local shift = 2;
    local result = 0;
    bit.rshift(meaningless, shift)
    bit.lshift(meaningless, shift)
    if bit.band(meaningless,45) == 45 then
      result = meaningless * shift;
    end
  
    local folk = 69;
    local dog = 27;
    local stupid = 0;
    if stupid ~= nil then
      stupid = folk + dog;
    else
      stupid = stupid + 1;
    end
  end
  
  --異常狀態抵抗率
  content = string.Concat(content, "\n");
  baseValue = 0;
  equipAdd = currentRole:GetAttribute(EAttribute.ResistancePercent);
  otherAdd = 0;
  otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Buff, EAttribute.ResistancePercent);
  content = string.Concat(content, string.Get(23092), " ", baseValue);
  if equipAdd >= 0 then content = string.Concat(content, "+", equipAdd) else content = string.Concat(content, equipAdd) end
  if otherAdd >= 0 then content = string.Concat(content, "+", otherAdd) else content = string.Concat(content, otherAdd) end
  content = string.Concat(content, "=", (baseValue + equipAdd + otherAdd));
  
  --反傷率
  content = string.Concat(content, "\n");
  baseValue = 0;
  equipAdd = currentRole:GetAttribute(EAttribute.ReactiveDamage);
  otherAdd = 0;
  otherAdd = otherAdd + currentRole:GetAttribute(EAttribute.Buff, EAttribute.ReactiveDamage);
  content = string.Concat(content, string.Get(23093), " ", baseValue);
  if equipAdd >= 0 then content = string.Concat(content, "+", equipAdd) else content = string.Concat(content, equipAdd) end
  if otherAdd >= 0 then content = string.Concat(content, "+", otherAdd) else content = string.Concat(content, otherAdd) end
  content = string.Concat(content, "=", (baseValue + equipAdd + otherAdd));
  
  --faith
  if currentRole ~= Role.player then
    content = string.Concat(content, "\n", string.Get(20043), " ", currentRole:GetAttribute(EAttribute.Faith));
  end
  
  self.text_DetailAttr.text = content;
  
  content = "";
  
  if currentRole == Role.player then
    --太上金丹
    content = string.Concat(content, itemDatas[46130]:GetName(true), " ", currentRole.data.attrPillCount, "/", Role.maxAttrPill, "\n");
    
    --健體玉液
    content = string.Concat(content, itemDatas[46240]:GetName(true), " ", currentRole.data.hpPillCount, "/", Role.maxHpPill, "\n");
    
    --幻能玉液
    content = string.Concat(content, itemDatas[46238]:GetName(true), " ", currentRole.data.spPillCount, "/", Role.maxSpPill, "\n");
    
    --技能丹
    content = string.Concat(content, itemDatas[46395]:GetName(true), " ", currentRole.data.skillPillCount, "/", Role.maxSkillPill, "\n");
    
    --經驗丹
    if turn >= 3 then
      for i = 0, 8 do
        content = string.Concat(content, itemDatas[46211 + i]:GetName(true), " ", RoleCount.Get(ERoleCount.ExpPill + i), "/", Role.maxDailyExpPill, "\n");
      end
    end
  else
    --健體仙丹
    content = string.Concat(content, itemDatas[46241]:GetName(true), " ", currentRole.data.hpPillCount, "/", Role.npcMaxHpPill, "\n");
    
    --幻能仙丹
    content = string.Concat(content, itemDatas[46239]:GetName(true), " ", currentRole.data.spPillCount, "/", Role.npcMaxSpPill, "\n");
    
    --領悟丹
    content = string.Concat(content, string.Get(71182), " ", currentRole.data.graspPill.count, "/", Role.npcMaxGraspPill, "\n");
    
    --昇華丹
    content = string.Concat(content, string.Get(20899), " ", currentRole.data.sublimeCount, "/", Role.npcMaxSublimePill, "\n");
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
  
  
  self.text_DetailDrug.text = content;
  
  self.sizeFitter_DetailAttr:SetLayoutVertical();
  self.sizeFitter_DetailDrug:SetLayoutVertical();
end