require 'NeEngine'
require 'NeUI'
require 'FrameStats'

NeSystem = { components = { "FrameStats", "UIContext" }, group = SystemGroup.PreRender }

function Execute(fs, ui, args)
	fs.frames = fs.frames + 1;

	local delta = Engine.Time() - fs.time;
	if delta > 1.0 then
		local ft = (delta / tonumber(fs.frames)) * 1000

		fs.fps = "FPS: " .. fs.frames
		fs.ft = string.format("Frame Time: %.2f ms", ft)

		fs.time = fs.time + delta
		fs.frames = 0
	end

	ui:Text(fs.fps, 0.0, 0.0, 20.0)
	ui:Text(fs.ft, 0.0, 20.0, 20.0)
	ui:Text("Time: " .. Engine.Time(), 0.0, 40.0, 20.0)
end
