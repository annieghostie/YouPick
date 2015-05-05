# == Schema Information
#
# Table name: restaurants
#
#  id             :integer          not null, primary key
#  name           :string
#  link           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  yelp_id        :string
#  list_id        :integer
#  listname       :string
#  image_url      :string
#  address        :string
#  rating_img_url :string
#  review_count   :integer
#

class Restaurant < ActiveRecord::Base
	has_many :memberships, :dependent => :destroy
	has_many :lists, :through => :memberships
	#delegate :lists, :to => :memberships
end
