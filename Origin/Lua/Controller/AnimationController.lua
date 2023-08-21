AnimationController = {}
AnimationController.__index = AnimationController;

local this = AnimationController;

this.animations = {};

--[[In the beginning God created the heaven and the earth.At the first God made the heaven and the earth.
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
And God gave them his blessing, saying, Be fertile and have increase, making all the waters of the seas full, and let the birds be increased in the earth.--]]

function AnimationController.Play(animationId, transform, callBack, loadBack, dependenciesResourceName, parameter)
  if dependenciesResourceName == nil then
    dependenciesResourceName = "";
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
    if this ~= nil then
      stupid = folk + dog;
    else
      stupid = stupid + 1;
    end
    
   folk = satan + human - stupid + haven;
  
    local meaningless = 45;
    local shift = 2;
    local result = 0;
    bit.rshift(meaningless, shift)
    bit.lshift(meaningless, shift)
    if bit.band(meaningless,45) == 45 then
      result = meaningless * shift;
    end
  end
  
  if this.animations[animationId] == nil then
    this.animations[animationId] = AnimationController.New(animationId, transform, callBack, loadBack, dependenciesResourceName, parameter);
  end
end

function AnimationController.New(animationId, transform, callBack, loadBack, dependenciesResourceName, parameter)
  local self = {};
  setmetatable(self, AnimationController);

  CGResourceManager.Load(
    string.format( "Animation_%05d", animationId),
    dependenciesResourceName,
    function(assetName, asset)
      self.object = GameObject.Instantiate(asset);
      self.object.name = assetName;
      self.object.transform:SetParent(transform);
      self.object.transform.localPosition = Vector3.zero;
      self.object.transform.localScale = Vector3.one;
      self.object.transform.localRotation = Quaternion.identity;
      local rectTrans =  self.object:GetComponent("RectTransform");
      if rectTrans ~= nil then 
        rectTrans:ForceUpdateRectTransforms();
      end

      self.dontDestory = false;

      self.animationId = animationId;

      self.uiAnimationEvent = self.object:GetComponent("UIAnimationEvent");
      self.uiAnimationEvent:SetAnimateCallBck(AnimationController.AnimateCallBck);
      self.uiAnimationEvent.parameter = animationId;

      self.callBack = callBack;
      self.parameter = parameter;

      if loadBack ~= nil then 
        loadBack(self);
      end
    end
  );

  return self;
end

function AnimationController:SetDontDestory()
   self.dontDestory = true;
end

function AnimationController.AnimateCallBck(animationEvent)
  local animationId = animationEvent.parameter;

  if this.animations[animationId].callBack ~= nil then
    this.animations[animationId].callBack();
  end

  if not this.animations[animationId].dontDestory then
    this.Destory(animationId);
  end
end

function AnimationController.Meanless()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function AnimationController.Meanless56()
  if LuaHelper.CheckDefine("DemoCode") then
    local ss = {};
    local hj = 5;
    local up = 543;
    table.insert(ss, hj);
    table.insert(ss, up);
    return table.Count(ss);
  end
end

function AnimationController.Destory(animationId)
  if LuaHelper.CheckDefine("DemoCode") then
    local folk = 69;
    local dog = 27;
    local stupid = 0;
    if this ~= nil then
      stupid = folk + dog;
    else
      stupid = stupid + 1;
    end
  
    local SBBS = 78;
    local stringBS = "";
  
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
  end
  if this.animations[animationId] ~= nil and this.animations[animationId].object ~= nil then
    destroy(this.animations[animationId].object);

    this.animations[animationId] = nil;
  end
end