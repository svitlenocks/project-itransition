class Benefit < ApplicationRecord
  belongs_to :compaign
  validates :reward, presence: true, length: { maximum: 135 } 
  validates :description, presence: true, length: { maximum: 135 }
  validates :sum, presence: true, numericality: true
end
