class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :string
      t.string :password
      t.string :string
      t.string :list

      t.timestamps null: false
    end
  end
end
