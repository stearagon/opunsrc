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
#  user_id    :integer          default(1), not null
#

class Pun < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:term, :pun, :topics_titles]
  validates :term, :pun, :example, presence: true
  validates :topics, presence: true

  has_many :topics_puns
  has_many :topics, through: :topics_puns, source: :topic
  # has_many :likes, as: :likeable
  has_many :requests_puns
  has_many :requests, through: :requests_puns, source: :requests
  has_many :ratings, dependent: :destroy

  def self.top_20
    Pun
      .all
      .sort_by { |pun| pun.average_rating }[0..19]
  end

  def update_tags(tags, current_user)
    tags = tags.split("#")[1..-1].map { |tag| tag.strip }
    self.topics.each_with_index do |topic, idx|
      if !tags.include?(topic.title)
        self.topics.delete(topic)
      else
        tags.delete(topic.title)
      end
    end

    tags.each do |tag|
      new_tag = Topic.new(title: tag, user_id: current_user.id)

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

  def average_rating
    return -1 if self.ratings.empty?
    total = 0
    count = 0
    self.ratings.each do |rating|
      total += rating.stars
      count += 1
    end
    total/count
  end

end
