class AddDescriptionToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :description, :text
  end
end
