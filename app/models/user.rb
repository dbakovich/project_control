class User < ApplicationRecord
  belongs_to :task
  validates :first_name, length: { minimum: 1 }
  validates :last_name, length: { minimum: 1 }
  validates :password, length: { minimum: 4 }
  validates :email, length: { minimum: 1 }
  validates :admin, inclusion: { in: %w(true false) ,
                                  message: "%{value} is not a valid. Must be new, inprogress or done," }
end
