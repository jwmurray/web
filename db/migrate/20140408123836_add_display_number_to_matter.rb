class AddDisplayNumberToMatter < ActiveRecord::Migration
  def change
    add_column :matters, :display_number, :string
  end
end
