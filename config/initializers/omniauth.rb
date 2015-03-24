Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['facebook_key'], ENV['facebook_secret']
  # provider :facebook, Figaro.env.facebook_key, Figaro.env.facebook_secret
end
