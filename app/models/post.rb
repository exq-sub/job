class Post < ApplicationRecord
  validates :job, {presence: true, length:{maximum: 30}}
  validates :region,{presence: true, length:{maximum: 30}}
  validates :allowance,{presence: true, length:{maximum: 30}}
  validates :detail,{presence: true, length:{maximum: 400}}

def user
  return User.find_by(id: self.user_id)
end

end
