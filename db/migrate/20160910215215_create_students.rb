class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name
      t.references :cohort, foreign_key: true

      t.timestamps
    end
  end
end
