class Topic < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true

  has_many :topics_puns
  has_many :puns, through: :topics_puns, source: :pun

end
