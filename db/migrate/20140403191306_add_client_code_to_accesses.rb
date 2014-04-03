class AddClientCodeToAccesses < ActiveRecord::Migration
  def change
    add_column :accesses, :client_code, :string
  end
end
