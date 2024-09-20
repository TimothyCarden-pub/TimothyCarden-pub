-- LoadEquippedItems = function(listBox)
--     local player = Turbine.Gameplay.LocalPlayer.GetInstance();
--     local equipment = player:GetEquipment();

--     local slotNames = {
--         [1] = "Head",
--         [2] = "Chest",
--         [3] = "Legs",
--         [4] = "Gloves",
--         [6] = "Boots",
--         [5] = "Shoulder",
--         [7] = "Back",
--         [8] = "Bracelet 1",
--         [9] = "Bracelet 2",
--         [10] = "Necklace",
--         [11] = "Ring 1",
--         [12] = "Ring 2",
--         [13] = "Earring 1",
--         [14] = "Earring 2",
--         [15] = "Pocket",
--         [16] = "Primary Weapon",
--         [17] = "Secondary Weapon",
--         [18] = "Ranged Weapon",
--         [19] = "Crafting Tool",
--         [20] = "Class",
--     }

--     -- Iterate through equipment slots
--     for i = 1, 20 do
--         local item = equipment:GetItem(i); -- Get item in the current slot
--         local itemContainer = Turbine.UI.Control(); -- Container for icon and label
--         itemContainer:SetSize(270, 38); -- Adjust height to fit the icon size

--             -- Background for image
--             local imageBackground = Turbine.UI.Control();
--             imageBackground:SetParent(itemContainer);
--             imageBackground:SetSize(38, 38);
--             imageBackground:SetBackColor(Turbine.UI.Color(0.5, 0.5, 0.5));
--             imageBackground:SetPosition(0, 0);

--         if item then    
--             -- Underlay image
--             local underlay = Turbine.UI.Control();
--             underlay:SetParent(imageBackground);
--             underlay:SetSize(32, 32);
--             underlay:SetPosition(3, 3);
--             underlay:SetBackground(item:GetUnderlayImageID());
--             underlay:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend);

--             -- Shadow image (layered on top of underlay)
--             local shadow = Turbine.UI.Control();
--             shadow:SetParent(imageBackground);
--             shadow:SetSize(32, 32);
--             shadow:SetPosition(3, 3);
--             shadow:SetBackground(item:GetShadowImageID());
--             shadow:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend);

--             -- Quality image (layered on top of shadow)
--             local quality = Turbine.UI.Control();
--             quality:SetParent(imageBackground);
--             quality:SetSize(32, 32);
--             quality:SetPosition(3, 3);
--             quality:SetBackground(item:GetQualityImageID());
--             quality:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend);

--             -- Icon image (layered on top of quality)
--             local itemIcon = Turbine.UI.Control();
--             itemIcon:SetParent(imageBackground);
--             itemIcon:SetSize(32, 32);
--             itemIcon:SetPosition(3, 3);
--             itemIcon:SetBackground(item:GetIconImageID()); -- Set the item's icon image
--             itemIcon:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend);

--             -- Create label for the item name
--             local itemNameLabel = Turbine.UI.Label();
--             itemNameLabel:SetParent(itemContainer);
--             itemNameLabel:SetSize(230, itemContainer:GetHeight()); -- Set width to fit the name next to the icon
--             itemNameLabel:SetPosition(42, 0); -- Position to the right of the icon
--             itemNameLabel:SetText(slotNames[i] .. ":\n" .. item:GetName());
--             --itemNameLabel:SetText(item:GetName()); -- Set the item's name
--             itemNameLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
--             itemNameLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleLeft);
--         else
--             -- No item equipped show image and message
--             local imageBackground = Turbine.UI.Control();
--             imageBackground:SetParent(itemContainer);
--             imageBackground:SetSize(38, 38);
--             imageBackground:SetBackColor(Turbine.UI.Color(0.5, 0.5, 0.5)); -- Light grey background
--             imageBackground:SetPosition(0, 0);

--             -- -- Use the default image for unequipped slots
--             -- local unequippedIcon = Turbine.UI.Control();
--             -- unequippedIcon:SetParent(imageBackground);
--             -- unequippedIcon:SetSize(32, 32);
--             -- unequippedIcon:SetPosition(3, 3); -- Centered within the grey background
--             -- unequippedIcon:SetBackground(item:GetIconImageID()); -- Set the unequipped icon image
--             -- unequippedIcon:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend);

--             -- Create the label for the unequipped slot
--             local emptySlotLabel = Turbine.UI.Label();
--             emptySlotLabel:SetParent(itemContainer);
--             emptySlotLabel:SetSize(230, 38);
--             emptySlotLabel:SetPosition(42, 0); -- Position to the right of the icon
--             emptySlotLabel:SetText(slotNames[i] .. ":\nNothing equipped");
--             -- emptySlotLabel:SetText("Nothing equipped");
--             emptySlotLabel:SetForeColor(Turbine.UI.Color.Red);
--             emptySlotLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
--             emptySlotLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleLeft);
--         end

--         -- Add Container to the listbox
--         listBox:AddItem(itemContainer);

--         -- Add spacer
--         local spacer = Turbine.UI.Control();
--         spacer:SetSize(1, 5);
--         listBox:AddItem(spacer);
--     end
-- end