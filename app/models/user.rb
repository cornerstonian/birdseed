class User < ActiveRecord::Base
    has_secure_password
    validates :username, presence: :true
    has_many :posts, dependent: :destroy
    acts_as_followable
    acts_as_follower


   def timeline
     follower_ids = following_users.pluck(:id)
     all_ids = follower_ids << user.id
     Post.where(user_id: all_ids).order("created_at DESC")
 end
end
