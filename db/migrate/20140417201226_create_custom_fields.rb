class CreateCustomFields < ActiveRecord::Migration
  def change
    create_table :custom_fields do |t|
      t.string :name
      t.string :parent_type
      t.string :field_type
      t.string :displayed

      t.timestamps
    end
  end
end
