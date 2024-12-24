class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_one_attached :image

  attr_accessor :crop_x, :crop_y, :crop_width, :crop_height
 
  after_commit :crop_image, if: :should_crop_image?
  
  private
  
  def should_crop_image?
    image.attached? && crop_x.present? && crop_y.present? && 
    crop_width.present? && crop_height.present?
  end
  
  def crop_image
    return unless image.attached?

    blob = image.blob

    image_path = ActiveStorage::Blob.service.send(:path_for, blob.key)
    processed_image = MiniMagick::Image.open(image_path)
    
    processed_image.crop "#{crop_width}x#{crop_height}+#{crop_x}+#{crop_y}"
    
    temp_file = Tempfile.new(['cropped', File.extname(blob.filename.to_s)])
    processed_image.write(temp_file.path)
    
    image.attach(io: File.open(temp_file.path), 
                filename: blob.filename, 
                content_type: blob.content_type)
    
    temp_file.close
    temp_file.unlink
  end

  def update_like_count
    update_column(:likes_count, likes.count)
  end

end
