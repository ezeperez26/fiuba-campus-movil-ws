# == Schema Information
#
# Table name: locations
#
#  id               :integer          not null, primary key
#  latitude         :string
#  longitude        :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  profile_id       :integer
#  last_update_time :string
#

require 'rails_helper'

RSpec.describe Location, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
end
