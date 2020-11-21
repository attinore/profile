class User < ActiveRecord::Base
  has_many :posts
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: /\A.*@.*\.com\z/ }
  before_validation :delete_spaces
  after_create :send_email

  private

  def delete_spaces
    self.email = email.strip unless email.nil?
  end

  def send_email
    FakeMailer.instance.mail('boris@lewagon.org', 'Welcome to HN!')
  end
end
