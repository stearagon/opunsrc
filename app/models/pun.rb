class Pun < ActiveRecord::Base
  validates :term, :pun, :example, presence: true

  belongs_to :topic_pun
  belongs_to :topic, through: :topic_pun, source: :topic
end
