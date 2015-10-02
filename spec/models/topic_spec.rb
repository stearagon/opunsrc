require 'rails_helper'

describe Topic do

  describe '#initialize' do

    let(:user) do
      User.create!(name: "Andy", handle: "Steve", password: "baddbadd", email: "john@gmail.com")
    end

    it 'creates topic with default user_id of 1 if none is provided' do
      topic = Topic.new(title: 'test')
      expect(topic.user_id).to eq(1)
    end


    it 'can assign user_id' do
      topic = Topic.create(title: 'test', user_id: 2)
      expect(topic.user_id).to eq(2)
    end

    it 'validates existence of associated user' do
      topic = Topic.new(title: 'test', user_id: user.id + 1)
      expect(topic.save).to eq(false)
      topic.user_id = user.id
      expect(topic.save).to eq(true)
    end

  end

end
