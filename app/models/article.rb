class Article < ActiveRecord::Base
  belongs_to :author, class_name: 'User'

  def publish!
    self.published = true
    save!
  end
end
