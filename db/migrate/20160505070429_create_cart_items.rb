class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.belongs_to :cart
      t.integer :item_id
      t.string :name
      t.float :price
      t.string :group
      t.timestamps null: false
    end
  end
end
