# == Schema Information
#
# Table name: memberships
#
#  id            :integer          not null, primary key
#  restaurant_id :integer
#  list_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Membership < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :list
end
