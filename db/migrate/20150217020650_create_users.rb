class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :string
      t.string :email
      t.string :string
      t.string :password
      t.string :string
      t.string :list
      t.string :has_many

      t.timestamps null: false
    end
  end
end
