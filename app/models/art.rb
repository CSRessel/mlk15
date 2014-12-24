class Art < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :artist, presence: true
  validates :image, presence: true
end
