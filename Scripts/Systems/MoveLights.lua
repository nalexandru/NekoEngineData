require "NeEngine"
require "MovingLight"

NeSystem = { components = { "Transform", "MovingLight" } }

function Execute(xform, ml, userData)
	local pos = xform:Position();

	if pos:y() > ml.maxHeight or pos:y() < 0.0 then
		ml.direction = -1.0 * ml.direction;
	end

	xform:MoveUp(ml.speed * ml.direction * Engine.DeltaTime());
end
