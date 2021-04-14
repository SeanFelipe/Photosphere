class CreateRunRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :run_records do |t|
      t.datetime :exec_time
      t.string :result
      t.text :details
      t.belongs_to :spec, null: false, foreign_key: true

      t.timestamps
    end
  end
end
