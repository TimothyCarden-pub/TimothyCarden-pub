import "ChubsPlugins.EquipmentCompare.src.settings";
import "ChubsPlugins.EquipmentCompare.ECButton"; -- Import the ECButton class from the other file
import "Turbine";
import "Turbine.Gameplay";
import "Turbine.UI";
import "Turbine.UI.Lotro";

function DebugPrint(text) Turbine.Shell.WriteLine("<rgb=#OOFFFF>DEBUG:</rgb>" ..text);
end

-- Create and display the ECButton
Button = ECButton();
Button:SetVisible(true);
