class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :name
      t.string :details
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
