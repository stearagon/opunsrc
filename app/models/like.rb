# == Schema Information
#
# Table name: likes
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  likeable_id   :integer
#  likeable_type :string
#  created_at    :datetime
#  updated_at    :datetime
#

class Like < ActiveRecord::Base
  belongs_to :likeable, polymorphic: true
  belongs_to :user
  
end
