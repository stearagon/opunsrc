class TopicPun < ActiveRecord::Base
  has_many :puns
  belongs_to :topic
end
