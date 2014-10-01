class Article < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  validates :title, presence: true, length: { minimum: 3, maximum: 60 }
  validates :body, presence: true
  has_many :comments

  def publish!
    self.published = true
    save!
  end
end
