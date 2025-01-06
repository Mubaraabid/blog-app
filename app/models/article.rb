class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }
  validates :body, presence: true, length: { minimum: 10 }

  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_one_attached :image

  attr_accessor :crop_x, :crop_y, :crop_width, :crop_height

  after_commit :crop_image, if: :should_crop_image?

  private

  def should_crop_image?
    image.attached? && crop_x.present? && crop_y.present? && crop_width.present? && crop_height.present? && !@image_processing
  end

  def crop_image

    @image_processing = true

    blob = image.blob

    image_path = ActiveStorage::Blob.service.send(:path_for, blob.key)
    processed_image = MiniMagick::Image.open(image_path)

    processed_image.crop "#{crop_width}x#{crop_height}+#{crop_x}+#{crop_y}"

    processed_image_io = StringIO.new
    processed_image.write(processed_image_io)
    processed_image_io.rewind

    image.attach(io: processed_image_io,
                 filename: blob.filename,
                 content_type: blob.content_type)

    @image_processing = false
  end
end
