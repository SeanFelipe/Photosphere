class CreateExecutionRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :execution_records do |t|
      t.datetime :exec_time
      t.string :result
      t.text :details
      t.belongs_to :test_case, null: false, foreign_key: true

      t.timestamps
    end
  end
end
