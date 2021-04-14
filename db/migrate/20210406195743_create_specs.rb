class CreateSpecs < ActiveRecord::Migration[6.1]
  def change
    create_table :specs do |t|
      t.string :summary
      t.string :description
      t.string :automationStatus

      t.timestamps
    end
  end
end
