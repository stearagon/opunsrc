class Pun < ActiveRecord::Base
  validates :term, :pun, :example, presence: true

  has_many :topics_puns
  has_many :topics, through: :topics_puns, source: :topic

  def update_tags(tags)
    tags = tags.split
    self.topics.each_with_index do |topic, idx|
      if !tags.include?("#" + topic.title)
        self.topics.delete(topic)
      else
        tags.delete("#" + topic.title)
      end
    end

    tags.each do |tag|
      tag.slice!(0)
      new_tag = Topic.new(title: tag)

      if new_tag.save
        self.topics << new_tag
      else
        self.topics << Topic.find_by_title(tag)
      end

    end

  end

end
