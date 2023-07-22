FindWay = {};
FindWay.__index = FindWay;

function FindWay.Start(startPosition, targetPosition, isMoveStraight, isMoveCurrentView, isMoveLine, roleController)
  local result = {};

  local startBlockX, startBlockY = MapManager.GetBlock(startPosition);

  local tempX = targetPosition.x - MapManager.centerLeft;
  local tempY = targetPosition.y - MapManager.centerTop;

  if tempX < 0 then tempX = 0 end
  if tempY < 0 then tempY = 0 end

  local targetBlockX = math.ceil(tempX * MapManager.BLOCK_CONVERT);
  local targetBlockY = math.ceil(tempY * MapManager.BLOCK_CONVERT);

  local maxBlockX, minBlockX, maxBlockY, minBlockY;
  if isMoveCurrentView then
    local centerX = Scene.sceneCamera.transform.localPosition.x;
    local centerY = -Scene.sceneCamera.transform.localPosition.y;
    maxBlockX = math.ceil( math.abs (centerX + Scene.currentSceneHalfWidth) * MapManager.BLOCK_CONVERT );--右
    minBlockX = math.ceil( math.abs (centerX - Scene.currentSceneHalfWidth) * MapManager.BLOCK_CONVERT );--左
    maxBlockY = math.ceil( math.abs (centerY + Scene.currentSceneHalfHeight) * MapManager.BLOCK_CONVERT );--下
    minBlockY = math.ceil( math.abs (centerY - Scene.currentSceneHalfHeight) * MapManager.BLOCK_CONVERT );--上
  end

  if isMoveStraight then
    --無視障礙直接走
    table.insert(result, Vector2.New(targetBlockX, targetBlockY));
    return result;
  end

  --站在原地  
  if MapManager.IsInSitu(startBlockX, startBlockY, targetBlockX, targetBlockY) then
    table.insert(result, Vector2.New(startBlockX, startBlockY));
    return result;  
  end

  --看障礙點走直線
  if isMoveLine then
    targetBlockX, targetBlockY = MapManager.GetNearObstacle(startBlockX, startBlockY, targetBlockX, targetBlockY);

    if roleController == Role.player and UIJoystick.IsDrag() then
      if MapManager.IsInSitu(startBlockX, startBlockY, targetBlockX, targetBlockY) then
        --用搖桿控制撞壁時，根據遙感控制取方向前進
        local deltaX, deltaY = UIJoystick.GetDirectDelta();

        if math.abs(deltaX) > math.abs(deltaY) then
          if deltaX >= 0 then
            --logError("右");
            if not MapManager.IsObstacle(targetBlockX + 1, targetBlockY) then
              table.insert(result, Vector2.New(targetBlockX + 1, targetBlockY)); 
              return result;     
            end
          else
            --logError("左");
            if not MapManager.IsObstacle(targetBlockX - 1, targetBlockY) then
              table.insert(result, Vector2.New(targetBlockX - 1, targetBlockY));  
              return result;   
            end
          end
        else
          if deltaY >= 0 then
            --logError("下");
            if not MapManager.IsObstacle(targetBlockX, targetBlockY + 1) then
              table.insert(result, Vector2.New(targetBlockX, targetBlockY + 1));  
              return result;       
            end
          else
            --logError("上");
            if not MapManager.IsObstacle(targetBlockX, targetBlockY - 1) then
              table.insert(result, Vector2.New(targetBlockX, targetBlockY - 1));     
              return result;    
            end
          end
        end

        if deltaX >= 0 then
          --logError("右");
          if not MapManager.IsObstacle(targetBlockX + 1, targetBlockY) then
            table.insert(result, Vector2.New(targetBlockX + 1, targetBlockY));
            return result;         
          end
        else
          --logError("左");
          if not MapManager.IsObstacle(targetBlockX - 1, targetBlockY) then
            table.insert(result, Vector2.New(targetBlockX - 1, targetBlockY));
            return result;         
          end
        end

        if deltaY >= 0 then
          --logError("下");
          if not MapManager.IsObstacle(targetBlockX, targetBlockY + 1) then
            table.insert(result, Vector2.New(targetBlockX, targetBlockY + 1));
            return result;         
          end
        else
          --logError("上");
          if not MapManager.IsObstacle(targetBlockX, targetBlockY - 1) then
            table.insert(result, Vector2.New(targetBlockX, targetBlockY - 1));
            return result;         
          end
        end
      end
    end

    table.insert(result, Vector2.New(targetBlockX, targetBlockY));

    return result; 
  end

  --目標是障礙點
  if MapManager.IsObstacle(targetBlockX, targetBlockY) then
    --尋找目標最近的無障礙點
    targetBlockX, targetBlockY = MapManager.GetEmptyBlock(startBlockX, startBlockY, targetBlockX, targetBlockY); 
    --站在原地  
    if MapManager.IsInSitu(startBlockX, startBlockY, targetBlockX, targetBlockY) then
      table.insert(result, Vector2.New(startBlockX, startBlockY));
      return result;
    end
  end

  if MapManager.IsLineWay(startBlockX, startBlockY, targetBlockX, targetBlockY) then
    --是直線、直接走
    table.insert(result, Vector2.New(targetBlockX, targetBlockY));
  elseif MapManager.IsObstacle(startBlockX, startBlockY) then
    --目前所在地塊是障礙點
    return nil;
  else
    result = FindWay.FindAStarPath(startBlockX, startBlockY, targetBlockX, targetBlockY, isMoveCurrentView, maxBlockX, minBlockX, maxBlockY, minBlockY);
    result = FindWay.GetBestPath(result);
  end

  return result;
