Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '690655477802422', '728ee274a470de0383b1c76766683eee',
    scope: 'public_profile', info_fields: 'id,name,link'
end