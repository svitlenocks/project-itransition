class User < ApplicationRecord
  serialize :benefits, Array
  has_many :compaigns, dependent: :destroy
  has_many :comments, dependent: :destroy
  ratyrate_rater
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :name, presence: true
end