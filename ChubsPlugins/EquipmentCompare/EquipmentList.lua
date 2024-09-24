LoadEquippedItems = function(listBox, compareSlots)
    local player = Turbine.Gameplay.LocalPlayer.GetInstance();
    local equipment = player:GetEquipment();

    local slotNames = {
        [1] = "Head", [2] = "Chest", [3] = "Legs", [4] = "Gloves",
        [6] = "Boots", [5] = "Shoulder", [7] = "Back", [8] = "Bracelet 1",
        [9] = "Bracelet 2", [10] = "Necklace", [11] = "Ring 1", [12] = "Ring 2",
        [13] = "Earring 1", [14] = "Earring 2", [15] = "Pocket", [16] = "Primary Weapon",
        [17] = "Secondary Weapon", [18] = "Ranged Weapon", [19] = "Crafting Tool", [20] = "Class"
    };

    for i = 1, 20 do
        local item = equipment:GetItem(i);
        local itemContainer = Turbine.UI.Control();
        itemContainer:SetSize(250, 38);

        local imageBackground = Turbine.UI.Control();
        imageBackground:SetParent(itemContainer);
        imageBackground:SetSize(38, 38);
        imageBackground:SetBackColor(Turbine.UI.Color(0.5, 0.5, 0.5));
        imageBackground:SetPosition(0, 0);

        if item then    
            -- (Icon and images for underlay, shadow, quality omitted for brevity)

            local itemIcon = Turbine.UI.Control();
            itemIcon:SetParent(imageBackground);
            itemIcon:SetSize(32, 32);
            itemIcon:SetPosition(3, 3);
            itemIcon:SetBackground(item:GetIconImageID());

            local itemNameLabel = Turbine.UI.Label();
            itemNameLabel:SetParent(itemContainer);
            itemNameLabel:SetSize(210, itemContainer:GetHeight());
            itemNameLabel:SetPosition(42, 0);
            itemNameLabel:SetText(slotNames[i] .. ":\n" .. item:GetName());

            -- Handle click event
            itemContainer.MouseClick = function(sender, args)
                if args.Button == Turbine.UI.MouseButton.Left then
                    if item then
                        Turbine.Shell.WriteLine("Item clicked: " .. item:GetName());
                        -- Update first slot in compareSlots
                        compareSlots:UpdateSlot1(item);  -- Ensure this uses the correct instance
                    else
                        Turbine.Shell.WriteLine("No item equipped.");
                    end
                end
            end
        else
            -- Handle case when no item is equipped
            local emptySlotLabel = Turbine.UI.Label();
            emptySlotLabel:SetParent(itemContainer);
            emptySlotLabel:SetSize(230, 38);
            emptySlotLabel:SetPosition(42, 0);
            emptySlotLabel:SetText(slotNames[i] .. ":\nNothing equipped");
            emptySlotLabel:SetForeColor(Turbine.UI.Color.Red);
        end

        -- Add Container to the listbox
        listBox:AddItem(itemContainer);

        -- Add spacer
        local spacer = Turbine.UI.Control();
        spacer:SetSize(1, 5);
        listBox:AddItem(spacer);
    end
end