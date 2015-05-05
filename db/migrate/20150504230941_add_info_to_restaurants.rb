class AddInfoToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :image_url, :string
    add_column :restaurants, :address, :string
    add_column :restaurants, :rating_img_url, :string
    add_column :restaurants, :review_count, :integer
  end
end
