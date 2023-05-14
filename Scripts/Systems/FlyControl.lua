require "NeInput"
require "NeEngine"
require "ScriptFlyController"

NeSystem = { name = "ScriptFlySystem", components = { "Transform", "Camera", "ScriptFlyController" } }

function Execute(xform, cam, ctrl)
	if Input.UnmappedButtonDown(KeyCode.Escape) then
		Engine.Shutdown();
	end

	if Input.UnmappedButtonDown(KeyCode.MiddleMouse) then
		Input.EnableMouseAxis(true);
	elseif Input.UnmappedButtonUp(KeyCode.MiddleMouse) then
		Input.EnableMouseAxis(false);
	end

	local dt = Engine.DeltaTime();
	local mvmt = ctrl.moveSpeed * dt;
	local vRot = Input.Axis(ctrl.vRotMap) * ctrl.vRotSpeed * dt;
	local hRot = Input.Axis(ctrl.hRotMap) * ctrl.hRotSpeed * dt;

	local rot = cam:Rotation();
	rot:x(rot:x() + vRot);
	rot:y(rot:y() + hRot);
	cam:Rotation(rot);

	xform:Rotate(hRot, 0.0, -1.0, 0.0);
	xform:Rotate(vRot, xform:Right());

	xform:MoveForward(Input.Axis(ctrl.fwdMap) * mvmt);
	xform:MoveRight(Input.Axis(ctrl.rightMap) * mvmt);
	xform:MoveUp(Input.Axis(ctrl.upMap) * mvmt);
end
