-- -- Tooltip.lua
-- import "Turbine";
-- import "Turbine.UI";
-- import "Turbine.UI.Lotro";

-- Tooltip = class(Turbine.UI.Window);

-- -- Constructor
-- function Tooltip:Constructor(item)
--     Turbine.UI.Window.Constructor(self);

--     -- Set the size and position of the tooltip window
--     self:SetSize(200, 150);
--     self:SetOpacity(1);
--     self:SetBackColor(Turbine.UI.Color(0.1, 0.1, 0.1)); -- Dark background

--     -- Item information
--     local itemName = Turbine.UI.Label();
--     itemName:SetParent(self);
--     itemName:SetSize(180, 20);
--     itemName:SetPosition(10, 10);
--     itemName:SetFont(Turbine.UI.Lotro.Font.Verdana16);
--     itemName:SetText(item:GetName());

--     local itemStats = Turbine.UI.Label();
--     itemStats:SetParent(self);
--     itemStats:SetSize(180, 120);
--     itemStats:SetPosition(10, 40);
--     itemStats:SetFont(Turbine.UI.Lotro.Font.Verdana14);
--     itemStats:SetText(self:FormatItemStats(item:GetStats()));
-- end

-- -- Function to format item stats for display
-- function Tooltip:FormatItemStats(stats)
--     local resultText = "";
--     for statName, statValue in pairs(stats) do
--         resultText = resultText .. string.format("%s: %d\n", statName, statValue);
--     end
--     return resultText;
-- end

-- -- Function to show the tooltip at the mouse position
-- function Tooltip:ShowTooltipAt(x, y)
--     self:SetPosition(x, y);
--     self:SetVisible(true);
-- end

-- -- Function to hide the tooltip
-- function Tooltip:HideTooltip()
--     self:SetVisible(false);
-- end
