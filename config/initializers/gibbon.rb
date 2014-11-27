if Rails.env.development?
	OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
end
Gibbon::API.api_key = "daf93b2ecedad883859bf5a3d87f4267-us9"
Gibbon::API.timeout = 15
Gibbon::API.throws_exceptions = false