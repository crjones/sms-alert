class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :number
      t.string :name
      t.boolean :optin

      t.timestamps
    end
  end
end
