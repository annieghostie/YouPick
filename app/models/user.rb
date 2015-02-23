# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  string     :string
#  email      :string
#  password   :string
#  list       :string
#  has_many   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
end
