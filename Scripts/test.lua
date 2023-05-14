require "NeSystem"
require "NeEngine"
require "NeRender"

Engine.Log("Script", Log.Debug, "Script runtime " .. _VERSION)
Engine.Log("Script", Log.Debug, "Script API version " .. NE_SCRIPT_API)
Engine.Log("Script", Log.Debug, "NekoEngine " .. NE_VERSION .. " running on " .. System.OS() .. " " .. System.OSVersion())

local v1 = NeVec4(2.0, 3.0, 4.0, 1.0)
local v2 = NeVec4(4.0, 3.0, 2.0, 1.0)
Engine.Log("Script", Log.Debug, "vec4 " .. tostring(v1) .. " + " .. tostring(v2) .. " = " .. tostring(v1 + v2))

--[[
local rp = NeRenderPassDesc({
	output = { { format = "swapchain" } },
	depth = { format = 0, load = 1 }
});
local pipeline = NeGraphicsPipeline({
	flags = 15,-- RE_TOPOLOGY_TRIANGLES | RE_POLYGON_FILL | RE_CULL_NONE |
			--	RE_FRONT_FACE_CW | RE_DEPTH_TEST | RE_DEPTH_OP_GREATER_EQUAL,
	vertexDesc = {
		attributes = { { location = 0, binding = 0, format = 32, offset = 0, semantic = 1 } },
		bindings = { { binding = 0, stride = 12 } }
	},
	pushConstantSize = 96,
	blendAttachments = {
		{ enableBlend = false }
	},
	shader = "Sky",
	renderPassDesc = "material"
});
local fb = NeFramebuffer({
	width = E.ScreenWidth(),
	height = E.ScreenHeight(),
	attachments = {
		{ format = "swapchain" },
		{ format = 0, usage = 1 }
	},
	renderPassDesc = rp
});]]


--local cb = NeCommandBuffer(0)

--cb:BindVertexBuffers(2, { 0, 10 }, { 16, 32 })
--cb:PushConstants(0x7FFFFFFF, { NeMatrix(), NeVec4() })

--cb:Execute()

--[[
local fb = Re.CreateFramebuffer({
	attachmentCount = 1,
	attachments = { { usage = 16 | 2, format = Re.SwapchainFormat() } },
	width = E.ScreenWidth(),
	height = E.ScreenHeight(),
	layers = 1,
	renderPassDesc = Re.MaterialRenderPassDesc()
})

Re.DestroyFramebuffer(fb)
]]
