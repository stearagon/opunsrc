# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  handle          :string           not null
#  name            :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  attr_reader :password
  validates :handle, :email, :session_token, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, length: { minimum: 8, allow_nil: true }

  after_initialize :ensure_session_token

  has_many :likes
  has_many :liked_topics, through: :likes, source: :likeable, source_type: "Topic"
  has_many :puns
  has_many :ratings

  def self.find_by_credentials(handle, password)
    user = User.find_by(handle: handle)
    return nil unless user && user.is_password?(password)
    user
  end

  def self.top_20
    User.joins(:puns).group("users.id").order("COUNT(puns.id)").limit(20)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def average_pun_rating
    rating = 0
    count = 0
    self.puns.each do |pun|
      rating += pun.average_rating
      count+=1
    end
    rating/count
  end

  private
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end


end
