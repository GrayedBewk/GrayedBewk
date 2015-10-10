class AddColumnsToGrade < ActiveRecord::Migration
  def change
    add_column :grades, :grade, :integer
    add_column :grades, :date, :date
  end
end
