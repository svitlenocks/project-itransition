class Compaign < ApplicationRecord
  belongs_to :user
  has_many :benefits, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  ratyrate_rateable "rating"
  has_one_attached :image
  validates :title, presence: true, length: { maximum: 135 } 
  validates :project_idea, presence: true, length: { maximum: 240 }
  validates :description, presence: true, length: { minimum: 42 }
  validates :goal, presence: true, numericality: true
  validate :correct_image_type

  YT_LINK_FORMAT = /(^$|\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([\A#\&\?]*).*)/i

  validates :video, format: YT_LINK_FORMAT

  def thumbnail
    return self.image.variant(resize: '800x800')
  end

  def card_image
    return self.image.variant(resize: '320x200!')
  end  

  private

  def correct_image_type
    if !image.attached?
      errors.add(:image, 'required.')
    elsif !image.content_type.in?(%w(image/jpeg image/png))
        errors.add(:image, 'must be a JPEG or PNG.')
     end
  end

end
