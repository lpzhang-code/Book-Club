class User < ApplicationRecord
    def self.from_omniauth(auth_hash)
        user = find_or_create_by(uid: auth_hash['uid'])
        user.name = auth_hash['info']['name']
        user.image_url = auth_hash['info']['image']
        user.url = auth_hash['info']['urls']['Facebook']
        user.save!
        user
    end
end
