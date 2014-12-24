class Workshop < ActiveRecord::Base
  validates :title, presence: true
  validates :blurb, presence: true
end
