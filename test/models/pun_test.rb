# == Schema Information
#
# Table name: puns
#
#  id         :integer          not null, primary key
#  term       :string           not null
#  pun        :string           not null
#  example    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          default(1), not null
#

require 'test_helper'

class PunTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
