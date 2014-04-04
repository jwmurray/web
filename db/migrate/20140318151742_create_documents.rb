class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :location
      t.string :title
      t.string :author
      t.string :text
      t.binary :image

      t.timestamps
    end
  end
end
