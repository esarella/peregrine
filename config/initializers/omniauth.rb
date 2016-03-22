Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Rails.application.secrets.twitter_api_key,
                     Rails.application.secrets.twitter_api_secret

  provider :facebook, Rails.application.secrets.facebook_api_key,
                      Rails.application.secrets.facebook_api_secret,
                      image_size: 'large'

  provider :google_oauth2, Rails.application.secrets.google_api_key,
                           Rails.application.secrets.google_api_secret      

end