class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  validates :name, presence: true,
                   length: { minimum: 5 }
  validates :start_date, presence: true
  validates :end_date, presence: true
end
