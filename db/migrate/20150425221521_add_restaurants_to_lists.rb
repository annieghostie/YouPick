class AddRestaurantsToLists < ActiveRecord::Migration
  def change
    add_reference :lists, :restaurants, index: true
  end
end
