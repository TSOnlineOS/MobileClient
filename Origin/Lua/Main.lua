--主入口函数。从这里开始lua逻辑
function Main()
  local breakInfoFun, xpcallFun = require("LuaDebug")("localhost", 7003);
end

--场景切换通知
function OnLevelWasLoaded(level)
  collectgarbage("collect")
end

function OnApplicationQuit()
end