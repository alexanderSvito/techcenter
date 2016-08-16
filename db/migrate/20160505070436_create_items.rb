class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :group
      t.integer :price
      t.text :description
      t.text :details
      t.attachment :avatar
    end
  end
end
