local monarch = require('monarch.monarch')

local Collision = {}

function Collision.furniture(message_id, message)
	if message_id == hash('contact_point_response') and message.group == hash('furniture') then
		local new_position = go.get_position() + message.normal * message.distance
		go.set_position(new_position)
	end
end

function Collision.interaction(message_id, message, self)
	if message_id == hash('collision_response') 
	and message.other_id == hash('/open_jet_lua')
	and self.key_interaction then
		monarch.show('fp_lua_jet_home')
	end
end

return Collision