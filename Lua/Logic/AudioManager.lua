AudioManager = {};
local this = AudioManager;

local SOUND_MODE1 = 1;   --模式一
local SOUND_MODE2 = 2;   --模式二

local nextUpdateTime = 0;
local audioRoot = nil;
local audioChannel = {};
local loopDatas = {};
local nftAudioPath = "AudioClip_"


this.soundMode = SOUND_MODE1;
this.musicVolume = 1;
this.soundVolume = 1;
this.isMusicEnable = false;
this.isSoundEnable = false;
this.backMusicName = "";

function AudioManager.Destroy()
  if audioRoot ~= nil then
    GameObject.Destroy(audioRoot);
    audioRoot = nil;
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
end

function AudioManager.Initialize()
  -- 模式一 新音樂
  this.sceneSound_Map_1       = "Audio/AudioClip_WC0002.mp3";  --冒險
  this.sceneSound_Town1_1     = "Audio/AudioClip_WC0004.mp3";  --城內(室內)
  this.sceneSound_Town2_1     = "Audio/AudioClip_WM0001.mp3";   --城內(室外)
  this.sceneSound_Hole_1      = "Audio/AudioClip_WM0002.mp3";   --山洞
  this.sceneSound_Gym_1       = "Audio/AudioClip_WM0007.mp3";   --練功區
  this.sceneSound_Topic_1     = "Audio/AudioClip_WC0001.mp3";  --片頭
  this.sceneSound_City_1      = "Audio/AudioClip_WM0006.mp3";   --攻城場景、洛陽皇宮
  this.sceneSound_Fight1_1    = "Audio/AudioClip_WC0007.mp3";  --戰鬥1
  this.sceneSound_Fight2_1    = "Audio/AudioClip_WC0008.mp3";  --戰鬥2
  this.sceneSound_Fight3_1    = "Audio/AudioClip_WC0010.mp3";  --魔王
  this.sceneSound_Chirstmas_1 = "Audio/AudioClip_WC0012.mp3";  --耶誕場景

  this.sceneSound_Tower1_1    = "Audio/AudioClip_WM0009.mp3";   --死亡之塔
  this.sceneSound_Tower2_1    = "Audio/AudioClip_WM0010.mp3";   --死亡之塔
  this.sceneSound_Tower3_1    = "Audio/AudioClip_WM0011.mp3";   --死亡之塔
  this.sceneSound_Tower4_1    = "Audio/AudioClip_WC0014.mp3";   --死亡之塔

  this.sceneSound_pardadise1_1 = "Audio/AudioClip_WC0015.mp3";  --仙界室外場景
  this.sceneSound_pardadise2_1 = "Audio/AudioClip_WC0016.mp3";  --仙界室內場景

  this.sceneSound_Trun1_1      = "Audio/AudioClip_20.mp3";      --靈虛山山頂小屋地窖
  this.sceneSound_SeaWarfare1_1= "Audio/AudioClip_WC0013.mp3";  --海戰場景  2004/12/27
  this.sceneSound_ToLive1_1    = "Audio/AudioClip_WC0006.mp3";  --生存遊戲 場景:54511~54526
  this.sceneSound_ToLive2_1    = "Audio/AudioClip_WC0013.mp3";  --生存遊戲 場景:54527~54535

  this.sceneSound_SNouthLSouth_1= "Audio/AudioClip_WM0013.mp3";   --塞北、嶺南
  this.sceneSound_Hell_1        = "Audio/AudioClip_WM0016.mp3";   --地獄(非酆都場景)

  this.sceneSound_WaterBattle1_1= "Audio/AudioClip_WM0014.mp3";   --水戰
  this.sceneSound_WaterBattle2_1= "Audio/AudioClip_WM0015.mp3";   --水戰
-- 模式二 舊音樂
  this.sceneSound_Map_2       = "Audio/AudioClip_WC0002.mp3";  --冒險
  this.sceneSound_Town1_2     = "Audio/AudioClip_WC0004.mp3";  --城內(室內)
  this.sceneSound_Town2_2     = "Audio/AudioClip_WC0003.mp3";  --城內(室外)
  this.sceneSound_Hole_2      = "Audio/AudioClip_WC0006.mp3";  --山洞
  this.sceneSound_Gym_2       = "Audio/AudioClip_WC0005.mp3";  --練功區
  this.sceneSound_Topic_2     = "Audio/AudioClip_WC0001.mp3";  --片頭
  this.sceneSound_City_2      = "Audio/AudioClip_WC0003.mp3";  --攻城場景、洛陽皇宮
  this.sceneSound_Fight1_2    = "Audio/AudioClip_WC0007.mp3";  --戰鬥1
  this.sceneSound_Fight2_2    = "Audio/AudioClip_WC0008.mp3";  --戰鬥2
  this.sceneSound_Fight3_2    = "Audio/AudioClip_WC0010.mp3";  --魔王
  this.sceneSound_Chirstmas_2 = "Audio/AudioClip_WC0012.mp3";  --耶誕場景

  this.sceneSound_Tower1_2     = "Audio/AudioClip_WC0005.mp3";   --死亡之塔
  this.sceneSound_Tower2_2     = "Audio/AudioClip_WC0005.mp3";   --死亡之塔
  this.sceneSound_Tower3_2     = "Audio/AudioClip_WC0005.mp3";   --死亡之塔
  this.sceneSound_Tower4_2     = "Audio/AudioClip_WC0014.mp3";   --死亡之塔

  this.sceneSound_pardadise1_2 = "Audio/AudioClip_WC0015.mp3";  --仙界室外場景
  this.sceneSound_pardadise2_2 = "Audio/AudioClip_WC0016.mp3";  --仙界室內場景
  this.sceneSound_Trun1_2      = "Audio/AudioClip_20.mp3";      --靈虛山山頂小屋地窖
  this.sceneSound_SeaWarfare1_2= "Audio/AudioClip_WC0013.mp3";  --海戰場景  2004/12/27
  this.sceneSound_ToLive1_2    = "Audio/AudioClip_WC0006.mp3";  --生存遊戲 場景:54511~54526
  this.sceneSound_ToLive2_2    = "Audio/AudioClip_WC0013.mp3";  --生存遊戲 場景:54527~54535

  this.sceneSound_SNouthLSouth_2= "Audio/AudioClip_WM0013.mp3";   --塞北、嶺南
  this.sceneSound_Hell_2        = "Audio/AudioClip_WM0016.mp3";   --地獄(非酆都場景)

