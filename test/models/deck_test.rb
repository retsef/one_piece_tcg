# == Schema Information
#
# Table name: decks
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  leader_id  :integer
#
# Indexes
#
#  index_decks_on_leader_id  (leader_id)
#
# Foreign Keys
#
#  leader_id  (leader_id => cards.id)
#
require 'test_helper'

class DeckTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
