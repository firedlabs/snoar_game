local Animation = {}
Animation.last = 'idle_down'
Animation.current = 'idle_down'
Animation.next = nil

local function walking(name)
	Animation.last = Animation.next
	Animation.next = name
end

function Animation.walking_right()
	walking('walking_right')
end

function Animation.walking_left()
	walking('walking_left')
end 

function Animation.walking_down()
	walking('walking_down')
end

function Animation.walking_up()
	walking('walking_up')
end

function Animation.walking_up_right()
	walking('walking_up')
end

function Animation.walking_up_left()
	walking('walking_up')
end

function Animation.idle(game_object)
	if game_object.moving ~= true and Animation.last:match('^idle') == nil then
		Animation.next = 'idle_' .. Animation.last:gsub('walking_', '')
	end
end

function Animation.apply(sprite)
	if Animation.next ~= Animation.current and Animation.next ~= nil then
		sprite.play_flipbook('#human_sprite', Animation.next)
		Animation.current = Animation.next
	end
end

return Animation