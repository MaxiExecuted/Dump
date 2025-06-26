-- arguably very inefficient

-- to get Player's role do: Player:GetAttribute("Role")

-- P.S. please fork this and make it better, i dont really know anymore, i am going insane

--	//Variables//
local Players = game:GetService("Players")

local RoleNames = {"Role1", "Role2"} -- Replace with your own, e.g. {"Prosecution", "Defense"}

-- //Player.Added//
Players.PlayerAdded:Connect(function(Player)
	if #Players:GetPlayers() >= 2 then
		local Role1, Role2
		Role1 = Players:GetPlayers()[math.random(1,#Players:GetPlayers())]
		Role1:SetAttribute("Role", RoleNames[1])
		Role2 = Players:GetPlayers()[math.random(1,#Players:GetPlayers())]
		Role2:SetAttribute("Role", RoleNames[2])		
		
		print(Role1)
		print(Role2)
		
		while Role1 == Role2 do
			Role1:SetAttribute("Role", nil)
			Role2:SetAttribute("Role", nil)
			Role1 = Players:GetPlayers()[math.random(1,#Players:GetPlayers())]
			Role1:SetAttribute("Role", RolesNames[1])
			Role2 = Players:GetPlayers()[math.random(1,#Players:GetPlayers())]
			Role2:SetAttribute("Role", RolesNames[2])	
			print(Role1)
			print(Role2)
		end
	end
end)

Players.PlayerRemoving:Connect(function(Player)
	if (Player:GetAttribute("Role") == RolesNames[1] or Player:GetAttribute("Role") == "Role") then
		print(Player.. " ("..Player:GetAttribute("Role")..") has left the game!") -- E.G. "MaxiExecuted (Role1) has left the game!"
		if #Players:GetPlayers() >= 2 then
			local Role1, Role2
			Role1 = Players:GetPlayers()[math.random(1,#Players:GetPlayers())]
			Role1:SetAttribute("Role", RolesNames[1])
			Role2 = Players:GetPlayers()[math.random(1,#Players:GetPlayers())]
			Role2:SetAttribute("Role", RolesNames[2])		
			print(Role1)
			print(Role2)
			while Role1 == Role2 do
				Role1:SetAttribute("Role", nil)
				Role2:SetAttribute("Role", nil)
				Role1 = Players:GetPlayers()[math.random(1,#Players:GetPlayers())]
				Role1:SetAttribute("Role", RolesNames[1])
				Role2 = Players:GetPlayers()[math.random(1,#Players:GetPlayers())]
				Role2:SetAttribute("Role", RolesNames[2])	
				print(Role1)
				print(Role2)
			end
		end
	end
end)
