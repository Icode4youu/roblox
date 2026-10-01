-- Ang pangunahing script na tumatawag ng mga modules
-- Server Script — dapat kapatid ng "modules" folder sa ServerScriptService

local Players = game:GetService("Players")

local modules = script.Parent:WaitForChild("modules")
local Movement = require(modules:WaitForChild("movement"))
local UIHelper = require(modules:WaitForChild("ui_helper"))

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		task.wait(1)

		-- Halimbawa 1: gumawa ng welcome GUI para sa player
		local gui = UIHelper.createScreenGui(player, "WelcomeGui")
		local frame = UIHelper.createFrame(gui, { name = "WelcomeFrame" })
		UIHelper.createLabel(frame, { text = "Welcome, " .. player.Name .. "!" })

		-- Halimbawa 2: i-teleport ang character (uncomment para gamitin)
		-- Movement.teleport(character, Vector3.new(0, 10, 0))

		-- Halimbawa 3: pathfinding papunta sa isang posisyon
		-- Movement.walkTo(character, Vector3.new(50, 0, 50))
	end)
end)
