# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  latitude   :string
#  longitude  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ActiveRecord::Base

belongs_to :profile
end