end

function FindWay.FindAStarPath(startX, startY, targetX, targetY, isMoveCurrentView, maxBlockX, minBlockX, maxBlockY, minBlockY, checkPath)
  local openList = {};
  local closedList = {};

  local neighbours = nil;
  local neighbourNode = nil;
  local neighboursCount = 0;

  local starNode = Node.New(startX, startY);
  local goalNode = Node.New(targetX, targetY);
  local node = nil;

  starNode.G_Cost = 0;
  starNode.H_Cost = Node.HeuristicEstimateCost(starNode, goalNode);
  Node.PushNode(openList, starNode);
  while table.Count(openList) ~= 0 do
    node = Node.FirstNode(openList);
    Node.PushNode(closedList, node);
    Node.RemoveNode(openList, node);

    if node.x == goalNode.x and node.y == goalNode.y then
      break;
    end

    neighbours = FindWay.GetNeighbours(node, isMoveCurrentView, maxBlockX, minBlockX, maxBlockY, minBlockY);
    neighbourNode = nil;
    neighboursCount = table.Count(neighbours);

    if neighboursCount > 0 then
      for i = 1, neighboursCount do 
        neighbourNode = neighbours[i];
        if not Node.ContainsNode(closedList, neighbourNode) then
          local cost;
          local totalCost;
          local neighbourNodeEstCost;
          if not Node.ContainsNode(openList, neighbourNode) then
            cost = Node.HeuristicEstimateCost( node, neighbourNode );
            totalCost = node.G_Cost + cost;
            neighbourNodeEstCost = Node.HeuristicEstimateCost(neighbourNode, goalNode);
            neighbourNode.G_Cost = totalCost; 
            neighbourNode.parent = node;
            neighbourNode.H_Cost = neighbourNodeEstCost;
            Node.PushNode(openList, neighbourNode);
          else
            cost = Node.HeuristicEstimateCost(node, neighbourNode);
            totalCost = node.G_Cost + cost;
            if neighbourNode.G_Cost > totalCost then
              neighbourNode.G_Cost = totalCost;
              neighbourNode.parent = node;
            end
          end
        end
      end
    end
  end

  if checkPath then
    if node.x ~= goalNode.x or node.y ~= goalNode.y then
      return false;
    else
      return true;
    end
  else
    if node.x ~= goalNode.x or node.y ~= goalNode.y then
      --沒有路徑
      logWarn("No Path Find");
  
      return { Vector2.New(MapManager.GetNearObstacle(starNode.x, starNode.y, goalNode.x, goalNode.y)) };
    else
      return FindWay.CalculatePath(node);
    end
  end
end