---- 模式一 新音樂
--  this.sceneSound_Map_1       = "WC0002.wav";  --冒險
--  this.sceneSound_Town1_1     = "WC0004.wav";  --城內(室內)
--  this.sceneSound_Town2_1     = "WM0001.mp3";   --城內(室外)
--  this.sceneSound_Hole_1      = "WM0002.mp3";   --山洞
--  this.sceneSound_Gym_1       = "WM0007.mp3";   --練功區
--  this.sceneSound_Topic_1     = "WC0001.wav";  --片頭
--  this.sceneSound_City_1      = "WM0006.mp3";   --攻城場景、洛陽皇宮
--  this.sceneSound_Fight1_1    = "WC0007.wav";  --戰鬥1
--  this.sceneSound_Fight2_1    = "WC0008.wav";  --戰鬥2
--  this.sceneSound_Fight3_1    = "WC0010.wav";  --魔王
--  this.sceneSound_Chirstmas_1 = "WC0012.wav";  --耶誕場景

--  this.sceneSound_Tower1_1    = "WM0009.mp3";   --死亡之塔
--  this.sceneSound_Tower2_1    = "WM0010.mp3";   --死亡之塔
--  this.sceneSound_Tower3_1    = "WM0011.mp3";   --死亡之塔
--  this.sceneSound_Tower4_1    = "WC0014.wav";   --死亡之塔

--  this.sceneSound_pardadise1_1 = "WC0015.wav";  --仙界室外場景
--  this.sceneSound_pardadise2_1 = "WC0016.wav";  --仙界室內場景

--  this.sceneSound_Trun1_1      = "20.wav";      --靈虛山山頂小屋地窖
--  this.sceneSound_SeaWarfare1_1= "WC0013.wav";  --海戰場景  2004/12/27
--  this.sceneSound_ToLive1_1    = "WC0006.wav";  --生存遊戲 場景:54511~54526
--  this.sceneSound_ToLive2_1    = "WC0013.wav";  --生存遊戲 場景:54527~54535

--  this.sceneSound_SNouthLSouth_1= "WM0013.mp3";   --塞北、嶺南
--  this.sceneSound_Hell_1        = "WM0016.mp3";   --地獄(非酆都場景)

--  this.sceneSound_WaterBattle1_1= "WM0014.mp3";   --水戰
--  this.sceneSound_WaterBattle2_1= "WM0015.mp3";   --水戰
---- 模式二 舊音樂
--  this.sceneSound_Map_2       = "WC0002.wav";  --冒險
--  this.sceneSound_Town1_2     = "WC0004.wav";  --城內(室內)
--  this.sceneSound_Town2_2     = "WC0003.wav";  --城內(室外)
--  this.sceneSound_Hole_2      = "WC0006.wav";  --山洞
--  this.sceneSound_Gym_2       = "WC0005.wav";  --練功區
--  this.sceneSound_Topic_2     = "WC0001.wav";  --片頭
--  this.sceneSound_City_2      = "WC0003.wav";  --攻城場景、洛陽皇宮
--  this.sceneSound_Fight1_2    = "WC0007.wav";  --戰鬥1
--  this.sceneSound_Fight2_2    = "WC0008.wav";  --戰鬥2
--  this.sceneSound_Fight3_2    = "WC0010.wav";  --魔王
--  this.sceneSound_Chirstmas_2 = "WC0012.wav";  --耶誕場景

--  this.sceneSound_Tower1_2     = "WC0005.wav";   --死亡之塔
--  this.sceneSound_Tower2_2     = "WC0005.wav";   --死亡之塔
--  this.sceneSound_Tower3_2     = "WC0005.wav";   --死亡之塔
--  this.sceneSound_Tower4_2     = "WC0014.wav";   --死亡之塔

