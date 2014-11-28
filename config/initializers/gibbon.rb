if Rails.env.development?
	OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
end
Gibbon::API.api_key = ENV["MAILCHIMP_API"]
Gibbon::API.timeout = 15
Gibbon::API.throws_exceptions = false