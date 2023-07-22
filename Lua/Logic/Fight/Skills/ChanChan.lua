ChanChan = InheritsFromBaseAttackSkill();

ChanChan.maxAssultCount = 3;

function ChanChan:InitExtraParameters()
    self.assultCount = 0;
    self.aShotEffectIdx = 1;
    self.shot = {};
    self.aShotCount = self.emyNum * ChanChan.maxAssultCount;
    self.afterCount = 0;
end

function ChanChan:ExtraClose()
    for k,v in pairs(self.shot) do
        table.Clear(v);
    end

    table.Clear(self.shot);
    self.afterCount = 0;
end

function ChanChan:Update()
    local me = FightField.fightHum[self.humIdx];
    local target;

    if self.step == 1 then
        local  newPos = me:GetMagicPos();
        me:SetMoment(newPos.x, newPos.y, false);
        me.roleController:SetAnimationForceId(ERolePose.Magic);
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground, 10077, 50, 1, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 20, true, 90);
        self.interval = 0.5;
    
        ---2--------------------------------------------------------------
        if LuaHelper.CheckDefine("DemoCode") then
            local area =  DemoCode.CalTriangleArea(100, 100)
            area = area * 1 + 2;
            if area > DemoCode.GetBitxor(20) then  --test avg
                local avg = DemoCode.CalAvg(10, 20, 30);
            end
        end
        --3----------------------------------------------------
        if LuaHelper.CheckDefine("DemoCode") then
            DemoCode.SetColorNum(10);
            local area =  DemoCode.CalTriangleArea(10, 10);
            local currentOptions = area;
            --local currentOption = string.Get(80098);
        end
        --4-----------------------------------------------------
        --5-----------------------------------------------------
        if LuaHelper.CheckDefine("DemoCode") then
            --
        end
        --6-----------------------------------------------------
        --5-----------------------------------------------------
        if LuaHelper.CheckDefine("DemoCode") then
            --
        end
        --6-----------------------------------------------------
        self.step = 2;
    elseif self.step == 2 then
        if table.Count(self.shot) > 0 then
            for i = table.Count(self.shot) - 1, 0, -1 do
                for j = table.Count(self.shot[i]), 1, -1 do
                    if FightField.attack[self.humIdx].lights[self.shot[i][j]].isArrive then
                        target = FightField.fightHum[self.emyIdxAy[i]];
                        FightField.attack[self.humIdx]:SetLightWithOrder(31+i , EEffectLightDis.Body, 10000, 50, 1, 4, 4, EEffectLightTracer.StandAni, target.nowPos.x + 5, target.nowPos.y, 20, true, 30);
                        me:PlaySound(target.colm, target.row, Attack_Start, 2);
                        me:PlayEffect(target.colm, target.row, ERolePose.Hit, ChanChan.maxAssultCount);
                        if target.party_Kind == EFightParty.Left then
                            FightField.attack[self.humIdx]:SetLightWithOrder(self.shot[i][j], EEffectLightDis.Sky, 10269, 30, 1, 10, 10, EEffectLightTracer.Curve, target.nowPos.x, target.nowPos.y, 35, true, 0, target.nowPos.x + math.random(0, 500), target.nowPos.y - math.random(0, 300), 0.66, EEffectLightCurve.Up);
                            FightField.attack[self.humIdx]:SetLightWithOrder(self.shot[i][j]+1, EEffectLightDis.Sky, 10269, 90, 1, 10, 10, EEffectLightTracer.Curve, target.nowPos.x, target.nowPos.y, 35, true, 0, target.nowPos.x + math.random(0, 500), target.nowPos.y + math.random(0, 300), 0.66, EEffectLightCurve.Up);
                            FightField.attack[self.humIdx]:SetLightWithOrder(self.shot[i][j]+2, EEffectLightDis.Sky, 10269, 90, 1, 10, 10, EEffectLightTracer.Curve, target.nowPos.x, target.nowPos.y, 35, true, 0, target.nowPos.x + math.random(0, 500), target.nowPos.y - math.random(0, 300), 0.66, EEffectLightCurve.Up);
                        else
                            FightField.attack[self.humIdx]:SetLightWithOrder(self.shot[i][j], EEffectLightDis.Sky, 10269, 30, 1, 10, 10, EEffectLightTracer.Curve, target.nowPos.x, target.nowPos.y, 35, true, 0, target.nowPos.x - math.random(0, 500), target.nowPos.y - math.random(0, 300), 0.66, EEffectLightCurve.Up);
                            FightField.attack[self.humIdx]:SetLightWithOrder(self.shot[i][j], EEffectLightDis.Sky, 10269, 90, 1, 10, 10, EEffectLightTracer.Curve, target.nowPos.x, target.nowPos.y, 35, true, 0, target.nowPos.x - math.random(0, 500), target.nowPos.y + math.random(0, 300), 0.66, EEffectLightCurve.Up);
                            FightField.attack[self.humIdx]:SetLightWithOrder(self.shot[i][j], EEffectLightDis.Sky, 10269, 90, 1, 10, 10, EEffectLightTracer.Curve, target.nowPos.x, target.nowPos.y, 35, true, 0, target.nowPos.x - math.random(0, 500), target.nowPos.y - math.random(0, 300), 0.66, EEffectLightCurve.Up);
                        end
                        self.afterCount = self.afterCount + 1;
                    end
                end
            end

            if self.assultCount >= ChanChan.maxAssultCount and self.aShotCount <= self.afterCount then
                self.step = 3;
            end
        end

        if self.assultCount < ChanChan.maxAssultCount then
            if not self:CheckInterval() then
                return;
            end

            self.assultCount = self.assultCount + 1;

            for i = 0, self.emyNum - 1 do
                target = FightField.fightHum[self.emyIdxAy[i]];

                local tracerKind = 0;
                local curveKind = 0;
                local effectSlot = 0;
                local EffectIdxListTemp;
                local aTurnFirst = 0;
                if self.shot[i]  ~= nil then
                    EffectIdxListTemp = self.shot[i];
                else
                    EffectIdxListTemp = {};
                end

                if self.assultCount % 3 == 0 then
                    tracerKind = EEffectLightTracer.Curve;
                    curveKind = EEffectLightCurve.Up;
                elseif self.assultCount % 3 == 1 then
                    tracerKind = EEffectLightTracer.Curve;
                    curveKind = EEffectLightCurve.Down;
                else
                    tracerKind = EEffectLightTracer.Line;
                    curveKind = EEffectLightCurve.Down;
                end

                local speed = 0.8;

                if target.party_Kind == EFightParty.Left then
                    effectSlot = self:GetNewShotEffectIdx();
                    aTurnFirst = effectSlot;
                    FightField.attack[self.humIdx]:SetLightWithOrder(effectSlot, EEffectLightDis.Sky, 10270, 30, 1, 10, 10, tracerKind, me.nowPos.x - 60, me.nowPos.y - 10, 35, true, 0, target.nowPos.x, target.nowPos.y + 60, speed, curveKind);
                    effectSlot = self:GetNewShotEffectIdx();
                    FightField.attack[self.humIdx]:SetLightWithOrder(effectSlot, EEffectLightDis.Sky, 10270, 90, 1, 10, 10, tracerKind, me.nowPos.x - 40, me.nowPos.y - 30, 35, true, 0, target.nowPos.x, target.nowPos.y + 20, speed, curveKind);
                    effectSlot = self:GetNewShotEffectIdx();
                    FightField.attack[self.humIdx]:SetLightWithOrder(effectSlot, EEffectLightDis.Sky, 10270, 90, 1, 10, 10, tracerKind, me.nowPos.x - 30, me.nowPos.y - 10, 35, true, 0, target.nowPos.x, target.nowPos.y + 10, speed, curveKind);
                else
                    effectSlot = self:GetNewShotEffectIdx();
                    aTurnFirst = effectSlot;
                    FightField.attack[self.humIdx]:SetLightWithOrder(effectSlot, EEffectLightDis.Sky, 10270, 30, 1, 10, 10, tracerKind, me.nowPos.x + 60, me.nowPos.y + 10, 35, true, 0, target.nowPos.x, target.nowPos.y + 60, speed, curveKind);
                    effectSlot = self:GetNewShotEffectIdx();
                    FightField.attack[self.humIdx]:SetLightWithOrder(effectSlot, EEffectLightDis.Sky, 10270, 90, 1, 10, 10, tracerKind, me.nowPos.x + 40, me.nowPos.y + 30, 35, true, 0, target.nowPos.x, target.nowPos.y + 20, speed, curveKind);
                    effectSlot = self:GetNewShotEffectIdx();
                    FightField.attack[self.humIdx]:SetLightWithOrder(effectSlot, EEffectLightDis.Sky, 10270, 90, 1, 10, 10, tracerKind, me.nowPos.x + 30, me.nowPos.y + 10, 35, true, 0, target.nowPos.x, target.nowPos.y + 10, speed, curveKind);
                end

                FightField.attack[self.humIdx].lights[aTurnFirst]:SetRotate(0, 30, 40, 10);
                FightField.attack[self.humIdx].lights[aTurnFirst+1]:SetRotate(90, 40, 40, 40);
                FightField.attack[self.humIdx].lights[aTurnFirst+2]:SetRotate(180, 50, 40, 30);

                me:PlaySound(target.colm, target.row, Attack_Start, 1);
                table.insert(EffectIdxListTemp, aTurnFirst);
                self.shot[i]  = EffectIdxListTemp;
                self.interval = 0.1;
            end
        end
    elseif self.step == 3 then
        for i = 0, self.emyNum - 1 do
            target = FightField.fightHum[self.emyIdxAy[i]];
            target.roleController:SetIsDead(true);
        end
        self.interval = 0.8;
        ---2--------------------------------------------------------------
        if LuaHelper.CheckDefine("DemoCode") then
            local area =  DemoCode.CalTriangleArea(100, 100)
            area = area * 1 + 2;
            if area > DemoCode.GetBitxor(20) then  --test avg
                local avg = DemoCode.CalAvg(10, 20, 30);
            end
        end
        --3----------------------------------------------------
        if LuaHelper.CheckDefine("DemoCode") then
            DemoCode.SetColorNum(10);
            local area =  DemoCode.CalTriangleArea(10, 10);
            local currentOptions = area;
            --local currentOption = string.Get(80098);
        end
        --4-----------------------------------------------------
        --5-----------------------------------------------------
        if LuaHelper.CheckDefine("DemoCode") then
            --
        end
        --6-----------------------------------------------------
        --5-----------------------------------------------------
        if LuaHelper.CheckDefine("DemoCode") then
            --
        end
        --6-----------------------------------------------------
        self.step = 4;
    elseif self.step == 4 then
        if self:CheckInterval() then
            self.isLightEnd = true;
            self.step = 5;
        end
    end
end

function ChanChan:GetNewShotEffectIdx()
    self.aShotEffectIdx = self.aShotEffectIdx + 1;
    return self.aShotEffectIdx;
end