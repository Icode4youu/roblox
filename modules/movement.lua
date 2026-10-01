local PathfindingService = game:GetService("PathfindingService")

local Movement = {}

-- I-teleport ang character sa target position (Vector3 o CFrame)
function Movement.teleport(character, targetPosition)
	local rootPart = character:FindFirstChild("HumanoidRootPart")
	if not rootPart then
		warn("Walang HumanoidRootPart sa " .. character.Name)
		return false
	end

	if typeof(targetPosition) == "Vector3" then
		rootPart.CFrame = CFrame.new(targetPosition)
	elseif typeof(targetPosition) == "CFrame" then
		rootPart.CFrame = targetPosition
	else
		warn("Invalid targetPosition type")
		return false
	end
	return true
end

-- Maglakad papunta sa destination gamit ang PathfindingService
function Movement.walkTo(character, destination)
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	local rootPart = character:FindFirstChild("HumanoidRootPart")
	if not humanoid or not rootPart then
		warn("Kulang ang Humanoid o HumanoidRootPart")
		return false
	end

	local path = PathfindingService:CreatePath({
		AgentRadius = 2,
		AgentHeight = 5,
		AgentCanJump = true,
		AgentCanClimb = true,
	})

	local ok, err = pcall(function()
		path:ComputeAsync(rootPart.Position, destination)
	end)

	if not ok or path.Status ~= Enum.PathStatus.Success then
		warn("Path computation failed: " .. tostring(err or path.Status))
		return false
	end

	for _, waypoint in ipairs(path:GetWaypoints()) do
		if humanoid.Health <= 0 then
			return false
		end
		humanoid:MoveTo(waypoint.Position)
		if waypoint.Action == Enum.PathWaypointAction.Jump then
			humanoid.Jump = true
		end
		humanoid.MoveToFinished:Wait()
	end
	return true
end

return Movement
