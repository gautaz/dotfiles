hs.window.animationDuration = 0

hs.hotkey.bind({"cmd", "alt"}, "C", function()
	hs.toggleConsole()
end)

hs.hotkey.bind({"cmd", "alt"}, "R", function()
	hs.reload()
end)

hs.hotkey.bind({"cmd", "alt"}, "LEFT", function()
	local win = hs.window.focusedWindow()
	if win then
		local f = win:frame()
		local max = win:screen():frame()
		f.x = max.x
		f.y = max.y
		f.w = max.w * 0.6
		f.h = max.h
		win:setFrame(f)
	end
end)

hs.hotkey.bind({"cmd", "alt"}, "RIGHT", function()
	local win = hs.window.focusedWindow()
	if win then
		local f = win:frame()
		local max = win:screen():frame()
		f.x = max.w * 0.6
		f.y = max.y
		f.w = max.w * 0.4
		f.h = max.h
		win:setFrame(f)
	end
end)
