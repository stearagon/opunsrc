class RequestsPun < ActiveRecord::Base
  validates :request_id, :pun_id, presence: true

  has_many :requests
  has_many :puns
end
