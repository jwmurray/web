class CreateBylines < ActiveRecord::Migration
  def change
    create_table :bylines do |t|
      t.integer :document_id
      t.integer :product_id

      t.timestamps
    end
  end
end
