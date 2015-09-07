class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, :password_digest, :full_name, :custmer_token, :token
      t.boolean :admin, :active
      t.timestamps
    end
  end
end
