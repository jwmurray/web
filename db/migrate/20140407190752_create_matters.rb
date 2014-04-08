class CreateMatters < ActiveRecord::Migration
  def change
    create_table :matters do |t|
      t.string :case_number
      t.integer :judge_id
      t.integer :commissioner_id
      t.integer :client_id
      t.integer :opp_id
      t.integer :court_id

      t.timestamps
    end
  end
end
