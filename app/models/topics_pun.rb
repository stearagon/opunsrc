# == Schema Information
#
# Table name: topics_puns
#
#  topic_id   :integer          not null
#  pun_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TopicsPun < ActiveRecord::Base
  belongs_to :pun
  belongs_to :topic
end
