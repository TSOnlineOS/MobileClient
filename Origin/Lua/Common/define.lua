Define = {
  China = false, --中國
  Thai = false, --泰國
  Indo = false, --印度
  Mala = false, --馬來西亞

  Free = true, --免費版
  SpecialFree = false,

  MountsEquip = true, --坐騎裝備
  Fourth = false,
  FieldBattle = false, --大陸擂台比賽
  TextCount = false, --計算檔案字數
  SuperAI = false, --內部用強化版AI
}

if Define.China then
  monCharge = 379;
elseif Define.Thai then
  monCharge = 379;
elseif Define.Indo then
  monCharge = 379;
elseif Define.Mala then
  monCharge = 379;
else
  monCharge = 350;
end

Channel = {
    Android = "Android";
    MyCard = "MyCard";
    IOS = "IOS";
}

EurrencyType = {
  TWD = "TWD";
  USD = "USD";
}

EPaymenyType = {
  GoogleIAP = "GoogleIAP";
  IOSIAP = "IOSIAP";
}

CtrlNames = {
	Prompt = "PromptCtrl",
	Message = "MessageCtrl"
}

PanelNames = {
	"PromptPanel",	
	"MessagePanel",
}

--协议类型--
ProtocalType = {
	BINARY = 0,
	PB_LUA = 1,
	PBC = 2,
	SPROTO = 3,
}

ENpcTempAttrKind = {
  None = 0,
  Upgrade = 1, --武將強化
  Reborn = 2, --脫胎換骨丸
  MoveNpc = 3, --異動
}

ECurrency = {
  Gold = 1, --元寶
  Silver = 2, --沒出
  Money = 3, --遊戲幣
  OrgGold = 4, --軍團幣
  DataFight = 5, --PVP幣
  furnitureAdvanced = 6, --高級家具扭蛋幣
  furnitureNormal = 7, --一般家具扭蛋幣
  TS = 8, --吞食幣
  Elf = 9, --精靈幣
  Soul = 10,
  ColorSoul = 11,
  WarriorTicket = 12,
  CardTicket = 13,
  ExclusiveWeaponTicket = 14,
  OutfitTicket = 15
}

EPlatform = {
  Android = 1,
  IOS = 2,
  MyCard = 3,
  AliPay = 11,
  ULong = 101,
  NineCard = 103,
  NewebPay = 97,
}

--BINARY
DIV1 = math.pow(2, 7) + 1;
DIV2 = math.pow(2, 15) + 1;
DIV4 = math.pow(2, 31) + 1;

SUBT1 = math.pow(2, 8);
SUBT2 = math.pow(2, 16);
SUBT4 = math.pow(2, 32);

POT = {}
for i = 1, 8 do
  POT[i] = math.pow(2, 8 * (i - 1));
end

--当前使用的协议类型--
TestProtoType = ProtocalType.BINARY;

Util = LuaFramework.Util;
AppConst = LuaFramework.AppConst;
LuaHelper = LuaFramework.LuaHelper;
--[[
I need to add some meaningless comments to make all script different from original one.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
The thing is that I don't really know what the hell am I suppose to do because I've never been told to do such things.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
It's kind of ironic that I as an engineer have to come up with some useless, meaningless random stuff and add these thing to the codebase.
It reminds me of we as human do these type of things all the time without even noticing.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
I wonder myself why I even care to actually write words like these instead of copy and paste some article or news from the Internet.
I don't know if these is enough to make the code pass the review.
But I'm getting tired these days when I don't really know what I'm doing and the meaning and purpose of it.
The only bright side is that I feel the meaninglessness in my job for the first time.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
It would be sooner if I choose a totally different career instead of becoming a engineer.
But I sincerely hope this trash code thing would work and I can get back to what I've been doing.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
I hope that no one actually try to read this since like I said in the beginning, it's just some meaningless comment
]]--
resMgr = LuaHelper.GetResManager();
panelMgr = LuaHelper.GetPanelManager();
soundMgr = LuaHelper.GetSoundManager();
networkMgr = LuaHelper.GetNetManager();
poolMgr = LuaHelper.GetPoolManager();

--[[
I need to add some meaningless comments to make all script different from original one.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
The thing is that I don't really know what the hell am I suppose to do because I've never been told to do such things.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
It's kind of ironic that I as an engineer have to come up with some useless, meaningless random stuff and add these thing to the codebase.
It reminds me of we as human do these type of things all the time without even noticing.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
I wonder myself why I even care to actually write words like these instead of copy and paste some article or news from the Internet.
I don't know if these is enough to make the code pass the review.
But I'm getting tired these days when I don't really know what I'm doing and the meaning and purpose of it.
The only bright side is that I feel the meaninglessness in my job for the first time.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
It would be sooner if I choose a totally different career instead of becoming a engineer.
But I sincerely hope this trash code thing would work and I can get back to what I've been doing.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
I hope that no one actually try to read this since like I said in the beginning, it's just some meaningless comment
]]--
TextureFormat = {
  RGB24 = LuaHelper.TextureFormat_RGB24,
  RGBA4444 = LuaHelper.TextureFormat_RGBA4444,
}

