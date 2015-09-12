# == Schema Information
#
# Table name: requests
#
#  id          :integer          not null, primary key
#  description :text             not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Request < ActiveRecord::Base
  validates :description, presence: true

  has_many :requests_puns
  has_many :puns, through: :requests_puns, source: :puns
end
