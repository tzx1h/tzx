local function ByAntikick()
	local success, err = pcall(function()
		local f = game:GetService("Players").LocalPlayer.Kick
	end)
	if not success and err:find("Expected ':' not '.' calling member function Kick") then
		return true
	end
	return false
end
while task.wait() do
	pcall(function()
		if ByAntikick() then
			local old_getnc = hookfunction(getnamecallmethod, function()
				return "FakeKick"
			end)
			while task.wait() do
				pcall(function()
					game:GetService("Players").LocalPlayer:Kick(reason)
					local CoreGui = (cloneref or (function(a)return a end))(game:GetService("CoreGui"))
					CoreGui.RobloxPromptGui.promptOverlay.ErrorPrompt.TitleFrame.ErrorTitle.Text = "Auth Error"
					CoreGui.RobloxPromptGui.promptOverlay.ErrorPrompt.MessageArea.ErrorFrame.ErrorMessage.Text = reason
				end)
			end
			hookfunction(getnamecallmethod, old_getnc)
		end
	end)
end
