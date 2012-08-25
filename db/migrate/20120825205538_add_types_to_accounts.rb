class AddTypesToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :broadcast, :boolean

    add_column :accounts, :conference, :boolean

  end
end