--  this.sceneSound_pardadise1_2 = "WC0015.wav";  --仙界室外場景
--  this.sceneSound_pardadise2_2 = "WC0016.wav";  --仙界室內場景
--  this.sceneSound_Trun1_2      = "20.wav";      --靈虛山山頂小屋地窖
--  this.sceneSound_SeaWarfare1_2= "WC0013.wav";  --海戰場景  2004/12/27
--  this.sceneSound_ToLive1_2    = "WC0006.wav";  --生存遊戲 場景:54511~54526
--  this.sceneSound_ToLive2_2    = "WC0013.wav";  --生存遊戲 場景:54527~54535

--  this.sceneSound_SNouthLSouth_2= "WM0013.mp3";   --塞北、嶺南
--  this.sceneSound_Hell_2        = "WM0016.mp3";   --地獄(非酆都場景)

  audioRoot = GameObject.New();
  audioRoot.name = "AudioRoot";
  for i = 0, 15 do
    local go = GameObject.New();
    go.transform:SetParent(audioRoot.transform);
    go.name = string.Concat("AudioChannel_", i);
    audioChannel[i] = go:AddComponent(typeof(AudioSource));
    if Between(i, 2, 7) then
      loopDatas[i] = {};
      loopDatas[i].x = 0;
      loopDatas[i].y = 0;
      loopDatas[i].dist = 0;
    end
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
  this.soundMode = Setting.client.musicMode;
  this.SetMusicVolume(Setting.client.musicVolume * 0.1);
  this.SetSoundVolume(Setting.client.soundVolume * 0.1);
  this.SwitchMusic(Setting.client.musicEnable);
  this.SwitchSound(Setting.client.soundEnable);

  NotifyManager.Register(ENotifyManager.EnterScene, "AudioManager", this.PlaySceneMusic);
  NotifyManager.Register(ENotifyManager.ExitScene, "AudioManager", this.StopAllEasyLoop);
end

function AudioManager.PlaySceneMusic(checkCode)
  local sceneID = SceneManager.sceneId;
  local sceneType = SceneManager.sceneState.type;
  if this.soundMode == SOUND_MODE1 then                 --模式2時.播一般大地圖音樂
    if Between(sceneID, 60000, 60999) then              --地獄
      if Contains(sceneID, 60001, 60011, 60301, 60401, 60411, 60421) == false and Between(sceneID, 60501, 60512) == false
      and Between(sceneID, 60801, 60810) == false then  --以上場景不播WM0016.mp3
        this.SetMusic(20);
        return;
      end
    end
    
    if Between(sceneID, 27000, 27999) or Between(sceneID, 61000, 61999) then         --塞北  嶺南
      this.SetMusic(19);
      return;
    end
  end

  if sceneType == ESceneType.Map then
     this.SetMusic(15);
  elseif sceneType == ESceneType.Town then
    this.PlaySceneMusic3();
  elseif sceneType == ESceneType.Hole then
    if Between(sceneID, 54511, 54526) then
      this.SetMusic(13);
    elseif Between(sceneID, 54527, 54535) then
      this.SetMusic(14);
    else
      this.SetMusic(16);
    end
  elseif sceneType == ESceneType.Gym then
    if Contains(sceneID, 59801, 59802, 59811, 59812, 59821, 59822, 59831, 59832, 59841, 59842)then
      this.SetMusic(8);
    elseif Contains(sceneID, 54811, 54812) then
      this.SetMusic(4);
    else
      this.SetMusic(17);
    end
  elseif sceneType == ESceneType.Topic then
    this.SetMusic(18);
    end
end

