class CreateBatches < ActiveRecord::Migration[5.0]
  def change
    create_table :batches do |t|
      t.references :cohort, foreign_key: true

      t.timestamps
    end
  end
end
