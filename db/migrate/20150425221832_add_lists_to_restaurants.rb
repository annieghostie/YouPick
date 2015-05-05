class AddListsToRestaurants < ActiveRecord::Migration
  def change
    add_reference :restaurants, :list, index: true
    add_foreign_key :restaurants, :lists
  end
end