function AudioManager.PlaySceneMusic3()
  local sceneID = SceneManager.sceneId;
  local sceneType = SceneManager.sceneState.type;

  if Contains(sceneID, 49708, 49721, 49738) then
    this.SetMusic(2);
    return;
  elseif sceneID ==  10992 or Between(sceneID, 10963, 10966) then
    this.SetMusic(4);
    return; 
  elseif Between(sceneID, 12922, 12923) or Between(sceneID, 13441, 13443) or Contains(49701, 49711, 49731) then
    this.SetMusic(5);
    return;
  elseif Between(sceneID, 12924, 12931) or Between(sceneID, 13471, 13473) or Between(sceneID, 13483, 13484) then
    this.SetMusic(6);    
    return;
  elseif Between(sceneID, 12932, 12934) or Between(sceneID, 13444, 13449) or Between(sceneID, 13474, 13482) or Between(sceneID, 49702, 49706)
  or Between(sceneID, 49712, 49720) or Between(sceneID, 49732, 49737) then
    this.SetMusic(7);
    return;
  elseif Contains(sceneID, 59000, 59001, 59011, 59041, 59411, 59421, 59422) or Between(sceneID, 59431, 59434) or Between(sceneID, 56441, 59461)
  or Between(sceneID, 59471, 59472) then
    this.SetMusic(8);
    return;  
  elseif Contains(sceneID, 59101, 59102, 59131, 59301) then
    this.SetMusic(9);
    return;
  elseif Between(sceneID, 12935, 12939) then
    this.SetMusic(10);
    return;
  elseif sceneID == 59454 then
    this.SetMusic(11);
    return;
  elseif sceneID == 21760 then
    this.SetMusic(12);
    return;
  elseif Between(sceneID, 49401, 49404) or Between(sceneID, 49411, 49414) or Between(sceneID, 49421, 49424) or Between(sceneID, 49431, 49434)
  or Between(sceneID, 49441, 49444) then
    this.SetMusic(21);
    return;
  elseif Contains(sceneID, 49409, 49419, 49429, 49439, 49449, 49001, 49009, 49011, 49019, 49021, 49029, 49031, 49039, 49041, 49049, 49051, 49059, 49221, 49226)
  or Between(sceneID, 49211, 49216) then
    this.SetMusic(22);
    return;
  elseif Between(sceneID, 49002, 49004) or Between(sceneID, 49012, 49014) or Between(sceneID, 49022, 4924) or Between(sceneID, 49032, 49034)
  or Between(sceneID, 49042, 49044) or Between(sceneID, 49052, 49054) or Between(sceneID, 49501, 49505) or Between(sceneID, 49511, 49514)
  or Between(sceneID, 49521, 49524) or Between(sceneID, 49531, 49534) or Between(sceneID, 49541, 49544) or Between(sceneID, 49551, 49554) then
    this.SetMusic(23);
    return;
  end

  local bgID = MapManager.musicId;
  
  if sceneType == ESceneType.Town then
    if Contains(MapManager.musicId, 10801, 10851, 10821, 10853) then
      this.PlayBack(this.sceneSound_Town2_2);
    elseif Contains(MapManager.musicId, 10901, 50016, 50017, 50164, 50166, 50021, 50022, 50059, 50060, 50066, 50067, 50069, 50070, 50081) or Between(bgID, 50001, 50009)
    or Between(MapManager.musicId, 50045, 50048) or Between(MapManager.musicId, 50084, 50089) then
      this.SetMusic(1);
    elseif MapManager.musicId == 50065 then
      this.SetMusic(2);
    else
      local idx = City.GetCityId(sceneID, ECityScene.Fight);
      if idx > 0 and City.cities[idx].isOnWar then
        this.SetMusic(2);
      else
        this.SetMusic(3);
      end
    end
  end
end

function AudioManager.PlayStartMusic()
  local path = this.sceneSound_Topic_1 ;
  if this.soundMode == SOUND_MODE2 then
    path = this.sceneSound_Topic_2;    
  end

  this.PlayBack(path);
end

function AudioManager.PlayFightMusic()
  local str1, str2, str3;

  this.StopAllEasyLoop();
  if AudioManager.soundMode == SOUND_MODE1 then
    str1 = this.sceneSound_Fight1_1; --戰鬥1
    str2 = this.sceneSound_Fight2_1; --戰鬥2
    str3 = this.sceneSound_Fight3_1; --魔王
  else
    str1 = this.sceneSound_Fight1_2; --戰鬥1
    str2 = this.sceneSound_Fight2_2; --戰鬥2
    str3 = this.sceneSound_Fight3_2; --魔王
  end
  if FightField.fightNo == 0 then
    if SceneManager.sceneId == 10991 or
--  (RE_MigrantManageTools.IsArenaScene(Player.SceneNum)) or
--  {$ifdef FieldBattle}
--  (Player.SceneNum=10994) or
--  {$endif}
--  (Player.SceneNum=MR_Sky_SceneNum) or
    City.GetCityId(SceneManager.sceneId, ECityScene.Fight) ~= 0 then     --團Pk場景，攻城場景播魔王音樂  92/9/15-1F
      this.PlayBack(str3);
    elseif FightField.ffWar_Style == EWar.WorldBoss then
      this.PlayBack(str3);
    else
      log(string.Concat("playMusic : ", str1 ));
      this.PlayBack(str1);
    end
  else
    local bkMusic = FightManager.FindEveFightBkMusic(FightField.fightNo);
    if bkMusic == 1 then
      this.PlayBack(str1);
    elseif bkMusic == 2 then
      this.PlayBack(str2);
    elseif bkMusic == 3 then
      this.PlayBack(str3);
    else
      if SceneManager.sceneId == 10991 or
--    (RE_MigrantManageTools.IsArenaScene(Player.SceneNum)) or
--    {$ifdef FieldBattle}
--    (Player.SceneNum=10994) or
--    {$endif}
--    (Player.SceneNum=MR_Sky_SceneNum) or
      City.GetCityId(SceneManager.sceneId, ECityScene.Fight) ~= 0 then     --團Pk場景，攻城場景播魔王音樂  92/9/15-1F
        this.PlayBack(str3);
      else
        this.PlayBack(str1);
      end
    end
  end
end

function AudioManager.PlayChannel(path, channel) 
  local adCh = audioChannel[channel];
  if adCh == nil then return end  

  this.LoadMusicFile(adCh, path)
  if channel == 0 then
    this.backMusicName = path;
    if this.isMusicEnable then
      adCh.volume = this.musicVolume;
    else
      adCh.volume = 0;
    end
  else
    if this.isSoundEnable then
      adCh.volume = this.soundVolume;
    else
      adCh.volume = 0;
    end
  end

  adCh.loop = true;
