class CreatePaychecks < ActiveRecord::Migration
  def change
    create_table :paychecks do |t|
      t.belongs_to :user
      t.belongs_to :cart
      t.string :address
      t.string :number
      t.float :total
      t.timestamps null: false
    end
  end
end
