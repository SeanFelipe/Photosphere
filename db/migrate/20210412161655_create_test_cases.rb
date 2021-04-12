class CreateTestCases < ActiveRecord::Migration[6.1]
  def change
    create_table :test_cases do |t|

      t.timestamps
    end
  end
end
