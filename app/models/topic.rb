class Topic < ActiveRecord::Base
  has_many :puns, inverse_of: :topic
end
