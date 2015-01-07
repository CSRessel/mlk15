class Art < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  validates :artist, presence: true
  validates :image, presence: true
end
