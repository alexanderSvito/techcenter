class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :link
      t.string :imageable_type
      t.timestamps null: false
    end
  end
end
