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

class Topic < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:title]
  validates :title, presence: true, uniqueness: true

  has_many :topics_puns
  has_many :puns, through: :topics_puns, source: :pun
  has_many :likes, as: :likeable, dependent: :destroy

  def self.top_20
    Topic
      .joins("LEFT OUTER JOIN likes ON likes.likeable_id = topics.id")
      .group("topics.id")
      .order("COUNT(likes.id) DESC")
      .limit(20)
  end

end
