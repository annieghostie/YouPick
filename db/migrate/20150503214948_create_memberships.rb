class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :restaurant_id
      t.integer :list_id

      t.timestamps null: false
    end
  end
end
