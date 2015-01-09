class Photo < ActiveRecord::Base
  validates :name, presence: true
end
