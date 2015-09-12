# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  stars      :integer          not null
#  pun_id     :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Rating < ActiveRecord::Base
  validates :stars, :pun_id, presence: true

  belongs_to :puns

end
