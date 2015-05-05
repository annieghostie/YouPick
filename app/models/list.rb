# == Schema Information
#
# Table name: lists
#
#  id             :integer          not null, primary key
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#  restaurants_id :integer
#

class List < ActiveRecord::Base
  belongs_to :user
  has_many :memberships, :dependent => :destroy
  has_many :restaurants, :through => :memberships
  #delegate :restaurants, :to => :memberships
end
