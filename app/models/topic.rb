class Topic < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true

  has_many :topic_puns
  has_many :puns, through: :topic_puns, source: :puns
end
