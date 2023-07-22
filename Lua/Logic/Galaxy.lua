Galaxy = {}
local this = Galaxy;

this.leaderboards = {};

function Galaxy.AddLeaderboard(serverId, kind, leaderboardInfo, updateOther)
  if this.leaderboards[serverId] == nil then
    this.leaderboards[serverId] = {};
  end

  if this.leaderboards[serverId][kind] == nil then
    this.leaderboards[serverId][kind] = {};
  end

  table.insert(this.leaderboards[serverId][kind], leaderboardInfo);

  if updateOther == false then return end

  table.sort(this.leaderboards[serverId][kind]);

  --RE_GalaxyRankForm
end