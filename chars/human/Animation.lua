local Animation = {}
Animation.last = 'front'
Animation.current = 'front'
Animation.next = nil

local function walking(name)
	Animation.next = name
	Animation.last = Animation.next
end

function Animation.walkingRight()
	walking('front_right')
end

function Animation.walkingLeft()
	walking('front_left')
end 

function Animation.walkingDown()
	walking('front')
end

function Animation.walkingUp()
	walking('back')
end

function Animation.walkingUpRight()
	walking('back_right')
end

function Animation.walkingUpLeft()
	walking('back_left')
end

function Animation.idle(game_object)
	if game_object.moving ~= true then
		Animation.next = 'idle_' .. Animation.last:gsub('back', 'front')
	end
end

function Animation.apply(sprite)
	if Animation.next ~= Animation.current then
		sprite.play_flipbook('#human_sprite', Animation.next)
		Animation.current = Animation.next
	end
end

return Animation