local InstantInteractionToggle = v31:Toggle({
    Title = "Instant Interaction",
    Desc = "Mempercepat semua interaksi (brainrot / prompt)",
    
    Callback = function(state)
        if state then
            -- Aktif
            print("Instant Interaction ON")

            -- Contoh logic (edit sesuai game)
            for _, v in pairs(game:GetDescendants()) do
                if v:IsA("ProximityPrompt") then
                    v.HoldDuration = 0
                end
            end

        else
            -- Nonaktif
            print("Instant Interaction OFF")
        end
    end
})
