class User < ApplicationRecord
    has_many :books, dependent: :destroy
    
    # find people our user is following through active relationships
    has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
    has_many :following, through: :active_relationships, source: :followed
    # find people following our user through passive relationships
    has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
    has_many :followers, through: :passive_relationships
    
    def self.from_omniauth(auth_hash)
        user = find_or_create_by(uid: auth_hash['uid'])
        user.name = auth_hash['info']['name']
        user.image_url = auth_hash['info']['image']
        user.url = auth_hash['info']['urls']['Facebook']
        user.save!
        user
    end
end
