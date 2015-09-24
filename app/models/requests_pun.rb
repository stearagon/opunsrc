# == Schema Information
#
# Table name: requests_puns
#
#  request_id :integer          not null
#  pun_id     :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class RequestsPun < ActiveRecord::Base
  validates :request_id, :pun_id, presence: true

  has_many :requests
  has_many :puns
end
