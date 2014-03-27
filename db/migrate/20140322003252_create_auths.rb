class CreateAuths < ActiveRecord::Migration
  def change
    create_table :auths do |t|
      t.string :token
      t.string :secret
      t.string :username

      t.timestamps
    end
  end
end
