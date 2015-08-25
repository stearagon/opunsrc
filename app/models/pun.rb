class Pun < ActiveRecord::Base
  validates :term, :pun, :example, presence: true

  has_and_belongs_to_many :topics
end
