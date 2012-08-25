class CreateBroadcasts < ActiveRecord::Migration
  def change
    create_table :broadcasts do |t|
      t.text :message
      t.references :account
      t.references :user

      t.timestamps
    end
  end
end
