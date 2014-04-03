class AddClientSecretToAccesses < ActiveRecord::Migration
  def change
    add_column :accesses, :client_secret, :string
    add_column :accesses, :client_id, :string
    add_column :accesses, :client_callback_url, :string
  end
end
