-- NeComponent TestComponent 1
-- int32 FrameCounter
-- bool Display
-- End

function Init(testComponent, args)
	TestComponent_SetFrameCounter(testComponent, 0);
	TestComponent_SetDisplay(testComponent, true);

	return true;
end

function Term(testComponent)
end
