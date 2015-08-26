class Pun < ActiveRecord::Base
  validates :term, :pun, :example, presence: true

  has_many :topics_puns
  has_many :topics, through: :topics_puns, source: :topic
end
