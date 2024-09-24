import "Turbine";
import "Turbine.UI";
import "Turbine.UI.Lotro";

CompareSlots = class(Turbine.UI.Control);

function CompareSlots:Constructor()
    Turbine.UI.Control.Constructor(self);

    -- Container for the two slots
    self:SetSize(200, 44);  -- Adjust size to fit both slot boxes and space
    self:SetPosition(325, 50);  -- Position the container in the upper middle (adjust as needed)

    local slotWidth = 44;
    local spacing = 75;  -- Approximate 1-inch space (can be adjusted)

    -- First slot box (left)
    self.slot1 = Turbine.UI.Control();
    self.slot1:SetParent(self);
    self.slot1:SetSize(slotWidth, slotWidth);
    self.slot1:SetBackColor(Turbine.UI.Color(0.5, 0.5, 0.5));  -- Light grey background
    self.slot1:SetPosition(0, 0);  -- Left side

    -- Second slot box (right)
    self.slot2 = Turbine.UI.Control();
    self.slot2:SetParent(self);
    self.slot2:SetSize(slotWidth, slotWidth);
    self.slot2:SetBackColor(Turbine.UI.Color(0.5, 0.5, 0.5));  -- Light grey background
    self.slot2:SetPosition(slotWidth + spacing, 0);  -- Right side with spacing

    -- Function to update the first slot
    self.UpdateSlot1 = function(item)
        if item then
            self.slot1:SetBackground(item:GetIconImageID());
            -- Optionally, add more logic to display item stats, name, etc.
        else
            -- Reset to empty state if no item
            self.slot1:SetBackColor(Turbine.UI.Color(0.5, 0.5, 0.5));  -- Light grey background
            self.slot1:SetBackground(nil);  -- Clear the icon
        end
    end
end
