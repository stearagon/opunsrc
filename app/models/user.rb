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
  validates :handle, :email, :session_token, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: { length: 8, allow_nil: true }

  def self.reset_session_token

  end

  def is_password?(password)

  end
  

end
