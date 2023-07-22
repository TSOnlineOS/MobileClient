SKILL22042 = InheritsFromBaseAttackSkill();

function SKILL22042:Update()
    local me = FightField.fightHum[self.humIdx];
    local target = FightField.fightHum[self.tarIdx];

    if self.step == 1 then
        local newPos = me:GetMagicPos();
        me:SetMoment(newPos.x, newPos.y, false);
        me.roleController:MagicAttack();
        self:DoStep1Light();
        self.interval = 0.8;
        self.step = 2;
    elseif self.step == 2 then
        if self:CheckInterval() then
            for i = 0, self.emyNum - 1 do
                target = FightField.fightHum[self.emyIdxAy[i]];
                FightField.attack[self.humIdx]:SetLightWithOrder(i + 2, EEffectLightDis.Sky ,10417, 80, 1, 8, 8, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 0);
                FightField.attack[self.humIdx]:SetLightWithOrder(i + 6, EEffectLightDis.Sky ,10406, 80, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y, 30, true, 35);
            end
            self.interval = 0.8;
            self.step = 3;
        end
    elseif self.step == 3 then
        if self:CheckInterval() then
            self:DoStep3Light();
            self.interval = 0.8;
            self.step = 4;
        end
    elseif self.step == 4 then
        if self:CheckInterval() then
            me:PlaySound(target.colm, target.row, Attack_Start);
            self.step = 5;
        end
    elseif self.step == 5 then
        self.isLightEnd = true;
        self.step = 6;
    end
end

function SKILL22042:DoStep1Light()
    local me = FightField.fightHum[self.humIdx];
    FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Ground ,10077, 50, 1, 21, 21, EEffectLightTracer.StandAni, me.nowPos.x + 5, me.nowPos.y, 20, true, 90);
end

function SKILL22042:DoStep3Light()
    for i = 0, self.emyNum - 1 do
        local target = FightField.fightHum[self.emyIdxAy[i]];
        FightField.attack[self.humIdx]:SetLightWithOrder(i + 2, EEffectLightDis.Sky ,10847, 80, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y - 35, 30, true, 100);
    end
end