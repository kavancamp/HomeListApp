class AddProfilePictureToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :profile_picture, :string
    add_column :accounts, :company_name, :string
  end
end
