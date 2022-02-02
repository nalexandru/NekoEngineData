-- NeSystem ScriptFlyController grp_logic 0
-- Transform
-- Camera
-- ScriptFlyController
-- End

function Execute(xform, cam, ctrl)
	if In.UnmappedButtonDown(65, 0) then
		E.Shutdown();
	end

	if In.UnmappedButtonDown(130, 0) then
		In.EnableMouseAxis(true);
	elseif In.UnmappedButtonUp(130, 0) then
		In.EnableMouseAxis(false);
	end

	local dt = E.DeltaTime();
	local mvmt = ScriptFlyController_GetMovementSpeed(ctrl) * dt;
	local vRot = ScriptFlyController_GetVRotationSpeed(ctrl) * dt;
	local hRot = ScriptFlyController_GetHRotationSpeed(ctrl) * dt;

	local cx, cy, cz = Camera.GetRotation(cam);
	cx = cx + In.Axis(ScriptFlyController_GetRotateVertical(ctrl)) * vRot;
	cy = cy + In.Axis(ScriptFlyController_GetRotateHorizontal(ctrl)) * hRot;
	Camera.SetRotation(cam, cx, cy, cz);

	Xform.Rotate(xform, In.Axis(ScriptFlyController_GetRotateHorizontal(ctrl)) * hRot, 0.0, -1.0, 0.0);
	Xform.UpdateOrientation(xform);

	local rx, ry, rz = Xform.GetRight(xform);
	Xform.Rotate(xform, In.Axis(ScriptFlyController_GetRotateVertical(ctrl)) * vRot, rx, ry, rz);
	Xform.UpdateOrientation(xform);

	Xform.MoveForward(xform, In.Axis(ScriptFlyController_GetMoveForward(ctrl)) * mvmt);
	Xform.MoveRight(xform, In.Axis(ScriptFlyController_GetMoveRight(ctrl)) * mvmt);
	Xform.MoveUp(xform, In.Axis(ScriptFlyController_GetMoveUp(ctrl)) * mvmt);
end
