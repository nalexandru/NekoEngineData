require "NeEngine"
require "NeSystem"

NeComponent = { name = "MovingLight" };

function Init(ml, args)
	local speed = 0.0;
	local maxWidth = 0.0;
	local maxHeight = 0.0;
	local maxDepth = 0.0;

	for k, v in pairs(args) do
		if k == "Speed" then
			speed = tonumber(v);
		elseif k == "MaxWidth" then
			maxWidth = tonumber(v);
		elseif k == "MaxHeight" then
			maxHeight = tonumber(v);
		elseif k == "MaxDepth" then
			maxDepth = tonumber(v);
		end
	end

	local entity = ml.owner;
	--local xform = E.GetComponent(entity, "Transform");
	--local light = E.GetComponent(entity, "Light");

	local xform = entity:Component("Transform");
	local light = entity:Component("Light");

	if xform == nil or light == nil then
		System.LogEntry("MovingLight", LOG_CRITICAL, "Entity does not have Transform and Light components");
		return false;
	end

	local y = (((System.Rand() % 100) + .0) / 100.0) * maxHeight;
	xform:Position(
		((((System.Rand() % 100) + .0) / 100.0) * 2.0 - 1.0) * maxWidth,
		y,
		((((System.Rand() % 100) + .0) / 100.0) * 2.0 - 1.0) * maxDepth
	);

	light:Color(
		((System.Rand() % 100) + .0) / 100.0,
		((System.Rand() % 100) + .0) / 100.0,
		((System.Rand() % 100) + .0) / 100.0
	);

	if y > maxHeight / 2.0 then
		ml.direction = 1.0;
	else
		ml.direction = -1.0;
	end

	ml.maxHeight = maxHeight;
	ml.speed = speed;

	return true;
end

function Term(ml)
end
