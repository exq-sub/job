class User < ApplicationRecord
validates :name, {presence: true}
validates :email, {uniqueness: true, presence: true}
validates :password, {uniqueness: true, presence: true}

def posts
    return Post.where(user_id: self.id)
  end
  
end
