# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  stars      :integer          not null
#  pun_id     :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer          default(1), not null
#

class Rating < ActiveRecord::Base
  validates :stars, :pun_id, presence: true
  validates_associated :user
  validates_associated :pun
  validates :stars, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 5 }

  belongs_to :pun
  belongs_to :user

end
