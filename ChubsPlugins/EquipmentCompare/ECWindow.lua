import "Turbine";
import "Turbine.Gameplay";
import "Turbine.Gameplay.Attributes"
import "Turbine.UI";
import "Turbine.UI.Lotro";
import "ChubsPlugins.EquipmentCompare.EquipmentList";

ECWindow = class(Turbine.UI.Lotro.Window);

function ECWindow:Constructor()
    Turbine.UI.Lotro.Window.Constructor(self);

    -- Set up the window properties
    self:SetText("Equipped Items");
    self:SetSize(800, 400);
    self:SetPosition(200, 200);
    self:SetVisible(false);

    -- Scrollbar and ListBox to hold equipped items
    self.scrollBar = Turbine.UI.Lotro.ScrollBar();
    self.scrollBar:SetParent(self);
    self.scrollBar:SetPosition(200, 40);
    self.scrollBar:SetSize(10, 350);
    self.scrollBar:SetOrientation(Turbine.UI.Orientation.Vertical);

    self.listBox = Turbine.UI.ListBox();
    self.listBox:SetParent(self);
    self.listBox:SetPosition(10, 40);
    self.listBox:SetSize(200, 350);
    self.listBox:SetVerticalScrollBar(self.scrollBar);

    -- Load equipped items
    LoadEquippedItems(self.listBox);
end

_G.ECWindow = ECWindow; -- Make ECWindow global