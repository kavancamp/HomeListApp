class AddImageToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :photo, :string
    add_column :accounts, :company, :string
  end
end