function FindWay.GetNeighbours(node, isMoveCurrentView, maxBlockX, minBlockX, maxBlockY, minBlockY)
  local result = {};

  --上
  if isMoveCurrentView then
    if not MapManager.IsObstacle(node.x, node.y - 1) and 
      minBlockY < node.y - 1 and maxBlockY > node.y - 1 then
      table.insert( result, Node.New( node.x, node.y - 1 ) );
    end   
  else
    if not MapManager.IsObstacle(node.x, node.y - 1) then
      table.insert( result, Node.New( node.x, node.y - 1 ) );
    end
  end

  --下
  if isMoveCurrentView then
    if not MapManager.IsObstacle(node.x, node.y + 1) and 
      minBlockY < node.y + 1 and maxBlockY > node.y + 1 then
      table.insert( result, Node.New( node.x, node.y + 1 ) );
    end   
  else
    if not MapManager.IsObstacle(node.x, node.y + 1) then
      table.insert( result, Node.New( node.x, node.y + 1 ) );
    end
  end

  --左
  if isMoveCurrentView then
    if not MapManager.IsObstacle(node.x - 1, node.y) and 
      minBlockX < node.x - 1 and maxBlockX > node.x - 1 then
      table.insert( result, Node.New( node.x - 1, node.y ) );
    end   
  else
    if not MapManager.IsObstacle(node.x - 1, node.y) then
      table.insert( result, Node.New( node.x - 1, node.y ) );
    end
  end

  --右
  if isMoveCurrentView then
    if not MapManager.IsObstacle(node.x + 1, node.y) and 
      minBlockX < node.x + 1 and maxBlockX > node.x + 1 then
      table.insert( result, Node.New( node.x + 1, node.y ) );
    end   
  else
    if not MapManager.IsObstacle(node.x + 1, node.y) then
      table.insert( result, Node.New( node.x + 1, node.y ) );
    end
  end

  return result;  
end

function FindWay.CalculatePath(node)
  local result = {};
  local curNode = node;

  while curNode ~= nil do
    table.insert(result, Vector2.New(curNode.x, curNode.y));
    curNode = curNode.parent;
  end

  result = table.Reverse(result);

  return result;  
end

function FindWay.GetBestPath(curPath)
  local result = {};
  if #curPath < 2 then 
    table.insert(result, curPath[#curPath]); 
    return result;
  end 

  local index = 1;
  local length = #curPath;
  local isOver = false;

  table.insert(result, curPath[length]);

  while not isOver do
    for i = 0, length do
      if MapManager.IsLineWay(curPath[index + i].x, curPath[index + i].y, curPath[length].x, curPath[length].y) then
        length = index + i;

        if length == index then
          isOver = true;
        else
          table.insert(result, curPath[index + i]);
        end

        break;
      end
    end
  end

  result = table.Reverse(result);
  return result;
end

Node = {}
Node.__index = Node;

function Node.New(x, y)
  local self = {};
  setmetatable(self, Node);

  self.G_Cost = 0;
  self.H_Cost = 0;
  self.parent = nil;
  self.x = x;
  self.y = y;

  return self;
end

function Node.PushNode(listNode, node)
  if listNode[node.x] == nil then
    listNode[node.x] = {};
  end

  listNode[node.x][node.y] = node;
end

function Node.RemoveNode(listNode, node)
  if listNode[node.x] == nil or listNode[node.x][node.y] == nil then
    return
  end

  listNode[node.x][node.y] = nil;

  if table.Count(listNode[node.x]) <= 0 then
    listNode[node.x] = nil;
  end
end

function Node.FirstNode(listNode)
  local node = nil;

  for k, v in pairs(listNode) do
    for mk, jv in pairs(v) do
      if node == nil then
        node = jv;
      else
        if jv.G_Cost + jv.H_Cost < node.G_Cost + node.H_Cost then
          node = jv;
        end
      end
    end
  end

  return node;
end

function Node.ContainsNode(listNode, node)
  if listNode[node.x] == nil or listNode[node.x][node.y] == nil then
    return false;
  end

  return true;
end

function Node.HeuristicEstimateCost(curNode, goalNode)  
  return math.sqrt((goalNode.x - curNode.x) * (goalNode.x - curNode.x) + (goalNode.y - curNode.y) * (goalNode.y - curNode.y));
end