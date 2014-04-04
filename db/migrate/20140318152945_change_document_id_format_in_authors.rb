class ChangeDocumentIdFormatInAuthors < ActiveRecord::Migration
  def change
    change_column :authors, :document_id, :integer
  end
end
