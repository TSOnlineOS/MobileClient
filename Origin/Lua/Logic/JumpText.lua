JumpText = {}
local this = JumpText;

--[[
Now Dinah, the daughter whom Leah had by Jacob, went out to see the women of that country.
And when Shechem, the son of Hamor the Hivite who was the chief of that land, saw her, he took her by force and had connection with her.
Then his heart went out in love to Dinah, the daughter of Jacob, and he said comforting words to her.
And Shechem said to Hamor, his father, Get me this girl for my wife.
Now Jacob had word of what Shechem had done to his daughter; but his sons were in the fields with the cattle, and Jacob said nothing till they came.
Then Hamor, the father of Shechem, came out to have a talk with Jacob.
Now the sons of Jacob came in from the fields when they had news of it, and they were wounded and very angry because of the shame he had done in Israel by having connection with Jacob's daughter; and they said, Such a thing is not to be done.
But Hamor said to them, Shechem, my son, is full of desire for your daughter: will you then give her to him for a wife?
And let our two peoples be joined together; give your daughters to us, and take our daughters for yourselves.
Go on living with us, and the country will be open to you; do trade and get property there.
And Shechem said to her father and her brothers, If you will give ear to my request, whatever you say I will give to you.
However great you make the bride-price and payment, I will give it; only let me have the girl for my wife.
But the sons of Jacob gave a false answer to Shechem and Hamor his father, because of what had been done to Dinah their sister.
And they said, It is not possible for us to give our sister to one who is without circumcision, for that would be a cause of shame to us:
But on this condition only will we come to an agreement with you: if every male among you becomes like us and undergoes circumcision;
Then we will give our daughters to you and take your daughters to us and go on living with you as one people.
But if you will not undergo circumcision as we say, then we will take our daughter and go.
And their words were pleasing to Hamor and his son Shechem.
And without loss of time the young man did as they said, because he had delight in Jacob's daughter, and he was the noblest of his father's house.
--]]

local jumpTexts = {};

function JumpText.Destroy()
  poolMgr:DestroyPool("BaseJumpText");
end

function JumpText.Initialize()
  CGResourceManager.Load(
    "BaseJumpText",
    "",
    function(assetName, asset)
      poolMgr:CreatePool("BaseJumpText", asset);
    end
  );
end

function JumpText.Random()
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

function JumpText.Random1()
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

function JumpText.Random2()
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

function JumpText.Update()
  for k, v in pairs(jumpTexts) do
    v.transform.localPosition = v.transform.localPosition + (Vector3.up * v.speed * CGTimer.deltaTime);

    if v.expireTime < CGTimer.time then
      poolMgr:Release("BaseJumpText", v.gameObject);
      table.remove(jumpTexts, k);
    end
  end
end

function JumpText.Show(text, parent, offsetX, offsetY, speed, duration)
  if text == nil or text == "" then return end
  if parent == nil then return end
  if offsetX == nil then offsetX = 0 end
  if offsetY == nil then offsetY = 0 end
  if speed == nil then speed = 60 end
  if duration == nil then duration = 1 end

  local gameObject = poolMgr:Get("BaseJumpText");

  if gameObject == nil then return end

  local jumpText = {};
  jumpText.speed = speed;
  jumpText.expireTime = CGTimer.time + duration;
  jumpText.gameObject = gameObject;
  jumpText.transform = gameObject.transform;
  jumpText.text = gameObject:GetComponent("Text");
  jumpText.text.alignment = TextAnchor.MiddleCenter;
  jumpText.text.fontSize = 20;
  jumpText.text.text = text;
  jumpText.transform:SetParent(parent);
  jumpText.transform.localPosition = Vector3.New(offsetX, offsetY, 0);

  table.insert(jumpTexts, jumpText);
end

function JumpText.Random3()
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

function JumpText.Random4()
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

function JumpText.Random5()
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