GodzillaEarthquake = InheritsFromBaseAttackSkill();

function GodzillaEarthquake:Update()
    local me = FightField.fightHum[self.humIdx];
    local target = FightField.fightHum[self.tarIdx];

    if self.step == 1 then
        me.roleController:SetAnimationForceId(ERolePose.Special);
        FightField.SetShake(true);
        me:PlaySound(target.colm, target.row, Attack_Start);
        self.interval = 0.2;
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
        self.step = 2;
    elseif self.step == 2 then
        if self:CheckInterval() then
            for i = 0, self.emyNum-1 do
                target = FightField.fightHum[ self.emyIdxAy[i] ];
                me:PlaySound(target.colm, target.row, Attack_Hit);
                me:PlayEffect(target.colm, target.row, ERolePose.Hit);
                FightField.attack[self.humIdx]:SetLightWithOrder( i , EEffectLightDis.Ground, 10103, 250, 1, 5, 5, EEffectLightTracer.Stand, target.nowPos.x + 20,
                        target.nowPos.y + 10, 255, false ,80);
            end
            self.interval = 1.8;
            self.step = 3;
        end
    elseif self.step == 3 then
        if self:CheckInterval() then
            FightField.SetShake(false);
            self.isLightEnd = true;
        end
    end
end