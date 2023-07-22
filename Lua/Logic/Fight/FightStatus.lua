
--[[
In the beginning God created the heaven and the earth.At the first God made the heaven and the earth.
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
And God gave them his blessing, saying, Be fertile and have increase, making all the waters of the seas full, and let the birds be increased in the earth.
--]]

FightStatus = inheritsFrom(Attack)

function FightStatus.New(humIdx, statusKind)
  local self = FightStatus:create();
  self.humIdx = humIdx;    
  self.statusKind = statusKind;
  self.skillId = 0;        --技能種類
  self.showKind = 1;    --顯示技能方式 1:舊SetLight 2:新SetLight
  self.disKind = {};    --Array[0~MaxLight] of Byte;  //030602J顯圖權:地身天
  self.lights = {};     --Array[0~MaxLight] of TLight;

  self.nowSkill = nil; --招式主體
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

function FightStatus:SetKind(skillKind)
  if self.nowSkill ~= nil then 
    self.nowSkill:Free();
    self.nowSkill = nil;
  end

  --消除系離開
  if skillKind == ESkill_Kind.Dis then  
    self.skillId = ESkill_Kind.None;

    if self.nowSkill ~= nil then 
      self.nowSkill:Free();
      self.nowSkill:ExtraClose();     
      self.nowSkill = nil;
    end

    return;
  end

  if self:CheckSkill() then 
    self:CloseSkill();
  end

  self.skillId = skillKind;
  local statusTable = FightStatus.GetStatusTable(self.skillId);
  if statusTable == nil then 
    return 
  end
  self.nowSkill = statusTable.New(self.humIdx, self.statusKind, self.skillId);
end

