class Compaign < ApplicationRecord
  belongs_to :user
  has_many :benefits, dependent: :destroy
  validates :title, presence: true, length: { maximum: 135 } 
  validates :project_idea, presence: true, length: { maximum: 135 }
  validates :description, presence: true, length: { minimum: 42 }
  validates :goal, presence: true, numericality: true
end
