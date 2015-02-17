class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.has_many :restaurant
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :lists, :users
  end
end