function FightStatus.Trash()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function FightStatus.Trash1()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function FightStatus.GetStatusTable(skillId)
  local statusTable = nil;
  if skillId == ESkill_Kind.Poor then 
    statusTable = PoorMe;
  elseif skillId == ESkill_Kind.God then --福神   
    statusTable = GodMe;
  elseif skillId == ESkill_Kind.Spell then --符咒   
    statusTable = SpellMe;
  elseif skillId == ESkill_Kind.Boundary then --結界   
    statusTable = BoundaryMe;
  elseif skillId == ESkill_Kind.WhirlWind then --旋風   
    statusTable = WhirlWindMe;
  elseif Contains(skillId, ESkill_Kind.IceBound, ESkill_Kind.EW_IceBound, ESkill_Kind.IceCrystalsSeal)then --冰封
    statusTable = IceBoundMe;
  elseif skillId == ESkill_Kind.Clump then --樹精  
    statusTable = ClumpMe;
  elseif skillId == ESkill_Kind.Trance then --昏睡  
    statusTable = TranceMe;
  elseif skillId == ESkill_Kind.DizzyAtk then --暈擊  
    statusTable = DizzyAtkMe;
  elseif skillId == ESkill_Kind.EW_CounterDizzy then  --金鐘反制
    statusTable = EW_CounterMe;
  elseif skillId == ESkill_Kind.ShakeTake then --震攝  
    statusTable = ShakeTake;
  elseif skillId == ESkill_Kind.FreezePunch then --霜雷拳  
    statusTable = FreezePunchMe;
  elseif skillId == ESkill_Kind.GravelSeize then --砂瀑擒
    statusTable = GravelSeizeMe;
  elseif skillId == ESkill_Kind.SightCaptivity then --瞳光之絆
    statusTable = SightCaptivityMe;
  elseif skillId == ESkill_Kind.IceWall then --冰牆  
    statusTable = IceWallMe;
  elseif skillId == ESkill_Kind.Enlarge then --放大  
    statusTable = EnlargeMe;
  elseif skillId == ESkill_Kind.Limpid then --隱身  
    statusTable = LimpidMe;
  elseif skillId == ESkill_Kind.Avoid then --閃躲  
    statusTable = AvoidMe;
  elseif skillId == ESkill_Kind.Mirror then --鏡  
    statusTable = MirrorMe;
  elseif Contains(skillId, ESkill_Kind.SoulMirror, ESkill_Kind.EW_SoulMirror, ESkill_Kind.TaiFuSoulMirror) then --靈鏡
    statusTable = SoulMirrorMe;
  elseif skillId == ESkill_Kind.FireAmulet then --丹陽護體  
    statusTable = FireAmuletMe;
  elseif skillId == ESkill_Kind.TransferAttack then --斗轉星移  
    statusTable = TransferAttackMe;
  elseif skillId == ESkill_Kind.Invisible then --無形無相  
    statusTable = InvisibleMe;
  elseif skillId == ESkill_Kind.GoldShield then --金鐘罩  
    statusTable = GoldShieldMe;
  elseif skillId == ESkill_Kind.Shrink then --縮小  
    statusTable = ShrinkMe;
  elseif skillId == ESkill_Kind.Poision then --中毒  
    statusTable = PoisionMe;
  elseif skillId == ESkill_Kind.SoulCurse then --蝕魂詛咒
    statusTable = SoulCurseMe;
  elseif skillId == ESkill_Kind.Chaos then --混亂  
    statusTable = ChaosMe;
  elseif skillId == ESkill_Kind.Tardy then --遲緩  
    statusTable = TardyMe;
  elseif skillId == ESkill_Kind.Stool1 then
    statusTable = Stool1Me;
  elseif skillId == ESkill_Kind.Landslip then --土崩陣  
    statusTable = LandslipMe;
  elseif skillId == ESkill_Kind.ThunderFire then --雷火召臨  
    statusTable = ThunderFireMe;
  elseif skillId == ESkill_Kind.HealthDrawer then --式鬼吸魂  
    statusTable = HealthDrawerMe;
  elseif skillId == ESkill_Kind.FireSickle then --火鐮  
    statusTable = FireSickleMe;
  elseif skillId == ESkill_Kind.DarkFire then --萬毒穿心狀態 Alen 20160303  
    statusTable = DarkFireMe;
  elseif skillId == ESkill_Kind.Protect then --護主  
    statusTable = ProtectMe;
  elseif skillId == ESkill_Kind.MagicProtect then --魔法護身  
    statusTable = MagicProtectMe;
  elseif skillId == ESkill_Kind.WildFightSoul then --狂熱戰魂  
    statusTable = WildFightSoulMe;
  elseif skillId == ESkill_Kind.BrightMirror then --魔法護身  
    statusTable = BrightMirrorMe;
  elseif skillId == ESkill_Kind.WindFaster then --風之戰意  
    statusTable = WindFasterMe;
  elseif skillId == ESkill_Kind.AngryMind then --霸意  
    statusTable = AngryMindMe;
  elseif skillId == ESkill_Kind.CrazySoul then --聖靈暴衝  
    statusTable = CrazySoulMe;
  elseif skillId == ESkill_Kind.AngerShield then --凝氣護盾  
    statusTable = AngerShieldMe;
  elseif Contains(skillId, ESkill_Kind.MagicalShield, ESkill_Kind.GroupImmunityShield, ESkill_Kind.IdelHalo) then --天降神盾, 魔王領域, 偶像光環
    statusTable = MagicalShieldMe;
  elseif skillId == ESkill_Kind.LightShield then --光之鏡  
    statusTable = LightShieldMe;
  elseif skillId == ESkill_Kind.DarkMind then --冥河無想  
    statusTable = DarkMindMe;
  elseif skillId == ESkill_Kind.PitySoldier then --仁者無敵  
    statusTable = PitySoldierMe;
  elseif skillId == ESkill_Kind.EWCommonFaint then --專武通用衰弱
    statusTable = CommonStatus;
  elseif skillId == ESkill_Kind.EWCommonStrong then --專武通用強化
    statusTable = CommonStatus;
  elseif Contains(skillId, ESkill_Kind.EW_Int, ESkill_Kind.EW_Atk, ESkill_Kind.EW_Def, ESkill_Kind.EW_Hpx,
    ESkill_Kind.EW_Spx,  ESkill_Kind.EW_Dex, ESkill_Kind.EW_StrikeRate, ESkill_Kind.EW_Earth, ESkill_Kind.EW_Water, 
    ESkill_Kind.EW_Fire, ESkill_Kind.EW_Wind, ESkill_Kind.EW_MirrorIngore, ESkill_Kind.DodgeDead, ESkill_Kind.EW_Counter,
    ESkill_Kind.EW_BaguaDex, ESkill_Kind.EW_CounterTrance, ESkill_Kind.EW_SpecifyStatusIngore) then
    statusTable = PassiveSkill;
  elseif skillId == ESkill_Kind.PassiveGoldShield then 
    statusTable = GoldShieldMe;
  elseif skillId == ESkill_Kind.PoisonShield then 
    statusTable = PoisonShieldMe;
  elseif skillId == ESkill_Kind.DolphinGraud then 
    statusTable = DolphinGraudMe;
  elseif skillId == ESkill_Kind.Taunt then 
    statusTable = TauntMe;
  elseif skillId == ESkill_Kind.EW_CounterTranceMe then
    statusTable = EW_CounterTranceMe;
  elseif skillId == ESkill_Kind.IceCrystalsShieldMe then
    statusTable = IceCrystalsShieldMe;
  elseif skillId == ESkill_Kind.DragonTransfer then --巴龍風障(反彈狀態)
    statusTable = DragonTransferMe;
  end
  return statusTable;
end

function FightStatus.Trash2()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function FightStatus:CheckSkill()
  if self.skillId == ESkill_Kind.Spell then 
    if self.nowSkill ~= nil then 
      return self.nowSkill.isLightEnd;
    else
      logError("FightStatus CheckSkill Nil");
      return false;
    end
  end

  return false;
end

function FightStatus.Trash3()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function FightStatus.Trash4()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end