class Workshop < ActiveRecord::Base
  validates :title
  validates :blurb, presence: true
end
