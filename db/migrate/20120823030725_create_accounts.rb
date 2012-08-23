class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :number
      t.boolean :active
      t.integer :user_id

      t.timestamps
    end
  end
end
