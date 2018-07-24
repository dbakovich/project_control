class Task < ApplicationRecord
  belongs_to :project
  has_many :users, dependent: :destroy
  validates :title, length: { minimum: 4 }
  validates :description, length: { maximum: 50 }
  validates :status, inclusion: { in: %w(new inprogress done) ,
  message: "%{value} is not a valid. Must be new, inprogress or done," }
end
