class Workshop < ActiveRecord::Base
  validates :title, presence: true
end
