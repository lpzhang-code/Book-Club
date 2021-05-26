Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '591109025188461', 'cc55a675f1234b455a99dcb2c6648752',
    scope: 'public_profile', info_fields: 'id,name,link'
end