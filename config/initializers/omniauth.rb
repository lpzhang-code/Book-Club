Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1027300150662049', '680f5dc0c2835c2bf03f8c759d982f18',
    scope: 'public_profile', info_fields: 'id,name,link'
end