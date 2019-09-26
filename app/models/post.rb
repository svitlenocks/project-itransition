class Post < ApplicationRecord
    belongs_to :compaign
    has_one_attached :image
    validates :title, presence: true, length: { maximum: 135 } 
    validates :description, presence: true, length: { minimum: 42 }

    validate :correct_image_type

    def thumbnail
      return self.image.variant(resize: '800x800')
    end

    private

  def correct_image_type
    if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
        errors.add(:image, 'must be a JPEG or PNG.')
    end
  end
end
