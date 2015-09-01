# == Schema Information
#
# Table name: puns
#
#  id         :integer          not null, primary key
#  term       :string           not null
#  pun        :string           not null
#  example    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Pun < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:term, :pun, :topics_titles]
  validates :term, :pun, :example, presence: true

  has_many :topics_puns
  has_many :topics, through: :topics_puns, source: :topic
  has_many :likes, as: :likeable

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

  def topics_titles
    result = []
    topics.each do |topic|
      result << topic.title
    end
    return result
  end

end
