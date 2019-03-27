class AddPasswordDigestAndTokenColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :password_digest, :string
    add_column :users, :authentication_token, :string, limit: 30
  end
end
