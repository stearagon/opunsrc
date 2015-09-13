# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Topic < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:title]
  validates :title, presence: true, uniqueness: true

  has_many :topics_puns
  has_many :puns, through: :topics_puns, source: :pun
  has_many :likes, as: :likeable

  def self.top_20
    Topic
      .joins(:topics_puns, :puns)
      .group("topics.id")
      .order("COUNT(puns.id) DESC")
      .limit(20)
  end

end
