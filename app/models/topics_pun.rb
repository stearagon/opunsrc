class TopicsPun < ActiveRecord::Base
  belongs_to :pun
  belongs_to :topic
end
