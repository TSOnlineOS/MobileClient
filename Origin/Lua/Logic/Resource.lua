
Resource = {}
local this = Resource;

--[[
Now after these things, word came to Joseph that his father was ill: and he took with him his sons Manasseh and Ephraim.
And when they said to Jacob, Your son Joseph is coming to see you: then Israel, getting all his strength together, had himself lifted up in his bed.
And Jacob said to Joseph, God, the Ruler of all, came to me in a vision at Luz in the land of Canaan, and gave me his blessing,
And said to me, Truly, I will make you fertile and give you increase and will make of you a great family of nations: and I will give this land to your seed after you to be their heritage for ever.
And now your two sons who came to birth in Egypt before I came to you here, are mine; Ephraim and Manasseh will be mine, in the same way as Reuben and Simeon are.
And any other offspring which you have after them, will be yours, and will be named after their brothers in their heritage.
And as for me, when I came from Paddan, death overtook Rachel on the way, when we were still some distance from Ephrath; and I put her to rest there on the road to Ephrath, which is Beth-lehem.
Then Israel, looking at Joseph's sons, said, Who are these?
And Joseph said to his father, They are my sons, whom God has given me in this land. And he said, Let them come near me, and I will give them a blessing.
Now because Israel was old, his eyes were no longer clear, and he was not able to see. So he made them come near to him, and he gave them a kiss, folding them in his arms.
And Israel said to Joseph, I had no hope of seeing your face again, but God in his mercy has let me see you and your children.
Then Joseph took them from between his knees, and went down on his face to the earth.
Then taking Ephraim with his right hand, Joseph put him at Israel's left side, and with his left hand he put Manasseh at Israel's right side, placing them near him.
And Israel, stretching out his right hand, put it on the head of Ephraim, the younger, and his left hand on the head of Manasseh, crossing his hands on purpose, for Manasseh was the older.
And he gave Joseph a blessing, saying, May the God to whom my fathers, Abraham and Isaac, gave worship, the God who has taken care of me all my life till this day,
The angel who has been my saviour from all evil, send his blessing on these children: and let my name and the name of my fathers, Abraham and Isaac, be given to them; and let them become a great nation in the earth.
Now when Joseph saw that his father had put his right hand on the head of Ephraim, it did not seem right to him; and lifting his father's hand he would have put it on the head of Manasseh.
And Joseph said to his father, Not so, my father, for this is the older; put your right hand on his head.
But his father would not, saying, I am doing it on purpose, my son; he will certainly become a nation and a great one; but his younger brother will be greater than he, and his seed will become a great family of nations.
So he gave them his blessing that day, saying, You will be the sign of blessing in Israel, for they will say, May God make you like Ephraim and Manasseh; and he put Ephraim before Manasseh.
--]]

this.checkSizeDone = false;
this.assetLoaded = false;
this.dataLoaded = false;
this.imageLoaded = false;

this.rmsSize = 0;
this.dataSize = 0;
this.imageSize = 0;

this.DonwloadResource = "DonwloadResource";
this.DonwloadResourceDone = "DonwloadResourceDone";

function Resource.CheckResourceSize()
  this.rmsSize = 0;
  this.dataSize = 0;
  this.imageSize = 0;

  CGResourceManager.CheckPackageSzie();

  while not CGResourceManager.checkPackageDone do
    coroutine.yield();
  end

  if CGResourceManager.currentDownloadSize == 0 then -- BasePackage都載完不需要更新才會檢查散檔的Resources
    CGResourceManager.CheckResourceSzie();

    while not CGResourceManager.checkPackageDone do
      coroutine.yield();
    end
  end

  this.rmsSize = CGResourceManager.currentDownloadSize;

  CGResourceManager.UpdateDataPacked(true, "Sty.dat", "Data.dat", "Ensign.dat");

  while not CGResourceManager.dataDownloadDone do
    coroutine.yield();
  end

  this.dataSize = CGResourceManager.currentDownloadSize - this.rmsSize;

  if LuaHelper.IsAndroidPlatform then
    CGResourceManager.UpdateImagePack(true, "Jma.dat", "ETCPmg.dat", "ETCJmg.dat", "CompreseData.dat");
  elseif LuaHelper.IsApplePlatform then
    CGResourceManager.UpdateImagePack(true, "Jma.dat", "PVRPmg.dat", "PVRJmg.dat", "CompreseData.dat");
  else
    CGResourceManager.UpdateImagePack(true, "Jma.dat", "DXTPmg.dat", "DXTJmg.dat", "CompreseData.dat");
  end

  while not CGResourceManager.checkImageDone do
    coroutine.yield();
  end

  this.imageSize = CGResourceManager.currentDownloadSize - this.rmsSize - this.dataSize;

  if CGResourceManager.currentDownloadSize ~= 0 then
    CGResourceManager.ShowMessage( string.format( Str_DownloadSize, CGResourceManager.currentDownloadSize * 0.000001, ( CGResourceManager.currentDepressSize + this.rmsSize ) * 0.000001 ),  this.CheckResourceSizeDone);
  else
    this.checkSizeDone = true;
  end
