class AddListsToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :lists, index: true
  end
end