end

function AudioManager.PlayBack(path)
  if this.backMusicName == path then  
    return;
  end

  path = this.ChangeMusicName(path);
  this.PlayChannel(path, 0);  
end

function AudioManager.PlayEasyLoop()
  if Role.player == nil then return end

  local blockX, blockY = MapManager.GetBlock(Role.player.position);
  local dist;

  for i = 2, 7 do
    if audioChannel[i].isPlaying == true then
      dist = math.sqrt((blockX - loopDatas[i].x) ^ 2 + (blockY - loopDatas[i].y) ^ 2);

      if this.isSoundEnable then
        audioChannel[i].volume = this.soundVolume * math.max(1 - (dist / loopDatas[i].dist), 0.1) * 0.7;
      else
        audioChannel[i].volume = 0;
      end
      audioChannel[i].loop = dist < loopDatas[i].dist;
    end
  end

  local waveInfo = MapManager.GetWave(blockX, blockY);

  if waveInfo == nil then return end

  dist = math.sqrt((waveInfo.blockX - blockX) ^ 2 + (waveInfo.blockY - blockY) ^ 2);
  
  local loadClip = false;
  local channel = 0;

  --找現有的
  for i = 2, 7 do
    if audioChannel[i].isPlaying == true and loopDatas[i].x == waveInfo.blockX and loopDatas[i].y == waveInfo.blockY then
      channel = i;
      break;
    end
  end

  --找空閒的
  if channel == 0 then
    loadClip = true;
    for i = 2, 7 do
      if audioChannel[i].isPlaying == false then
        channel = i;
        break;
      end
    end
  end

  if channel == 0 then return end

  if loadClip then
    this.LoadMusicFile(audioChannel[channel], string.Concat(tostring(waveInfo.soundId), ".wav"));
  end
  
  loopDatas[channel].x = waveInfo.blockX;
  loopDatas[channel].y = waveInfo.blockY;
  loopDatas[channel].dist = waveInfo.dist;

  if this.isSoundEnable then
    audioChannel[channel].volume = this.soundVolume * math.max(1 - (dist / waveInfo.dist), 0.1) * 0.7;
  else
    audioChannel[channel].volume = 0;
  end
  audioChannel[channel].loop = dist < waveInfo.dist;
end

function AudioManager.PlayOnce(path, volume)
  if not this.isSoundEnable then return end
  
  --如果音效path沒有加上NFT音效前綴就加上前綴
  if string.match(path, nftAudioPath) == nil then
    path = string.Concat(nftAudioPath, path);
  end
  
  --重覆音效正在播，超過五個,新的就不播放
  local sameCount = 0;
  for i = 8, 15 do
    if string.match(tostring(audioChannel[i].clip), path) == path and audioChannel[i].isPlaying then
      sameCount = sameCount + 1;
    end    
  end

  if sameCount >= 5 then 
    return 
  end

  if volume == nil then
    volume = 0;
  end

  for i = 8, 15 do
    if not audioChannel[i].isPlaying then
      this.LoadMusicFile(audioChannel[i], path);
      if this.isSoundEnable then
        audioChannel[i].volume = this.soundVolume;
      else
        audioChannel[i].volume = 0;
      end

      audioChannel[i].loop = false;
      return;
    end
  end
end

function AudioManager.PlayChannelOnce(path, channel, volume)
  local adCh = audioChannel[channel];
  if adCh == nil then return end  
  if not this.isSoundEnable then return end

  if volume == nil then
    volume = 0;
  end

  this.LoadMusicFile(adCh, path);
  if this.isSoundEnable then
    adCh.volume = volume;
  else
    adCh.volume = 0;
  end

  adCh.loop = false;
  return;   
end

function AudioManager.PlaySlot(path)
  if not this.isSoundEnable then return end

  this.LoadMusicFile(audioChannel[15], path);
  if this.isSoundEnable then
    audioChannel[15].volume = this.soundVolume;
  else
    audioChannel[15].volume = 0;
  end

  audioChannel[15].loop = true;
end

function AudioManager.StopBack()
  audioChannel[0]:Stop();
end

function AudioManager.StopAllEasyLoop()
  for i = 2, 7 do
    if audioChannel[i].isPlaying == true then
      audioChannel[i].loop = false;
    end
  end
end

function AudioManager.MuteSoundChannel()
  for i = 1, 15 do
    audioChannel[i].volume = 0;
  end
end

