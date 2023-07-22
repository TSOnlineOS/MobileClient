RequiemBossData= {}
RequiemBossData.__index = RequiemBossData;
local this = RequiemBossData;

function RequiemBossData.Random()
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

function RequiemBossData.New(reader)
    local self = {};
    setmetatable(self, RequiemBossData);

    self.npcID = reader:ReadUInt16();
    self.npc = npcDatas[self.npcID];
    local kind = reader:ReadByte();
    if kind == 2 then
        self.kind = ERequiemBossKind.Sacrifice;
    else
        self.kind = ERequiemBossKind.Normal;
    end

    self.lootStar = {};
    self.lootStar[1] = reader:ReadByte();
    self.lootStar[2] = reader:ReadByte();

    return self.npcID, self;
end

function RequiemBossData.Random1()
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

function RequiemBossData.Random2()
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

