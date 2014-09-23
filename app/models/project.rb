class Project < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 60 }
  validates :technologies, presence: true, length: { maximum: 255 }
end
