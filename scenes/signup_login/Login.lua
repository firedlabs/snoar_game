local monarch = require('monarch.monarch')

local Login = {}


Login.user = ''

function Login.logged_user()
	if Login.user ~= '' then
		monarch.show('plakoskoya')
	end
end

function Login:typing(action_id, action)
	if action_id == hash('type') and string.len(self.user) < 15 then
		local user_text_input = gui.get_node('user/text_input')
		self.user = self.user .. action.text
		gui.set_text(user_text_input, self.user)
		return false
	end
	if action_id == hash('backspace') and action.repeated then
		local user_text_input = gui.get_node('user/text_input')
		local user_len = string.len(self.user)
		self.user = string.sub(self.user, 0, user_len - 1)
		gui.set_text(user_text_input, self.user)
		return false
	end
end

return Login