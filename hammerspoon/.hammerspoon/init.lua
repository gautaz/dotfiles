hs.window.animationDuration = 0
local log = hs.logger.new('local', 'info')
local ratio = 0.6
local epsilon = 0.05

for i,line in ipairs(hs.screen.primaryScreen():availableModes()) do
	log.d(line)
end

hs.hotkey.bind({"cmd", "alt"}, "C", function()
	hs.toggleConsole()
end)

hs.hotkey.bind({"cmd", "alt"}, "R", function()
	hs.reload()
end)

for i=3,7 do
	hs.hotkey.bind({"cmd", "alt"}, tostring(i), function()
		ratio = i/10
	end)
end

hs.hotkey.bind({"cmd", "alt"}, "LEFT", function()
	local win = hs.window.focusedWindow()
	if win then
		local frame = win:frame()
		local screen = win:screen():frame()
		local newFrame
		if math.abs(frame.x - screen.x) / screen.w > epsilon then
			log.d('resize')
			newFrame = hs.geometry.rect(screen.x, frame.y, frame.w + frame.x - screen.x, frame.h)
		elseif math.abs(frame.w - screen.w * ratio) / screen.w > epsilon then
			log.d('move')
			newFrame = hs.geometry.rect(screen.x, frame.y, screen.w * ratio, frame.h)
		else
			log.d('splash')
			newFrame = hs.geometry.rect(screen.x, screen.y, screen.w * ratio, screen.h)
		end
		log.d(newFrame)
		win:setFrame(newFrame)
	end
end)

hs.hotkey.bind({"cmd", "alt"}, "UP", function()
	local win = hs.window.focusedWindow()
	if win then
		local frame = win:frame()
		local screen = win:screen():frame()
		local newFrame
		if math.abs(frame.y - screen.y) / screen.h > epsilon then
			log.d('resize')
			newFrame = hs.geometry.rect(frame.x, screen.y, frame.w, frame.h + frame.y - screen.y)
		elseif math.abs(frame.h - screen.h * ratio) / screen.h > epsilon then
			log.d('move')
			newFrame = hs.geometry.rect(frame.x, screen.y, frame.w, screen.h * ratio)
		else
			log.d('splash')
			newFrame = hs.geometry.rect(screen.x, screen.y, screen.w, screen.h * ratio)
		end
		log.d(newFrame)
		win:setFrame(newFrame)
	end
end)

hs.hotkey.bind({"cmd", "alt"}, "RIGHT", function()
	local win = hs.window.focusedWindow()
	if win then
		local frame = win:frame()
		local screen = win:screen():frame()
		local newFrame
		if math.abs(frame.x2 - screen.x2) / screen.w > epsilon then
			log.d('resize')
			newFrame = hs.geometry.rect(frame.x, frame.y, screen.w + screen.x - frame.x, frame.h)
		elseif math.abs(frame.w - screen.w * (1 - ratio)) / screen.w > epsilon then
			log.d('move')
			newFrame = hs.geometry.rect(screen.x + screen.w * ratio, frame.y, screen.w * (1 - ratio), frame.h)
		else
			log.d('splash')
			newFrame = hs.geometry.rect(screen.x + screen.w * ratio, screen.y, screen.w * (1 - ratio), screen.h)
		end
		log.d(newFrame)
		win:setFrame(newFrame)
	end
end)

hs.hotkey.bind({"cmd", "alt"}, "DOWN", function()
	local win = hs.window.focusedWindow()
	if win then
		local frame = win:frame()
		local screen = win:screen():frame()
		local newFrame
		if math.abs(frame.y2 - screen.y2) / screen.h > epsilon then
			log.d('resize')
			newFrame = hs.geometry.rect(frame.x, frame.y, frame.w, screen.h + screen.y - frame.y)
		elseif math.abs(frame.h - screen.h * (1 - ratio)) / screen.h > epsilon then
			log.d('move')
			newFrame = hs.geometry.rect(frame.x, screen.y + screen.h * ratio, frame.w, screen.h * (1 - ratio))
		else
			log.d('splash')
			newFrame = hs.geometry.rect(screen.x, screen.y + screen.h * ratio, screen.w, screen.h * (1 - ratio))
		end
		log.d(newFrame)
		win:setFrameInScreenBounds(newFrame)
	end
end)