function AudioManager.ChangeMusicName(fileName)
  local sceneID = SceneManager.sceneId;
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
  if this.soundMode == SOUND_MODE1 then
    if this.CheckMusicName(fileName) then
      return fileName;
    end
    
    if Between(sceneID, 60000, 60999) then          --地獄
      if Contains(sceneID, 60001, 60011, 60301, 60401, 60411, 60421) == false and Between(sceneID, 60501, 60512) == false
      and Between(sceneID, 60801, 60810) == false then  --以上場景不播WM0016.mp3
        return this.sceneSound_Hell_1;
      end
    end
    
    if Between(sceneID, 27000, 27999) or Between(sceneID, 61000, 61999) then         --塞北  嶺南
      return this.sceneSound_SNouthLSouth_1;
    end
    
    if fileName == this.sceneSound_Map_2 then        --冒險
      if Contains(sceneID, 59000, 59801, 59802, 59811, 59812, 59821, 59822, 59831, 59832) then
        return this.sceneSound_pardadise1_1;
      else
        return this.sceneSound_Map_1;
      end
    end
    
    if fileName == this.sceneSound_Town1_2 then        --城內(室內)
      if Contains(sceneID, 59001, 59131, 59301) then
        return this.sceneSound_pardadise2_1;
      else
        return this.sceneSound_Town1_1;
      end
    end
    
    if fileName == this.sceneSound_Town2_2 then       --城內(室外)
      if Contains(sceneID, 10801, 10851, 10821, 10853) then     --網咖新手村例外處理
        return this.sceneSound_Town2_2;
      else
        return this.sceneSound_Town2_1;
      end
    end
    
    if fileName == this.sceneSound_Gym_2 then          --練功區
      if Between(sceneID, 12922, 12923) or Between(sceneID, 13441, 13443) then
        return this.sceneSound_Tower3_1;
      elseif Between(sceneID, 12924, 12931) or Between(sceneID, 13471, 13473) or Between(sceneID, 13483, 13484) then
        return this.sceneSound_Tower2_1;
      elseif Between(sceneID, 12932, 12934) or Between(sceneID, 13444, 13449) or Between(sceneID, 13474, 13482) then
        return this.sceneSound_Tower1_1;
      elseif Between(sceneID, 12935, 12939) then
        return this.sceneSound_Tower4_1;
      elseif Contains(sceneID, 59801, 59802, 59811, 59812, 59821, 59822, 59831, 59832)then
        return this.sceneSound_pardadise1_1;
      elseif sceneID == 59454 then
        log("Don't Do");
      else
        return this.sceneSound_Gym_1;
      end
    end
    
    if fileName == this.sceneSound_Hole_2 then
      if Between(sceneID, 54511, 54526) then
        return fileName;
      else
        return this.sceneSound_Hole_1;
      end
    end    
    
    if fileName == this.sceneSound_Topic_2 then    
      return this.sceneSound_Topic_1; 
    end

    if fileName == this.sceneSound_City_2 then    
      return this.sceneSound_City_1; 
    end
    
    if fileName == this.SceneSound_Fight1_2 then    
      return this.sceneSound_Fight1_1; 
    end
    
    if fileName == this.SceneSound_Fight2_2 then    
      return this.SceneSound_Fight2_1; 
    end
    
    if fileName == this.SceneSound_Fight3_2 then    
      return this.SceneSound_Fight3_1; 
    end

    if fileName == this.sceneSound_Chirstmas_2 then
      if Contains(sceneID, 49409, 49419, 49429, 49439, 49449, 49001, 49009, 49011, 49019, 49021, 49029, 49031, 49039, 49041, 49059, 49051, 49059, 49221, 49226)
      or Between(sceneID, 49211, 49216) then
        return this.sceneSound_WaterBattle2_1;
      else
        return this.sceneSound_Chirstmas_1;
      end
    end
    
    if fileName == this.sceneSound_pardadise1_2 then
      if Between(sceneID, 49002, 49004) or Between(sceneID, 49012, 49014) or Between(sceneID, 49022, 49024) or Between(sceneID, 49032, 49034)
      or Between(sceneID, 49042, 49044) or Between(sceneID, 49052, 49054) or Between(sceneID, 49501, 49505) or Between(sceneID, 49511, 49514)     
      or Between(sceneID, 49521, 49524) or Between(sceneID, 49531, 49534) or Between(sceneID, 49541, 49544) or Between(sceneID, 49551, 49554) then
        return this.sceneSound_Hell_1;
      else
        return this.sceneSound_pardadise1_1;
      end
    end    
    
    if fileName == this.sceneSound_pardadise2_2 then
      return this.sceneSound_pardadise2_1; 
    end
    
    if fileName == this.sceneSound_Tower4_2 then
      return this.sceneSound_WaterBattle1_1; 
    end
  else
    if fileName == this.sceneSound_Hell_1 or fileName == this.sceneSound_SNouthLSouth_1 then  --切換模式2時在地獄或塞北、嶺南等地時,重設wav檔
      this.PlaySceneMusic();
    end
    
    if fileName == this.sceneSound_Map_1 then
      if Contains(sceneID, 59000, 59801, 59802, 59811, 59812, 59821, 59822, 59831, 59832) then
        return this.sceneSound_Map_2;
      end
    end
    
    if fileName == this.sceneSound_Town1_1 then    
      return this.sceneSound_Town1_2; 
    end
    
    if fileName == this.sceneSound_Town2_1 then    
      return this.sceneSound_Town2_2; 
    end
    
    if fileName == this.sceneSound_Hole_1 then    
      if Between(sceneID, 54511, 54526) then
        return this.sceneSound_Hole_1;
	  else                
      return this.sceneSound_Hole_2;
      end
    end
    
    if fileName == this.sceneSound_Gym_1 then    
      return this.sceneSound_Gym_2; 
    end
    
    if fileName == this.sceneSound_Topic_1 then    
      return this.sceneSound_Topic_2; 
    end
    
    if fileName == this.SceneSound_Fight1_1 then    
      return this.SceneSound_Fight1_2; 
    end
    
    if fileName == this.SceneSound_Fight2_1 then    
      return this.SceneSound_Fight2_2; 
    end
    
    if fileName == this.SceneSound_Fight3_1 then    
      return this.SceneSound_Fight3_2; 
    end
    
    if fileName == this.sceneSound_Chirstmas_1 then    
      return this.sceneSound_Chirstmas_2; 
    end
    
    if fileName == this.sceneSound_Tower1_1 then    
      return this.sceneSound_Tower1_2; 
    end
    
    if fileName == this.sceneSound_Tower2_1 then    
      return this.sceneSound_Tower2_2; 
    end
    
    if fileName == this.sceneSound_Tower3_1 then    
      return this.sceneSound_Tower3_2; 
    end
    
    if fileName == this.sceneSound_Tower4_1 then    
      return this.sceneSound_Tower4_2; 
    end
    
    if fileName == this.sceneSound_pardadise1_1 then    
      return this.sceneSound_pardadise1_2; 
    end
    
    if fileName == this.sceneSound_pardadise2_1 then    
      return this.sceneSound_pardadise2_2; 
    end
    
    if fileName == this.sceneSound_WaterBattle1_1 then    
      return this.sceneSound_Tower4_2; 
    end
    
    if fileName == this.sceneSound_WaterBattle2_1 then    
      return this.sceneSound_Chirstmas_2; 
    end
  end

  return fileName;
