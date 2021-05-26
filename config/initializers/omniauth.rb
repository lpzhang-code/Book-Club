Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, secrets.APP_ID, secrets.APP_SECRET,
    scope: 'public_profile', info_fields: 'id,name,link'
end