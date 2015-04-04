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
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #validates :name, :presence=>true, :length=> {:minimum=>3}, :uniqueness=>true
  #validates :password, :presence=>true, :length=>{:minimum=>6}
end