end

function AudioManager.CheckMusicName(fileName) --如為戰鬥音則先播戰鬥音
  if this.soundMode == 1 then
    if fileName == this.SceneSound_Fight1_1  then
      return true;
	elseif fileName == this.SceneSound_Fight2_1 then
      return true;  
    elseif fileName == this.SceneSound_Fight3_1 then 
      return true        
    end
  else
    if fileName == this.SceneSound_Fight1_2  then
      return true;
    elseif fileName == this.SceneSound_Fight2_2 then
      return true;  
    elseif fileName == this.SceneSound_Fight3_2 then 
      return true        
    end
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
  return false;
end

function AudioManager.SwitchSoundMode(mode)
  this.soundMode = mode;
  this.PlaySceneMusic();
end

function AudioManager.SetMusicVolume(value)
  this.musicVolume = value;
  audioChannel[0].volume = value;
end

function AudioManager.SetSoundVolume(value)
  this.soundVolume = value;
end

function AudioManager.SwitchMusic(flag)
  this.isMusicEnable = flag;
  if flag == false then
    audioChannel[0].volume = 0;
  else
    audioChannel[0].volume = this.musicVolume;
  end
end

function AudioManager.SwitchSound(flag)
  this.isSoundEnable = flag;
  if flag == false then
    this.MuteSoundChannel();  
  end

end

function AudioManager.Update()
  if audioRoot == nil then return end
  if CGTimer.time < nextUpdateTime then return end

  nextUpdateTime = CGTimer.time + 0.3;

  this.PlayEasyLoop();
end

function AudioManager.LoadMusicFile(chamnel, path)
  if path == nil then return end

  local name = this.SubMusicName(path);
  chamnel.clip = CGResourceManager.ResourceLoadAudioClip(name);
  if chamnel.clip ~= nil then
    chamnel:Play();
  end
--  CGResourceManager.LoadAudio(name,
--    function(clip)
--      chamnel.clip = clip;
--      if chamnel.clip ~= nil then
--        chamnel:Play();
--      end
--    end
--  );
end

function AudioManager.SubMusicName(name)
  local idx1 = string.find(name, ".", 1, true);
  local idx2 = string.find(name, "/", 1, true);
  if idx1 ~= nil then
    name = string.sub(name, 1, idx1 - 1);
  end

  if idx2 ~= nil then
    name = string.sub(name, idx2 + 1);
  end
  return string.Concat("Audio/", name);
end

function AudioManager.SubMusicExtension(name)
  local idx = string.find(name, ".", 1, true);

  if idx == nil then
    return name;
  else
    return string.sub(name, 1, idx - 1);
  end
end

