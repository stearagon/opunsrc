require 'rails_helper'

describe Topic do

  describe '#initialize' do

    it 'creates topic with default user_id of 1 if none is provided' do
      topic = Topic.new(title: 'test')
      expect(topic.user_id).to eq(1)
    end


    it 'can assign user_id' do
      topic = Topic.create(title: 'test', user_id: 2)
      expect(topic.user_id).to eq(2)
    end

  end

end
