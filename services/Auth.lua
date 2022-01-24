local Auth = {}
local PlayFabClientApi = require('PlayFab.PlayFabClientApi')
local IPlayFabHttps = require('PlayFab.IPlayFabHttps')
local PlayFabHttps_Defold = require('PlayFab.PlayFabHttps_Defold')
IPlayFabHttps.SetHttp(PlayFabHttps_Defold)

PlayFabClientApi.settings.titleId = 'A332B'

local function on_login_success(result)
	print('success')
end

local function on_login_failed(error)
	print('error', error.errorMessage)
end

function Auth.login_with_custom_id(custom_id)
	local login_request = {
		TitleId = PlayFabClientApi.settings.titleId,
		CustomId = custom_id,
		CreateAccount = true
	}
	
	PlayFabClientApi.LoginWithCustomID(login_request, on_login_success, on_login_failed)
end

return Auth