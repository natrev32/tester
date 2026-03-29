repeat task.wait() until game:IsLoaded()

print("Script Loaded")

local Library = loadstring(game:HttpGet("LINK_UI_LIBRARY"))()

local v31 = Library:CreateWindow({
    Title = "Brainrot Script"
})

local InstantInteractionToggle = v31:Toggle({
    Title = "Instant Interaction",
    Desc = "Mempercepat semua interaksi",
    
    Callback = function(state)
        if state then
            print("ON")

            for _, v in pairs(game:GetDescendants()) do
                if v:IsA("ProximityPrompt") then
                    v.HoldDuration = 0
                end
            end
        else
            print("OFF")
        end
    end
})
