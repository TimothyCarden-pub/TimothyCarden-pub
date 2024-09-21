-- import "Turbine";
-- import "Turbine.UI";
-- import "Turbine.UI.Lotro";

-- -- Create the window
-- local window = Turbine.UI.Lotro.Window();
-- window:SetSize(400, 400);
-- window:SetText("Equipment Comparison");

-- -- Left equipment slot for the first item
-- local leftItemSlot = Turbine.UI.Control();
-- leftItemSlot:SetParent(window);
-- leftItemSlot:SetSize(350, 300);
-- leftItemSlot:SetPosition(25, 50);
-- leftItemSlot:SetBackColor(Turbine.UI.Color(0.5, 0.5, 0.5)); -- Set background color to grey

-- -- Label to display item names
-- local leftItemLabel = Turbine.UI.Label();
-- leftItemLabel:SetParent(window);
-- leftItemLabel:SetPosition(25, 360);
-- leftItemLabel:SetSize(350, 20);
-- leftItemLabel:SetText("Drag an item here");
-- leftItemLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);

-- -- Image control for the item icon
-- local itemImage = Turbine.UI.Control();
-- itemImage:SetParent(leftItemSlot);
-- itemImage:SetSize(64, 64);  -- Set size for the item icon
-- itemImage:SetPosition(143, 118);  -- Center the image in the slot
-- itemImage:SetVisible(false);  -- Initially not visible

-- -- Function to handle item drop
-- local function HandleItemDrop()
--     leftItemSlot.DragDrop = function(sender, args)
--         local item = args.DragData; -- Get the dragged item
--         Turbine.Shell.WriteLine("Item dropped!"); -- Log item drop event

--         if item and item:GetType() then
--             leftItemLabel:SetText("Item: " .. item:GetName());
--             leftItemSlot:SetBackColor(Turbine.UI.Color(0.0, 1.0, 0.0)); -- Change color to green on drop
--             itemImage:SetVisible(true);  -- Show the item image
--             itemImage:SetBackground("itemImagePath");  -- Set the background to the item image path
--             Turbine.Shell.WriteLine("Item set in slot: " .. item:GetName());
--         else
--             leftItemLabel:SetText("Invalid item");
--             itemImage:SetVisible(false);  -- Hide the image if invalid
--             Turbine.Shell.WriteLine("DragDrop: No valid item dragged."); -- Log for debugging
--         end
--     end

--     -- Handle mouse enter event
--     leftItemSlot.MouseEnter = function(sender, args)
--         leftItemSlot:SetBackColor(Turbine.UI.Color(0.7, 0.7, 0.7)); -- Change color on hover
--         Turbine.Shell.WriteLine("Mouse entered slot.");
--     end

--     -- Handle mouse leave event
--     leftItemSlot.MouseLeave = function(sender, args)
--         leftItemSlot:SetBackColor(Turbine.UI.Color(0.5, 0.5, 0.5)); -- Reset to grey
--         Turbine.Shell.WriteLine("Mouse left slot.");
--     end
-- end

-- -- Set up drag-and-drop for the left item slot
-- HandleItemDrop();  -- Left side

-- -- Listen for global drag events
-- Turbine.UI.Lotro.ItemDragDropEvent.Event = function(sender, args)
--     if args.DragData and IsMouseOver(leftItemSlot) then
--         -- Item is being dragged over the left item slot
--         leftItemSlot:SetBackColor(Turbine.UI.Color(0.2, 0.8, 0.2)); -- Change color to indicate drop target
--     else
--         leftItemSlot:SetBackColor(Turbine.UI.Color(0.5, 0.5, 0.5)); -- Reset color
--     end
-- end

-- -- Reset color when the drag operation is finished
-- Turbine.UI.Lotro.ItemDragDropEndEvent.Event = function(sender, args)
--     leftItemSlot:SetBackColor(Turbine.UI.Color(0.5, 0.5, 0.5)); -- Reset color when drag ends
-- end

-- -- Function to check if the mouse is over the item slot
-- function IsMouseOver(control)
--     local mousePos = Turbine.UI.Mouse:GetPosition(); -- Get current mouse position
--     local x, y = control:GetPosition();
--     return (mousePos.X >= x and mousePos.X <= (x + control:GetWidth())) and
--            (mousePos.Y >= y and mousePos.Y <= (y + control:GetHeight()));
-- end

-- -- Show the window
-- window:Show();
