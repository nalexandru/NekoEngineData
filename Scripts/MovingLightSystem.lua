-- NeSystem MovingLightSystem grp_logic 0
-- Transform
-- Light
-- MovingLight
-- End

function Execute(xform, light, ml, userData)
	local maxWidth <const> = 1200.0;
	local maxHeight <const> = 1200.0;
	local maxDepth <const> = 500.0;
	
	local x, y, z = Xform.GetPosition(xform);

	if x == 0.0 then
		local f = (((Sys.Rand() % 100) + .0) / 100.0) * 2.0 - 1.0;
		x = f * maxWidth;
--		x = f * MovingLight_GetMaxWidth(ml);

		f = ((Sys.Rand() % 100) + .0) / 100.0;
		y = f * maxHeight;
--		y = f * MovingLight_GetMaxHeight(ml);

		f = (((Sys.Rand() % 100) + .0) / 100.0) * 2.0 - 1.0;
		z = f * maxDepth;
--		z = f * MovingLight_GetMaxDepth(ml);

		Xform.SetPosition(xform, x, y, z);

		local r = ((Sys.Rand() % 100) + .0) / 100.0;
		local g = ((Sys.Rand() % 100) + .0) / 100.0;
		local b = ((Sys.Rand() % 100) + .0) / 100.0;

		Light.SetColor(light, r, g, b);

		--if y > MovingLight_GetMaxHeight(ml) / 2.0 then
		if y > maxHeight / 2.0 then
			MovingLight_SetDirection(ml, 1.0);
		else
			MovingLight_SetDirection(ml, -1.0);
		end
	end

	--if y > MovingLight_GetMaxHeight(ml) or y < MovingLight_GetMinHeight(ml) then
	if y > maxHeight or y < 0.0 then
		MovingLight_SetDirection(ml, -1.0 * MovingLight_GetDirection(ml));
	end

	Xform.MoveUp(xform, 100 * MovingLight_GetDirection(ml) * E.DeltaTime());
end
