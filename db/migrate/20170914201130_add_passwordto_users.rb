class AddPasswordtoUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :Users, :password_digest, :string
  end
end
