require 'NeEngine'
require 'NeCairoUI'
require 'FrameStats'

NeSystem = { components = { "FrameStats", "CairoContext" }, group = SystemGroup.PreRender }

function Execute(fs, cairo, args)
	fs.frames = fs.frames + 1;

	local delta = Engine.Time() - fs.time;
	if delta > 1.0 then
		local ft = (delta / fs.frames) * 1000.0

		fs.fps = "FPS: " .. fs.frames
		fs.ft = string.format("Frame Time: %.2f ms", ft)

		fs.time = fs.time + delta
		fs.frames = 0
	end

	cairo:Source(1.0, 1.0, 1.0)
	cairo:Text(fs.fps, 0.0, 0.0, 20.0, "Comic Sans MS")

	cairo:Source(1.0, 0.0, 1.0)
	cairo:Text(fs.ft, 0.0, 20.0, 20.0, "Segoe Script")

	cairo:Source(1.0, 0.0, 0.0)
	cairo:SelectFont("Tahoma", TextSlant.Italic)
	cairo:Text("Time: " .. Engine.Time(), 0.0, 40.0)
end