function AudioManager.SetMusic(idx)   
  local musicName = nil;
  if this.soundMode == SOUND_MODE1 then
    if idx == 1 then
      musicName = this.sceneSound_Town1_1;      --城(室內)
    elseif idx == 2 then
      musicName = this.sceneSound_City_1;
    elseif idx == 3 then
      musicName = this.sceneSound_Town2_1;      --城(室外)
    elseif idx == 4 then      
      musicName = this.sceneSound_Chirstmas_1;  --耶誕場景
    elseif idx == 5 then      
      musicName = this.sceneSound_Tower3_1;
    elseif idx == 6 then      
      musicName = this.sceneSound_Tower2_1;
    elseif idx == 7 then      
      musicName = this.sceneSound_Tower1_1;
    elseif idx == 8 then      
      musicName = this.sceneSound_pardadise1_1; --仙界室外場景
    elseif idx == 9 then      
      musicName = this.sceneSound_pardadise2_1; --仙界室內場景
    elseif idx == 10 then      
      musicName = this.sceneSound_Tower4_1;
    elseif idx == 11 then      
      musicName = this.sceneSound_Trun1_1;      --地窖
    elseif idx == 12 then      
      musicName = this.sceneSound_SeaWarfare1_1;--海戰場景
    elseif idx == 13 then      
      musicName = this.sceneSound_ToLive1_1;    --生存遊戲
    elseif idx == 14 then      
      musicName = this.sceneSound_ToLive2_1;    --生存遊戲
    elseif idx == 15 then      
      musicName = this.sceneSound_Map_1;        --冒險
    elseif idx == 16 then      
      musicName = this.sceneSound_Hole_1;       --山洞
    elseif idx == 17 then      
      musicName = this.sceneSound_Gym_1;        --練功區
    elseif idx == 18 then      
      musicName = this.sceneSound_Topic_1;      --片頭
    elseif idx == 19 then      
      musicName = this.sceneSound_SNouthLSouth_1;--塞北、嶺南
    elseif idx == 20 then      
      musicName = this.sceneSound_Hell_1;        --地獄(非酆都場景)
    elseif idx == 21 then      
      musicName = this.sceneSound_WaterBattle1_1;--水戰
    elseif idx == 22 then      
      musicName = this.sceneSound_WaterBattle2_1;--水戰
    elseif idx == 23 then      
      musicName = this.sceneSound_Hell_1;        --水戰
    end
  else
    if idx == 1 then
      musicName = this.sceneSound_Town1_2;      --城(室內)
    elseif idx == 2 then
      musicName = this.sceneSound_City_2;
    elseif idx == 3 then
      musicName = this.sceneSound_Town2_2;      --城(室外)
    elseif idx == 4 then      
      musicName = this.sceneSound_Chirstmas_2;  --耶誕場景
    elseif idx == 5 then      
      musicName = this.sceneSound_Tower3_2;
    elseif idx == 6 then      
      musicName = this.sceneSound_Tower2_2;
    elseif idx == 7 then      
      musicName = this.sceneSound_Tower1_2;
    elseif idx == 8 then      
      musicName = this.sceneSound_pardadise1_2; --仙界室外場景
    elseif idx == 9 then      
      musicName = this.sceneSound_pardadise2_2; --仙界室內場景
    elseif idx == 10 then      
      musicName = this.sceneSound_Tower4_2;
    elseif idx == 11 then      
      musicName = this.sceneSound_Trun1_2;      --地窖
    elseif idx == 12 then      
      musicName = this.sceneSound_SeaWarfare1_2;--海戰場景
    elseif idx == 13 then      
      musicName = this.sceneSound_ToLive1_2;    --生存遊戲
    elseif idx == 14 then      
      musicName = this.sceneSound_ToLive2_2;    --生存遊戲
    elseif idx == 15 then      
      musicName = this.sceneSound_Map_2;        --冒險
    elseif idx == 16 then      
      musicName = this.sceneSound_Hole_2;       --山洞
    elseif idx == 17 then      
      musicName = this.sceneSound_Gym_2;        --練功區
    elseif idx == 18 then      
      musicName = this.sceneSound_Topic_2;      --片頭
    --elseif idx == 19 then      
    --  musicName = this.sceneSound_SNouthLSouth_2;--塞北、嶺南
    --elseif idx == 20 then      
    --  musicName = this.sceneSound_Hell_2;        --地獄(非酆都場景)
    elseif idx == 21 then      
      musicName = this.sceneSound_Tower4_2;      --水戰
    elseif idx == 22 then      
      musicName = this.sceneSound_Chirstmas_2    --水戰
    elseif idx == 23 then      
      musicName = this.sceneSound_pardadise1_2;  --水戰
    end    
  end

  this.PlayBack(musicName);
end

function AudioManager.PlayFurnitureMusicOnce(path)
  if not this.isSoundEnable then return end

  for i = 8, 15 do
    if not audioChannel[i].isPlaying then
      this.LoadMusicFile(audioChannel[i], path);
      if this.isSoundEnable then
        audioChannel[i].volume = this.soundVolume;
      else
        audioChannel[i].volume = 0;
      end

      audioChannel[i].loop = false;
      return i;
    end
  end

  return nil;
end

function AudioManager.PlayFurnitureMusicLoop(path)
  if not this.isSoundEnable then return end

  for i = 11, 15 do
    if not audioChannel[i].isPlaying then
      this.LoadMusicFile(audioChannel[i], path);
      if this.isSoundEnable then
        audioChannel[i].volume = this.soundVolume;
      else
        audioChannel[i].volume = 0;
      end

      audioChannel[i].loop = true;
      return i;
    end
  end

  return nil;
end

function AudioManager.GetChannelIsPlaying(channel)
  if channel == nil then return end
  return audioChannel[channel].isPlaying;
end

function AudioManager.StopFurnitureMusic(channel)
  if channel == nil then return end
  audioChannel[channel]:Stop();
end

function AudioManager.StopFurnitureLoopMusic()
  for i = 11, 15 do
    this.StopFurnitureMusic(i);
  end
end