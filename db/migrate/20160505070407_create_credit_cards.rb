class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.string :number
      t.integer :user_id
      t.string :bank
      t.float :balance
      t.boolean :status, :default => false
      t.timestamps null: false
    end
  end
end
