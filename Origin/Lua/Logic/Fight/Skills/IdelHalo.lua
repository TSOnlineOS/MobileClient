IdelHalo = InheritsFromBaseAttackSkill();

function IdelHalo:InitExtraParameters()
    self.effectColor = LuaHelper.GetColor(255, 255, 0, 255);
end

function IdelHalo:Update()
    local me = FightField.fightHum[self.humIdx];
    local target = FightField.fightHum[self.tarIdx];

    if self.step == 1 then
        FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 10852, 100, 1, 10, 20, EEffectLightTracer.Line, me.nowPos.x - 30, me.nowPos.y + 30, 30, true, 0, me.nowPos.x - 30, me.nowPos.y - 200, 0.662);
        self.step = 2;
    elseif self.step == 2 then
        if FightField.attack[self.humIdx].lights[1].isArrive then
            for i = 0, self.emyNum-1 do
                target = FightField.fightHum[self.emyIdxAy[i]];
                FightField.attack[self.humIdx]:SetLightWithOrder(1 + i, EEffectLightDis.Sky, 10853, 100, 1, 5, 20, EEffectLightTracer.Curve, me.nowPos.x + 35, me.nowPos.y - 200, 30, true, 0, target.nowPos.x + 35, target.nowPos.y + 100, 0.66);
            end
            self.step = 3;
        end
    elseif self.step == 3 then
        if FightField.attack[self.humIdx].lights[1].isArrive then
            for i = 0, self.emyNum-1 do
                local n = self.emyNum;
                target = FightField.fightHum[self.emyIdxAy[i]];
                if me.party_Kind == EFightParty.Left then
                    FightField.attack[self.humIdx]:SetLightWithOrder(1 + i, EEffectLightDis.Sky, 10265, 100, 1, 11, 11, EEffectLightTracer.Stand, target.nowPos.x,  target.nowPos.y - 45, 30, true, 70);
                    FightField.attack[self.humIdx].lights[1+i]:SetColor(self.effectColor);
                    FightField.attack[self.humIdx].lights[1+i]:SetColorMix(true);
                    FightField.attack[self.humIdx].lights[1+i]:SetSize(100, 138);
                    FightField.attack[self.humIdx]:SetLightWithOrder(1 + n + i, EEffectLightDis.Body, 10327, 30, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x + 35, target.nowPos.y + 50, 20, false, 0);
                    FightField.attack[self.humIdx]:SetLightWithOrder(1+ (2*n) + i, EEffectLightDis.Body, 10016, 30, 1, 15, 15, EEffectLightTracer.StandAni, target.nowPos.x + 35, target.nowPos.y + 100, 25, false, 0);
                else
                    FightField.attack[self.humIdx]:SetLightWithOrder(1 + i, EEffectLightDis.Sky, 10265, 100, 1, 11, 11, EEffectLightTracer.Stand, target.nowPos.x,  target.nowPos.y - 45, 30, true, 70);
                    FightField.attack[self.humIdx].lights[1+i]:SetColor(self.effectColor);
                    FightField.attack[self.humIdx].lights[1+i]:SetColorMix(true);
                    FightField.attack[self.humIdx].lights[1+i]:SetSize(100, 138);
                    FightField.attack[self.humIdx]:SetLightWithOrder(1 + n + i, EEffectLightDis.Body, 10327, 30, 1, 7, 7, EEffectLightTracer.StandAni, target.nowPos.x - 30, target.nowPos.y + 30, 20, false, 0);
                    FightField.attack[self.humIdx]:SetLightWithOrder(1+ (2*n) + i, EEffectLightDis.Body, 10016, 30, 1, 15, 15, EEffectLightTracer.StandAni, target.nowPos.x - 35, target.nowPos.y + 50, 25, false, 0);
                end
            end
            self.interval = 1;
            self.step = 4;
        end
    elseif self.step == 4 then
        if self:CheckInterval() then
            self.isLightEnd = true;
            self.step = 5;
        end
    end
end