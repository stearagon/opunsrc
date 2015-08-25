class Pun < ActiveRecord::Base
  validates :

  belongs_to :topic, inverse_of: :puns
end
