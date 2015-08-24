class RemoveColumnFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :custmer_token, :string
    add_column :users, :customer_token, :string
  end
end