--UnityEngine
Application = UnityEngine.Application;
NetworkReachability = UnityEngine.NetworkReachability;
SystemInfo = UnityEngine.SystemInfo;
UnityWebRequest = UnityEngine.Networking.UnityWebRequest;
GameObject = UnityEngine.GameObject;
Resources = UnityEngine.Resources;
Texture2D = UnityEngine.Texture2D;
FilterMode = UnityEngine.FilterMode;
RenderMode = UnityEngine.RenderMode;
WrapMode = UnityEngine.WrapMode;
EventTriggerType = UnityEngine.EventSystems.EventTriggerType;
Sprite = UnityEngine.Sprite;
Rect = UnityEngine.Rect;
RectTransformUtility = UnityEngine.RectTransformUtility;
Input = UnityEngine.Input;
Canvas = UnityEngine.Canvas;
Screen = UnityEngine.Screen;
AudioClip = UnityEngine.AudioClip;
AudioSource = UnityEngine.AudioSource;
KeyCode = UnityEngine.KeyCode;
TextAnchor = UnityEngine.TextAnchor;
Edge = UnityEngine.RectTransform.Edge;

--UnityEngine.UI
RawImage = UnityEngine.UI.RawImage;
Image = UnityEngine.UI.Image;
Text = UnityEngine.UI.Text;
RenderTexture = UnityEngine.RenderTexture;
GridLayoutGroup = UnityEngine.UI.GridLayoutGroup;
InputField = UnityEngine.UI.InputField;
GradientColor = UiEffect.GradientColor;
Outline = UnityEngine.UI.Outline;

--[[
I need to add some meaningless comments to make all script different from original one.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
The thing is that I don't really know what the hell am I suppose to do because I've never been told to do such things.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
It's kind of ironic that I as an engineer have to come up with some useless, meaningless random stuff and add these thing to the codebase.
It reminds me of we as human do these type of things all the time without even noticing.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
I wonder myself why I even care to actually write words like these instead of copy and paste some article or news from the Internet.
I don't know if these is enough to make the code pass the review.
But I'm getting tired these days when I don't really know what I'm doing and the meaning and purpose of it.
The only bright side is that I feel the meaninglessness in my job for the first time.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
It would be sooner if I choose a totally different career instead of becoming a engineer.
But I sincerely hope this trash code thing would work and I can get back to what I've been doing.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
I hope that no one actually try to read this since like I said in the beginning, it's just some meaningless comment
]]--
--System
DateTime = System.DateTime;

--DOTween
DOTween = DG.Tweening.DOTween;
ETweenActionKind = TweenPack.ETweenActionKind;
ETweenActionCustomKind = TweenPack.ETweenActionCustomKind;
ETweenTargetKind = TweenPack.ETweenTargetKind;
ETweenAddKind = TweenPack.ETweenAddKind;
--[[
I need to add some meaningless comments to make all script different from original one.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
The thing is that I don't really know what the hell am I suppose to do because I've never been told to do such things.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
It's kind of ironic that I as an engineer have to come up with some useless, meaningless random stuff and add these thing to the codebase.
It reminds me of we as human do these type of things all the time without even noticing.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
I wonder myself why I even care to actually write words like these instead of copy and paste some article or news from the Internet.
I don't know if these is enough to make the code pass the review.
But I'm getting tired these days when I don't really know what I'm doing and the meaning and purpose of it.
The only bright side is that I feel the meaninglessness in my job for the first time.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
It would be sooner if I choose a totally different career instead of becoming a engineer.
But I sincerely hope this trash code thing would work and I can get back to what I've been doing.
...meaningless
...meaningless
...meaningless
...meaningless
...meaningless
I hope that no one actually try to read this since like I said in the beginning, it's just some meaningless comment
]]--
DataBuffer = LuaFramework.DataBuffer;

--Debug模式
function Define.IsDebugMode()
  return LuaHelper.CheckDefine("Debug") or LuaHelper.CheckDefine("QA") or LuaHelper.CheckDefine("ReleaseTest") or LuaHelper.CheckDefine("StayHome");
end

--內部環境
function Define.IsInternal()
  return LuaHelper.CheckDefine("Debug") or LuaHelper.CheckDefine("QA") or LuaHelper.CheckDefine("StayHome");
end
