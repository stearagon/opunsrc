class Topic < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true

  has_and_belongs_to_many :puns
end
