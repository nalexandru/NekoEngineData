-- NeComponent ScriptFlyController 1
-- float MovementSpeed
-- float HRotationSpeed
-- float VRotationSpeed
-- int32 MoveForward
-- int32 MoveRight
-- int32 MoveUp
-- int32 RotateHorizontal
-- int32 RotateVertical
-- End

function Init(flyController, args)
	ScriptFlyController_SetMovementSpeed(flyController, 100.0);
	ScriptFlyController_SetHRotationSpeed(flyController, 250.0);
	ScriptFlyController_SetVRotationSpeed(flyController, 100.0);

	ScriptFlyController_SetMoveForward(flyController, In.CreateMap("forward"));
	ScriptFlyController_SetMoveRight(flyController, In.CreateMap("lateral"));
	ScriptFlyController_SetMoveUp(flyController, In.CreateMap("vertical"));
	ScriptFlyController_SetRotateHorizontal(flyController, In.CreateMap("rotlMap"));
	ScriptFlyController_SetRotateVertical(flyController, In.CreateMap("rotvMap"));

	return true;
end

function Term(flyController)
end
