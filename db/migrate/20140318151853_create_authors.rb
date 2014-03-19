class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :document_id
      t.string :relationship

      t.timestamps
    end
  end
end
