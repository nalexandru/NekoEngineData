require 'NeEngine'

NeComponent = { name = "FrameStats" }

function Init(fs, args)
	if Engine.PluginLoaded("CairoUI") then
		fs.owner:AddComponent("CairoContext")
	else
		fs.owner:AddComponent("UIContext")
	end

	fs.time = 0.0
	fs.frames = 0

	return true
end

function Term(fs)
end
