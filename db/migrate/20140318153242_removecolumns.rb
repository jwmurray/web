class Removecolumns < ActiveRecord::Migration
  def change
    remove_column :documents, :document_id
  end
end
