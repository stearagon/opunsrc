class Topic < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:title]
  validates :title, presence: true, uniqueness: true

  has_many :topics_puns
  has_many :puns, through: :topics_puns, source: :pun

end
