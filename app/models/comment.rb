class Comment < ActiveRecord::Base
  after_initialize :default_values
  belongs_to :article

  def approve!
    approved = true
    save!
  end

  private

  def default_values
    self.approved ||= false
  end
end