end

function Resource.CheckResourceSizeDone()
  this.checkSizeDone = true;
  
  if LuaHelper.CheckDefine("DemoCode") then
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
--  if not LuaHelper.IsSimpleDiskUtilsWork() then
--    this.checkSizeDone = true;
--    return;
--  end

--  if LuaHelper.GetAvailableSpace() < ( CGResourceManager.currentDepressSize + this.rmsSize ) * 0.000001 then
--    CGResourceManager.ShowMessage( Str_DiskFull, Game.Quit );
--  else
--    this.checkSizeDone = true;
--  end
end

function Resource.Demo()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Resource.Demo1()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Resource.Demo2()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Resource.Demo3()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Resource.GetRmsSizePercent()
  return this.rmsSize / CGResourceManager.currentDownloadSize;
end

function Resource.GetDataSizePercent()
  return this.dataSize / CGResourceManager.currentDownloadSize;
end

function Resource.GetImageSizePercent()
  return this.imageSize / CGResourceManager.currentDownloadSize;
end

function Resource.LoadAllAssets()
  CGResourceManager.LoadAllAssets();

  while not CGResourceManager.loaded do
    UILoading.ShowAssetProgress();
    coroutine.yield();
  end

  this.assetLoaded = true;
end

function Resource.Demo4()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Resource.UpdateDataPacked()
  CGResourceManager.UpdateDataPacked(false, "Sty.dat", "Data.dat", "Ensign.dat");

  while not CGResourceManager.dataDownloadDone do
    UILoading.ShowDataProgress();
    coroutine.yield();
  end

  this.dataLoaded = true;
end

function Resource.Dem5()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Resource.Demo6()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Resource.UpdateResourcePacked()
  if LuaHelper.IsAndroidPlatform then
    CGResourceManager.UpdateImagePack(false, "CompreseData.dat", "Jma.dat", "ETCPmg.dat", "ETCJmg.dat");
  elseif LuaHelper.IsApplePlatform then
    CGResourceManager.UpdateImagePack(false, "CompreseData.dat", "Jma.dat", "PVRPmg.dat", "PVRJmg.dat");
  else
    CGResourceManager.UpdateImagePack(false, "CompreseData.dat", "Jma.dat", "DXTPmg.dat", "DXTJmg.dat");
  end

  while not CGResourceManager.imageDownloadDone do
    UILoading.ShowImageProgress();
    coroutine.yield();
  end

  this.imageLoaded = true;
end

function Resource.SaveDownloadDone()
  if this.HaveDownloadResource() then return end

  PluginManager.DownloadDone("ResourceDownloadDone");

  CGResourceManager.WriteText(this.DonwloadResourceDone, "1");
end

function Resource.SaveDownloadResource()
  if this.HaveDownloadResource() then return end

  PluginManager.StartDownload("ResourceDownloadStart");

  CGResourceManager.WriteText(this.DonwloadResource, "1");
end

function Resource.HaveDownloadResource()
  return CGResourceManager.ReadText(this.DonwloadResource) ~= "";
end

function Resource.Demo7()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Resource.Demo8()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Resource.Demo9()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function Resource.IsNeedDownloadResource(sceneId)
  -- 10801 10851 M版場景
  --10821 10853  NFT版場景
  if sceneId ~= 10801 and sceneId ~= 10851 and sceneId ~= 10821 and sceneId ~= 10853 and not this.HaveDownloadResource() then
    Game.Logout(true);
    return true;
  end
 
  return false;
end

function Resource.UserCheckUpdate()
  UILoading.StartLoadAsset();
  UILoading.SetSliderValue(0);
  UI.Open(UILoading);
  CGResourceManager.ShowMessage(Str_NeedDownLoadResource, Resource.RestartGame);
end

function Resource.RestartGame()
  this.SaveDownloadResource();

  --Clear
  UI.Destroy();
  AudioManager.Destroy();
  Role.Destroy();
  MapManager.Destroy();
  EffectLight.Destroy();
  FightField.Destroy();
  FightNumber.Destroy();
  DoorManager.Destroy();
  HouseManager.Destroy();
  GdThingManager.Destroy();
  MoviePlayer.Destroy();
  JumpText.Destroy();
  
  --Restart
  Util.Restart();
end

function Resource.Demo10()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end