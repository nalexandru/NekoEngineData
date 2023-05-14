require "NeInput"

NeComponent = { name = "ScriptFlyController" };

function Init(ctrl, args)
	ctrl.moveSpeed = 100.0;
	ctrl.hRotSpeed = 250.0;
	ctrl.vRotSpeed = 100.0;

	for k, v in pairs(args) do
		if k == "MovementSpeed" then
			ctrl.moveSpeed = tonumber(v);
		elseif k == "VerticalRotationSpeed" then
			ctrl.vRotSpeed = tonumber(v);
		elseif k == "HorizontalRotationSpeed" then
			ctrl.hRotSpeed = tonumber(v);
		end
	end

	ctrl.fwdMap = Input.CreateMap("forward");
	ctrl.rightMap = Input.CreateMap("lateral");
	ctrl.upMap = Input.CreateMap("vertical");
	ctrl.hRotMap = Input.CreateMap("rotlMap");
	ctrl.vRotMap = Input.CreateMap("rotvMap");

	return true;
end

function Term(ctrl)
end
