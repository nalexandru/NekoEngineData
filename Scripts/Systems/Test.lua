require "NeEngine"
require "NeUI"
require "TestComponent"

NeSystem =
{
	name = "TestSystem",
	components = { "UIContext", "TestComponent" },
	group = SystemGroup.PostLogic
}

function Execute(uiContext, testComponent, userData)
	local y = Engine.ScreenHeight() - 60.0;

	local val = testComponent.frameCounter;

	if testComponent.display == true then
		uiContext:Text("Frame " .. val, 0.0, y, 20.0, nil);
	end

	testComponent.frameCounter = val + 1);
end
