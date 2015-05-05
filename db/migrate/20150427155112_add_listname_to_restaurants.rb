class AddListnameToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :listname, :string
  end
end
