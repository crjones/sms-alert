class AddAccountToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :account_id, :integer

  end
end
