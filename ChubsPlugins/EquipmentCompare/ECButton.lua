-- import "Turbine.Gameplay";
-- import "Turbine.UI";
-- import "Turbine.UI.Lotro";
-- import "ChubsPlugins.EquipmentCompare.ECWindow"; -- Import ECWindow

-- ECButton = class(Turbine.UI.Window);

-- function ECButton:Constructor()
--     Turbine.UI.Window.Constructor(self);

--     -- Set defaults
--     self:SetSize(32, 32);
--     self:SetBackground("ChubsPlugins/EquipmentCompare/Resources/ClearWoundsSmall.jpg");
--     self:SetBackColorBlendMode(Turbine.UI.BlendMode.Multiply);
--     self:SetBackColor(Turbine.UI.Color(0, 0.5, 0.5, 0.5));
--     self:SetZOrder(1);

--     -- Set button position
--     local screenWidth = Turbine.UI.Display.GetWidth();
--     local screenHeight = Turbine.UI.Display.GetHeight();
--     local buttonPositionX = Settings.buttonRelativeX * screenWidth;
--     local buttonPositionY = Settings.buttonRelativeY * screenHeight;
--     if buttonPositionX + self:GetWidth() > screenWidth then
--         buttonPositionX = screenWidth - self:GetWidth();
--     end
--     if buttonPositionY + self:GetHeight() > screenHeight then
--         buttonPositionY = screenHeight - self:GetHeight();
--     end
--     self:SetPosition(buttonPositionX, buttonPositionY);
--     self:SetVisible(Settings.showButton == 1);
--     self:SetOpacity(Settings.toggleMinOpacity);

--     -- Variables for tracking movement
--     local isMoving = false;
--     local hasMoved = false;
--     local lastMouseX, lastMouseY = 0, 0;

--     -- Mouse handlers for moving the button
--     self.MouseDown = function(sender, args)
--         if (args.Button == Turbine.UI.MouseButton.Left) then
--             -- Start moving the button
--             isMoving = true;
--             lastMouseX = Turbine.UI.Display.GetMouseX(); -- Get absolute mouse position
--             lastMouseY = Turbine.UI.Display.GetMouseY(); -- Get absolute mouse position
--             hasMoved = false;  -- Reset hasMoved when starting to drag
--         end
--     end

--     self.MouseMove = function(sender, args)
--         if isMoving then
--             -- Get the current mouse position
--             local currentMouseX = Turbine.UI.Display.GetMouseX();
--             local currentMouseY = Turbine.UI.Display.GetMouseY();

--             -- Calculate the delta between the previous and current mouse positions
--             local deltaX = currentMouseX - lastMouseX;
--             local deltaY = currentMouseY - lastMouseY;

--             -- Get the current position of the button
--             local currentX, currentY = self:GetPosition();

--             -- Set the new position of the button, adjusting by the delta
--             self:SetPosition(currentX + deltaX, currentY + deltaY);
--             lastMouseX = currentMouseX;  -- Update last mouse position
--             lastMouseY = currentMouseY;  -- Update last mouse position
--             hasMoved = true;  -- Set hasMoved to true
--         end
--     end

--     self.MouseUp = function(sender, args)
--         if (args.Button == Turbine.UI.MouseButton.Left) then
--             -- Stop moving the button
--             isMoving = false;

--             -- Save the new relative position in settings
--             local screenWidth = Turbine.UI.Display.GetWidth();
--             local screenHeight = Turbine.UI.Display.GetHeight();
--             local currentX, currentY = self:GetPosition();

--             Settings.buttonRelativeX = currentX / screenWidth;
--             Settings.buttonRelativeY = currentY / screenHeight;

--             -- Open the window only if the button has not been moved
--             if not hasMoved then
--                 if not self.window then
--                     self.window = ECWindow(); -- Create the window
--                 end
--                 -- Toggle window visibility
--                 self.window:SetVisible(not self.window:IsVisible());
--             end
--         end
--     end

--     -- Change opacity on hover
--     self.MouseEnter = function(sender, args)
--         self:SetOpacity(Settings.toggleMaxOpacity);
--     end

--     self.MouseLeave = function(sender, args)
--         self:SetOpacity(Settings.toggleMinOpacity);
--     end
-- end

-- _G.ECButton = ECButton; -- Make ECWindow global