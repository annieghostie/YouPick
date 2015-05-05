class RemoveListFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :list, :string
  end
end
