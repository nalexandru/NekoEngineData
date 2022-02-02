-- NeSystem TestSystem grp_post_logic 0
-- UIContext
-- TestComponent
-- End

function Execute(uiContext, testComponent, userData)
	local y = E.ScreenHeight() - 60.0;

	local val = TestComponent_GetFrameCounter(testComponent);

	if TestComponent_GetDisplay(testComponent) == true then
		UI.DrawText(uiContext, "Frame " .. val, 0.0, y, 20.0, nil);
	end

	TestComponent_SetFrameCounter(testComponent, val + 1);
end
