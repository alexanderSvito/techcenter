class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.belongs_to :item
      t.belongs_to :user
      t.float :rate
      t.text :review
      t.timestamps null: false
    end
  end
end
