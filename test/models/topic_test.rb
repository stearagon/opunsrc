# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          default(1), not null
#

require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  describe Topic do
    let(:topic) { Topic.new(title: "New Topic")}

    it "has a title attribute" do
      expect(topic.titile).to eq("New Topic")
    end
  end
end
